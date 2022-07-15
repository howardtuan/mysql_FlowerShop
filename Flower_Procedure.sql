#查詢某個產品的進銷存
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE STOCK_ANY(
	IN id VARCHAR(10)
)
BEGIN
	SELECT * 
	FROM STOCK_VIEW
	WHERE STOCK_VIEW.`產品編號` = id;
END //
DELIMITER ;
call STOCK_ANY("pro001");
#----------------------分割線----------------------
#查詢某個產品的進貨總成本
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE PRODUCT_COST_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select *
    FROM PRODUCT_COST_VIEW
    WHERE PRODUCT_COST_VIEW.`產品編號` = id;
END //
DELIMITER ;
call PRODUCT_COST_ANY("pro001");
#----------------------分割線----------------------
#查詢某個產品的銷貨總金額
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE PRODUCT_SALE_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select *
    FROM PRODUCT_SALE_VIEW
    WHERE PRODUCT_SALE_VIEW.`產品編號` = id;
END //
DELIMITER ;
call PRODUCT_SALE_ANY("pro001");
#----------------------分割線----------------------
#查詢某個產品的利潤
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE PRODUCT_PROFIT_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select *
    FROM PRODUCT_PROFIT_VIEW
    WHERE PRODUCT_PROFIT_VIEW.`產品編號` = id;
END //
DELIMITER ;
call PRODUCT_PROFIT_ANY("pro001");
#----------------------分割線----------------------
#查詢某位客戶的訂單
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE CLIENT_ORDERS_ANY(
	IN id VARCHAR(10)
)
BEGIN
	select *
    FROM CLIENT_ORDERS_VIEW
    WHERE CLIENT_ORDERS_VIEW.`客戶編號` = id;
END //
DELIMITER ;
call CLIENT_ORDERS_ANY("c001");
#----------------------分割線----------------------
#查詢已付款進貨單或是未付款進貨單
USE FLOWER_SHOP;
DELIMITER //
CREATE PROCEDURE PURCHASE_PAY(
	IN `付款與否` VARCHAR(1)
)
BEGIN
	select *
    FROM PURCHASE_DETAILS_VIEW
    WHERE PURCHASE_DETAILS_VIEW.`付款與否` = `付款與否`;
END //
DELIMITER ;
call PURCHASE_PAY("否");