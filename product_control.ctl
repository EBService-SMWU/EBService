-- product_control.ctl
LOAD DATA
INFILE 'D:\project\databaseprogramming\EBService\data\product.csv'
INTO TABLE PRODUCT
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    product_id          INTEGER EXTERNAL,
    product_name        CHAR,
    price               INTEGER EXTERNAL,
    detail              CHAR,
    published_date      DATE "YYYYMMDD",
    publisher           CHAR,
    product_image       CHAR,
    author              CHAR
)
