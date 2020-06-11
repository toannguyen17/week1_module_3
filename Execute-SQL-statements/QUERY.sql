use classicmodels;

/**
  * lấy ra tất cả trường và hàng của `customers`
 */
SELECT * FROM `customers`;

/**
  * lấy ra 4 trường `customerName`, `phone`, `city`, `country`
  * của tất cả các hàng trong bảng `customers`
 */
SELECT `customerName`, `phone`, `city`, `country` FROM `customers`;

/**
  * lấy ra tất cả trường của `customers`
  * với điều kiện ''customerName'' bằng ''Atelier Graphique''.
  * return 1 rows
 */

SELECT * FROM `customers` WHERE `customerName` = ''Atelier Graphique'';

/**
  * lấy ra tất cả trường của `customers`
  * với điều kiện ''customerName'' chứa ký tự ''A''.
  * return 96 rows
 */
SELECT * FROM `customers` WHERE `customerName` LIKE ''%A%'';

/**
  * lấy ra tất cả trường của `customers`
  * với điều kiện ''city'' khớp với một trong bốn thành phố Nantes, Las Vegas, Warszawa,NYC
  * return 7 rows
 */
SELECT * FROM `customers` WHERE `city` IN (''Nantes'','' Las Vegas'','' Warszawa'',''NYC'');


/**
  * lấy ra danh sách hàng với 3 trường `customerName`, `phone`, `city` của `customers`
  * với điều kiện ''customerName'' có chữ ''T''
  * return 97 rows
 */
SELECT `customerName`, `phone`, `city` FROM `customers` WHERE `customerName` LIKE ''%T%'';