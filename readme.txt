1.webapp/sql ���� ���� ��� ��(�ݵ�� �� ����), ���ν����� �Լ��� sqlplus���� ���.
2.product.csv�� db�� ����.
3. oracle id�� �ٲ۴�.
java/util/DatabaseUtil ����
webapp/cart_delete.jsp, cart_insert.jsp,login_verify.jsp,purchase_list.jsp,purchase_process.jsp, refund.jsp

4.webapp/main.jsp���� ���� ����.

product.csv�� db�� �ִ� ��
1. �Ʒ� ������ �޸��忡 �ٿ� product_control.ctl�� �����Ѵ�.
LOAD DATA
INFILE 'EBService\data\product.csv�� ������'
INTO TABLE PRODUCT
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(
product_id          INTEGER EXTERNAL,
product_name        CHAR,
price               INTEGER EXTERNAL,
detail              CHAR,
published_date      DATE "YYYY-MM-DD",
publisher           CHAR,
product_image       CHAR,
author              CHAR
)

2. CMD���� sqlldr �����Ѵ�.
sqlldr userid=����ŬID/����Ŭpassword control='product_control.ctl ������'

3. sqlplus���� �����͸� Ȯ���Ѵ�.
select * from product;