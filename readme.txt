1.webapp/sql ���� ���� ��� ��, ���ν����� �Լ��� sqlplus���� ���.
2.product.csv�� db�� ����.
3.webapp/main.jsp���� ���� ����.

product.csv�� db�� �ִ� ��
1. **product_control.ctl**�� �����Ѵ�.

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