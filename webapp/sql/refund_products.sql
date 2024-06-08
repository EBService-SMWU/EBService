CREATE OR REPLACE PROCEDURE refund_products (
    p_user_id USERS.user_id%TYPE,
    p_product_ids SYS.ODCINUMBERLIST
) IS
    v_price PRODUCT.price%TYPE;
    v_total_refund NUMBER := 0;
    v_point USERS.point%TYPE;
    v_count NUMBER;
BEGIN
    -- ����� ����Ʈ ��ȸ
    SELECT point INTO v_point
    FROM USERS
    WHERE user_id = p_user_id;

    FOR i IN 1 .. p_product_ids.COUNT LOOP
        -- ��ǰ�� ���� �̷°� ȯ�� ���� Ȯ��
        SELECT COUNT(*)
        INTO v_count
        FROM HISTORY
        WHERE product_id = p_product_ids(i)
          AND user_id = p_user_id
          AND status_name != 'REFUNDED';

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, '��ǰ ID ' || p_product_ids(i) || '�� ȯ���� �Ұ����մϴ� (���� �̷� ���� Ȥ�� �̹� ȯ�ҵ�).');
        END IF;

        -- ��ǰ ���� ��ȸ
        SELECT price INTO v_price
        FROM PRODUCT
        WHERE product_id = p_product_ids(i);

        -- ȯ�� �ݾ� ����
        v_total_refund := v_total_refund + v_price;

        -- HISTORY ���̺��� ���¸� 'REFUNDED'�� ����
        UPDATE HISTORY
        SET status_name = 'REFUNDED'
        WHERE user_id = p_user_id
          AND product_id = p_product_ids(i)
          AND status_name != 'REFUNDED';
    END LOOP;

    -- ����Ʈ ȯ��
    UPDATE USERS
    SET point = point + v_total_refund
    WHERE user_id = p_user_id;

    COMMIT;

    -- ��� �޽��� 
    DBMS_OUTPUT.PUT_LINE('ȯ���� ���������� �Ϸ�Ǿ����ϴ�. ȯ�� �ݾ�: ' || v_total_refund || ', ȯ�� �� ����Ʈ: ' || (v_point + v_total_refund));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('����ڸ� ã�� �� �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�: ' || SQLERRM);
END refund_products;
/
