DROP DATABASE IF EXISTS FLOWER_SHOP;
CREATE DATABASE FLOWER_SHOP CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE FLOWER_SHOP;

#供應商資料表
DROP TABLE IF EXISTS MANUFACTURER;
CREATE TABLE MANUFACTURER(
	供應商編號 VARCHAR(10) NOT NULL UNIQUE,
    供應商名稱 VARCHAR(10) NOT NULL,
    供應商地址 VARCHAR(20) NOT NULL,
    供應商電話 VARCHAR(15) NOT NULL,
    聯絡人 varchar(10),
    統一編號 varchar(8) unique,
    PRIMARY KEY (供應商編號)
);
insert into MANUFACTURER value("m001","花媽的花店","桃園市中壢區彥霖路88號","0365629874","花媽","54526398");
insert into MANUFACTURER value("m002","花花公子","桃園市中壢區會長路5號","0354826374","帥章魚","21879635");
insert into MANUFACTURER value("m003","花的世界","桃園市中壢區國動路15號","0352638799","張偉航","25566398");
insert into MANUFACTURER value("m004","花惹發","桃園市中壢區團勳路66號","0388743210","張嘉航","63585268");
insert into MANUFACTURER value("m005","花王","桃園市中壢區阿航路37號","0369965841","張瑞辰","25363985");

#客戶資料表
DROP TABLE IF EXISTS CLIENTS;
CREATE TABLE CLIENTS(
	客戶編號 VARCHAR(10) NOT NULL UNIQUE,
    客戶姓名 VARCHAR(10) NOT NULL,
    電話 VARCHAR(10) NOT NULL,
    地址 VARCHAR(20) NOT NULL,
    性別 VARCHAR(1),
    PRIMARY KEY (客戶編號)
);
insert into CLIENTS value("c001","吳彥霖","0912446201","桃園市中壢區中北路01號","M");
insert into CLIENTS value("c002","陳澔恩","0965523965","桃園市中壢區中北路02號","M");
insert into CLIENTS value("c003","李啟源","0988795524","桃園市中壢區中北路03號","M");
insert into CLIENTS value("c004","黃昱睿","0988795524","桃園市中壢區中北路04號","F");
insert into CLIENTS value("c005","王吱軍","0955148663","桃園市中壢區中北路05號","M");

#商品資料表
DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT(
	產品編號 VARCHAR(10) NOT NULL UNIQUE,
    產品名稱 VARCHAR(10) NOT NULL,
    成本 INT NOT NULL,
    定價 INT NOT NULL,
    PRIMARY KEY (產品編號)
);
insert into PRODUCT value("pro001","杜鵑花",10,40);
insert into PRODUCT value("pro002","康乃馨",15,50);
insert into PRODUCT value("pro003","馬蹄蓮",20,70);
insert into PRODUCT value("pro004","雛菊",12,48);
insert into PRODUCT value("pro005","梔子屬",30,85);
insert into PRODUCT value("pro006","非洲菊",20,60);
insert into PRODUCT value("pro007","百合花",18,42);
insert into PRODUCT value("pro008","蘭花",23,75);
insert into PRODUCT value("pro009","玫瑰",30,90);
insert into PRODUCT value("pro010","向日葵",20,65);
insert into PRODUCT value("pro011","鬱金香",14,40);
insert into PRODUCT value("pro012","牡丹",24,53);
insert into PRODUCT value("pro013","大麗菊",16,48);
insert into PRODUCT value("pro014","金盞花",18,42);

#部門資料表
DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT(
	部門編號 VARCHAR(10) NOT NULL UNIQUE,
    部門名稱 VARCHAR(10) NOT NULL,
    主管 VARCHAR(10) NOT NULL,
    PRIMARY KEY (部門編號)
);
insert into DEPARTMENT value("d001","財務部","段浩恩");
insert into DEPARTMENT value("d002","採購部","郭睿桓");
insert into DEPARTMENT value("d003","行政部","張貝伃");
insert into DEPARTMENT value("d004","資訊部","唐伃萱");

#員工資料表
DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF(
	員工編號 VARCHAR(10) NOT NULL UNIQUE,
    員工姓名 VARCHAR(10) NOT NULL,
    部門編號 VARCHAR(10) NOT NULL,
    職稱 VARCHAR(10) NOT NULL,
    PRIMARY KEY (員工編號),
    FOREIGN KEY (部門編號) REFERENCES FLOWER_SHOP.DEPARTMENT (部門編號)
);
insert into STAFF value("s001","陳一一","d001","員工");
insert into STAFF value("s002","陳二二","d001","經理");
insert into STAFF value("s003","陳三三","d002","員工");
insert into STAFF value("s004","陳四四","d002","經理");
insert into STAFF value("s005","陳五五","d003","員工");
insert into STAFF value("s006","陳六六","d003","經理");
insert into STAFF value("s007","陳七七","d004","員工");
insert into STAFF value("s008","陳八八","d004","經理");

#訂單資料表
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
	訂單編號 VARCHAR(10) NOT NULL UNIQUE,
    訂單日期 DATE NOT NULL,
    客戶編號 VARCHAR(10) NOT NULL,
    員工編號 VARCHAR(10) NOT NULL,
    付款與否 VARCHAR(1),
    出貨與否 VARCHAR(1),
    PRIMARY KEY (訂單編號),
    FOREIGN KEY (客戶編號) REFERENCES FLOWER_SHOP.CLIENTS (客戶編號),
    FOREIGN KEY (員工編號) REFERENCES FLOWER_SHOP.STAFF (員工編號)
);
insert into ORDERS value("o001","2022/05/22","c001","s002","是","是");
insert into ORDERS value("o002","2022/05/22","c002","s005","是","是");
insert into ORDERS value("o003","2022/05/24","c003","s003","是","是");
insert into ORDERS value("o004","2022/05/28","c004","s003","是","是");
insert into ORDERS value("o005","2022/05/30","c005","s004","否","是");
insert into ORDERS value("o006","2022/06/01","c001","s006","否","是");
insert into ORDERS value("o007","2022/06/02","c002","s008","否","是");
insert into ORDERS value("o008","2022/06/04","c003","s007","是","否");
insert into ORDERS value("o009","2022/06/08","c004","s001","否","否");
insert into ORDERS value("o010","2022/06/10","c005","s004","否","否");
#訂單明細資料表
DROP TABLE IF EXISTS ORDERS_DETAILS;
CREATE TABLE ORDERS_DETAILS(
	訂單明細編號 VARCHAR(10) NOT NULL UNIQUE,
    訂單編號 VARCHAR(10) NOT NULL,
    產品編號 VARCHAR(10) NOT NULL,
    訂購數量 INT NOT NULL,
    PRIMARY KEY (訂單明細編號),
    FOREIGN KEY (訂單編號) REFERENCES FLOWER_SHOP.ORDERS (訂單編號),
    FOREIGN KEY (產品編號) REFERENCES FLOWER_SHOP.PRODUCT (產品編號)
);
insert into ORDERS_DETAILS value("od001","o001","pro003",5);
insert into ORDERS_DETAILS value("od002","o001","pro008",7);
insert into ORDERS_DETAILS value("od003","o001","pro002",3);
insert into ORDERS_DETAILS value("od004","o002","pro013",7);
insert into ORDERS_DETAILS value("od005","o002","pro001",4);
insert into ORDERS_DETAILS value("od006","o003","pro008",12);
insert into ORDERS_DETAILS value("od007","o004","pro006",5);
insert into ORDERS_DETAILS value("od008","o004","pro010",14);
insert into ORDERS_DETAILS value("od009","o005","pro011",2);
insert into ORDERS_DETAILS value("od010","o005","pro012",7);
insert into ORDERS_DETAILS value("od011","o005","pro002",10);
insert into ORDERS_DETAILS value("od012","o006","pro003",2);
insert into ORDERS_DETAILS value("od013","o006","pro002",5);
insert into ORDERS_DETAILS value("od014","o007","pro007",9);
insert into ORDERS_DETAILS value("od015","o007","pro003",2);
insert into ORDERS_DETAILS value("od016","o007","pro004",6);
insert into ORDERS_DETAILS value("od017","o008","pro005",4);
insert into ORDERS_DETAILS value("od018","o008","pro009",3);
insert into ORDERS_DETAILS value("od019","o009","pro002",9);
insert into ORDERS_DETAILS value("od020","o009","pro012",5);
insert into ORDERS_DETAILS value("od021","o010","pro006",3);
insert into ORDERS_DETAILS value("od022","o010","pro011",10);
insert into ORDERS_DETAILS value("od023","o010","pro001",9);

#採購資料表
DROP TABLE IF EXISTS PURCHASE;
CREATE TABLE PURCHASE(
	採購單編號 VARCHAR(10) NOT NULL UNIQUE,
    採購日期 DATE NOT NULL,
    供應商編號 VARCHAR(10) NOT NULL,
    員工編號 VARCHAR(10) NOT NULL,
    PRIMARY KEY (採購單編號),
    FOREIGN KEY (供應商編號) REFERENCES FLOWER_SHOP.MANUFACTURER (供應商編號),
    FOREIGN KEY (員工編號) REFERENCES FLOWER_SHOP.STAFF (員工編號)
);
insert into PURCHASE value("p001","2022/04/15","m002","s002");
insert into PURCHASE value("p002","2022/04/17","m003","s001");
insert into PURCHASE value("p003","2022/04/20","m001","s003");
insert into PURCHASE value("p004","2022/04/22","m004","s004");

#採購明細資料表
DROP TABLE IF EXISTS PURCHASE_DETAILS;
CREATE TABLE PURCHASE_DETAILS(
	採購明細編號 VARCHAR(10) NOT NULL UNIQUE,
    採購單編號 VARCHAR(10) NOT NULL,
    產品編號 VARCHAR(10) NOT NULL,
    採購數量 INT NOT NULL,
    付款與否 VARCHAR(1),
    PRIMARY KEY (採購明細編號),
    FOREIGN KEY (採購單編號) REFERENCES FLOWER_SHOP.PURCHASE (採購單編號),
    FOREIGN KEY (產品編號) REFERENCES FLOWER_SHOP.PRODUCT (產品編號)
);
insert into PURCHASE_DETAILS value("pd001","p001","pro002",50,"是");
insert into PURCHASE_DETAILS value("pd002","p001","pro005",50,"是");
insert into PURCHASE_DETAILS value("pd003","p001","pro009",50,"是");
insert into PURCHASE_DETAILS value("pd004","p002","pro001",50,"是");
insert into PURCHASE_DETAILS value("pd005","p002","pro003",50,"是");
insert into PURCHASE_DETAILS value("pd006","p002","pro010",50,"是");
insert into PURCHASE_DETAILS value("pd007","p003","pro004",50,"是");
insert into PURCHASE_DETAILS value("pd008","p003","pro008",50,"是");
insert into PURCHASE_DETAILS value("pd009","p003","pro012",50,"是");
insert into PURCHASE_DETAILS value("pd010","p003","pro013",50,"否");
insert into PURCHASE_DETAILS value("pd011","p004","pro006",50,"否");
insert into PURCHASE_DETAILS value("pd012","p004","pro007",50,"否");
insert into PURCHASE_DETAILS value("pd013","p004","pro011",50,"否");

select * from MANUFACTURER;
select * from CLIENTS;
select * from ORDERS;
select * from ORDERS_DETAILS;
select * from PRODUCT;
select * from PURCHASE;
select * from PURCHASE_DETAILS;
select * from STAFF;
select * from DEPARTMENT;


#資料備份
SELECT * INTO OUTFILE '/tmp/MANUFACTURER.txt' FROM FLOWER_SHOP.MANUFACTURER;
SELECT * INTO OUTFILE '/tmp/CLIENTS.txt' FROM FLOWER_SHOP.CLIENTS;
SELECT * INTO OUTFILE '/tmp/ORDERS.txt' FROM FLOWER_SHOP.ORDERS;
SELECT * INTO OUTFILE '/tmp/ORDERS_DETAILS.txt' FROM FLOWER_SHOP.ORDERS_DETAILS;
SELECT * INTO OUTFILE '/tmp/PRODUCT.txt' FROM FLOWER_SHOP.PRODUCT;
SELECT * INTO OUTFILE '/tmp/PURCHASE.txt' FROM FLOWER_SHOP.PURCHASE;
SELECT * INTO OUTFILE '/tmp/PURCHASE_DETAILS.txt' FROM FLOWER_SHOP.PURCHASE_DETAILS;
SELECT * INTO OUTFILE '/tmp/STAFF.txt' FROM FLOWER_SHOP.STAFF;
SELECT * INTO OUTFILE '/tmp/DEPARTMENT.txt' FROM FLOWER_SHOP.DEPARTMENT;

#資料回復
USE FLOWER_SHOP;
LOAD DATA INFILE '/tmp/MANUFACTURER.txt' INTO TABLE FLOWER_SHOP.MANUFACTURER;
LOAD DATA INFILE '/tmp/CLIENTS.txt' INTO TABLE FLOWER_SHOP.CLIENTS;
LOAD DATA INFILE '/tmp/ORDERS.txt' INTO TABLE FLOWER_SHOP.ORDERS;
LOAD DATA INFILE '/tmp/ORDERS_DETAILS.txt' INTO TABLE FLOWER_SHOP.ORDERS_DETAILS;
LOAD DATA INFILE '/tmp/PRODUCT.txt' INTO TABLE FLOWER_SHOP.PRODUCT;
LOAD DATA INFILE '/tmp/PURCHASE.txt' INTO TABLE FLOWER_SHOP.PURCHASE;
LOAD DATA INFILE '/tmp/PURCHASE_DETAILS.txt' INTO TABLE FLOWER_SHOP.PURCHASE_DETAILS;
LOAD DATA INFILE '/tmp/STAFF.txt' INTO TABLE FLOWER_SHOP.STAFF;
LOAD DATA INFILE '/tmp/DEPARTMENT.txt' INTO TABLE FLOWER_SHOP.DEPARTMENT;