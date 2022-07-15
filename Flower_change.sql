USE FLOWER_SHOP;
#更改產品價格  第一個值為產品編號 第二個為更改的價格
DELIMITER //
CREATE PROCEDURE CHANGE_PRO_PRICE(
	IN id VARCHAR(10),price int
)
BEGIN
	update PRODUCT set FLOWER_SHOP.PRODUCT.定價 = price where FLOWER_SHOP.PRODUCT.產品編號=id;
    
    select * from FLOWER_SHOP.PRODUCT where FLOWER_SHOP.PRODUCT.產品編號=id;
END //
DELIMITER ;
call CHANGE_PRO_PRICE("pro001",99);
#----------------------分割線----------------------
#更改客戶住址/電話  第一個值為客戶編號 第二個為新住址或新電話
DELIMITER //
CREATE PROCEDURE CHANGE_CLIENT(
	IN id VARCHAR(10),Str VARCHAR(10)
)
BEGIN
	if str like "0%" then
		update CLIENTS set FLOWER_SHOP.CLIENTS.電話=Str where FLOWER_SHOP.CLIENTS.客戶編號=id;
        select * from FLOWER_SHOP.CLIENTS where FLOWER_SHOP.CLIENTS.客戶編號=id;
	else
		update CLIENTS set FLOWER_SHOP.CLIENTS.地址=Str where FLOWER_SHOP.CLIENTS.客戶編號=id;
        select * from FLOWER_SHOP.CLIENTS where FLOWER_SHOP.CLIENTS.客戶編號=id;
    
	END IF;
END //
DELIMITER ;
call CHANGE_CLIENT("c001","0987654321");#更改電話
call CHANGE_CLIENT("c001","中原大學");#更改住址
#----------------------分割線----------------------
#更改主管姓名 #第一個值為主管編號 第二個值為要更改的姓名
DELIMITER //
CREATE PROCEDURE CHANGE_MANAGER(
	IN id VARCHAR(10),Str VARCHAR(10)
)
BEGIN
	update DEPARTMENT set FLOWER_SHOP.DEPARTMENT.主管=Str where FLOWER_SHOP.DEPARTMENT.部門編號=id;
	select * from FLOWER_SHOP.DEPARTMENT where FLOWER_SHOP.DEPARTMENT.部門編號=id;
END //
DELIMITER ;
call CHANGE_MANAGER("d001","吳彥霖");#更改姓名
#----------------------分割線----------------------
#更改員工部門 #第一個值為員工編號 第二個值為新部門編號
DELIMITER //
CREATE PROCEDURE CHANGE_STAFF(
	IN id VARCHAR(10),Str VARCHAR(10)
)
BEGIN
	update STAFF set FLOWER_SHOP.STAFF.部門編號=Str where FLOWER_SHOP.STAFF.員工編號=id;
	select * from FLOWER_SHOP.STAFF where FLOWER_SHOP.STAFF.員工編號=id;
END //
DELIMITER ;
call CHANGE_STAFF("s001","d002");#更改員工部門
#----------------------分割線----------------------
#更改訂單是否付款與出貨 #第一個值為訂單編號 第二個值為付款與否 第三個為出貨與否
DELIMITER //
CREATE PROCEDURE CHANGE_ORDER(
	IN id VARCHAR(10),Str VARCHAR(1),Str2 VARCHAR(1)
)
BEGIN
	update ORDERS set FLOWER_SHOP.ORDERS.付款與否=Str where FLOWER_SHOP.ORDERS.訂單編號=id;
    update ORDERS set FLOWER_SHOP.ORDERS.出貨與否=Str2 where FLOWER_SHOP.ORDERS.訂單編號=id;
	select * from FLOWER_SHOP.ORDERS where FLOWER_SHOP.ORDERS.訂單編號=id;
END //
DELIMITER ;
call CHANGE_ORDER("o001","否","否");#更改訂單是否付款與出貨
#----------------------分割線----------------------
#更改客戶訂單明細中的產品數量 #第一個值為訂單明細編號 第二個值為要更改的數量
DELIMITER //
CREATE PROCEDURE CHANGE_ORDER_D_AMOUNT(
	IN id VARCHAR(10),amount int
)
BEGIN
	update ORDERS_DETAILS set FLOWER_SHOP.ORDERS_DETAILS.訂購數量=amount where FLOWER_SHOP.ORDERS_DETAILS.訂單明細編號=id;
	select * from FLOWER_SHOP.ORDERS_DETAILS where FLOWER_SHOP.ORDERS_DETAILS.訂單明細編號=id;
END //
DELIMITER ;
call CHANGE_ORDER_D_AMOUNT("od001",20);#更改客戶訂單明細中的產品數量
#----------------------分割線----------------------
#更改採購單是否付款 #第一個值為採購編號 第二個值為付款與否
DELIMITER //
CREATE PROCEDURE CHANGE_PURCHASE_PAY(
	IN id VARCHAR(10),Str VARCHAR(1)
)
BEGIN
	update PURCHASE_DETAILS set FLOWER_SHOP.PURCHASE_DETAILS.付款與否=Str where FLOWER_SHOP.PURCHASE_DETAILS.採購明細編號=id;
	select * from FLOWER_SHOP.PURCHASE_DETAILS where FLOWER_SHOP.PURCHASE_DETAILS.採購明細編號=id;
END //
DELIMITER ;
call CHANGE_PURCHASE_PAY("pd001","否");#更改採購單是否付款