
CREATE DATABASE IF NOT EXISTS shoping;

USE shoping;


/*
 * Tạo bảng
 */
CREATE TABLE IF NOT EXISTS `customers` (
    `customerNumber`   BIGINT(20)  NOT NULL,
    `customerName`     VARCHAR(50) NOT NULL,
    `contactLastName`  VARCHAR(50) NOT NULL,
    `contactFirstName` VARCHAR(50) NOT NULL,
    `phone`            VARCHAR(50) NOT NULL,
    `addressLine1`     VARCHAR(50) NOT NULL,
    `addressLine2`     VARCHAR(50),
    `city`             VARCHAR(50),
    `country`          VARCHAR(50),
    `state`            VARCHAR(50),
    `postalCode`       VARCHAR(15) NOT NULL,
    `creditLimit`      DOUBLE DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `orders` (
    `orderNumber`     BIGINT(20)  NOT NULL,
    `orderDate`       DATE NOT NULL,
    `requiredDate`    DATE NOT NULL,
    `shippedDate`     DATE,
    `status`          VARCHAR(15) NOT NULL,
    `comments`        TEXT,
    `quantityOrdered` INT NOT NULL,
    `priceEach`       DOUBLE(10,2) NOT NULL,
    `customerNumber`  BIGINT(20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS `OrderDetails` (
    `orderNumber`     BIGINT(20)  NOT NULL,
    `productCode`     VARCHAR (15) NOT NULL,
    `quantityOrdered` INT NOT NULL,
    `priceEach`       DOUBLE(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `payments` (
    `customerNumber`         BIGINT(20)   NOT NULL,
    `checkNumber`            VARCHAR(50)  NOT NULL,
    `paymentDate`            DATE NOT NULL,
    `amount`                 DOUBLE(10,2) NOT NULL,
    `salesRepEmployeeNumber` BIGINT(20)   NOT NULL
);

CREATE TABLE IF NOT EXISTS `products` (
    `productCode`        VARCHAR(15) NOT NULL,
    `productName`        VARCHAR(70) NOT NULL,
    `productScale`       VARCHAR(10) NOT NULL,
    `productVendor`      VARCHAR(50) NOT NULL,
    `productDescription` TEXT NOT NULL,
    `quantityInStock`    INT NOT NULL,
    `buyPrice`           DOUBLE(10,2) NOT NULL,
    `MSRP`               DOUBLE(10,2) NOT NULL,
    `productLine`        VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `productlines` (
    `productLine`     VARCHAR(50) NOT NULL,
    `textDescription` TEXT NOT NULL,
    `image`           TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `employees` (
    `employeeNumber` BIGINT(20)   NOT NULL,
    `lastName`       VARCHAR(50)  NOT NULL,
    `firstName`      VARCHAR(150) NOT NULL,
    `email`          VARCHAR(100) NOT NULL,
    `jobtitle`       VARCHAR(50)  NOT NULL,
    `reportTo`       BIGINT(20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS `offices` (
    `officeCode`   VARCHAR(10) NOT NULL,
    `city`         VARCHAR(50) NOT NULL,
    `phone`        VARCHAR(50) NOT NULL,
    `addressLine1` VARCHAR(50) NOT NULL,
    `addressLine2` VARCHAR(50) NOT NULL,
    `state`        VARCHAR(50) NOT NULL,
    `country`      VARCHAR(50) NOT NULL,
    `postalCode`   VARCHAR(15) NOT NULL
);

/*
 * Tạo khóa cho các bảng
 */

/*
 * Tạo khóa chính bảng `customers`
 */
ALTER TABLE `customers`
    ADD PRIMARY KEY `customerNumber`(`customerNumber`);

/*
 * Tạo khóa chính bảng `orders`
 */
ALTER TABLE `orders`
    ADD PRIMARY KEY `orderNumber`(`orderNumber`);

/*
 * Tạo khóa chính bảng `OrderDetails`
 */
ALTER TABLE `OrderDetails`
    ADD PRIMARY KEY `orderNumber`(`orderNumber`, `productCode`);

/*
 * Tạo khóa chính bảng `products`
 */
ALTER TABLE `products`
    ADD PRIMARY KEY `productCode`(`productCode`);

/*
 * Tạo khóa chính bảng `products`
 */
ALTER TABLE `productlines`
    ADD PRIMARY KEY `productlines`(`productLine`);

/*
 * Tạo khóa chính bảng `employees`
 */
ALTER TABLE `employees`
    ADD PRIMARY KEY `employeeNumber`(`employeeNumber`);

/*
 * Tạo khóa chính bảng `offices`
 */
ALTER TABLE `offices`
    ADD PRIMARY KEY `officeCode`(`officeCode`);




/*
* Tạo ràng buộc các bảng
*/


/*
* Tạo ràng buộc cho bảng `orders`
*/
ALTER TABLE `orders`
    ADD CONSTRAINT `customerNumber_foreign`
        FOREIGN KEY (`customerNumber`)
        REFERENCES `customers`(`customerNumber`);


/*
* Tạo ràng buộc cho bảng `payments`
*/
ALTER TABLE `payments`
    ADD CONSTRAINT `customerPayment_foreign`
        FOREIGN KEY (`customerNumber`)
        REFERENCES `customers`(`customerNumber`);


ALTER TABLE `payments`
    ADD CONSTRAINT `employeeNumber_foreign`
        FOREIGN KEY (`salesRepEmployeeNumber`)
        REFERENCES `employees`(`employeeNumber`);

/*
* Tạo ràng buộc cho bảng `OrderDetails`
*/
ALTER TABLE `OrderDetails`
    ADD CONSTRAINT `order_number_foreign`
        FOREIGN KEY (`orderNumber`)
        REFERENCES `orders`(`orderNumber`);

ALTER TABLE `OrderDetails`
    ADD CONSTRAINT `product_code_foreign`
        FOREIGN KEY (`productCode`)
        REFERENCES `products`(`productCode`);


/*
* Tạo ràng buộc cho bảng `products`
*/

ALTER TABLE `products`
    ADD CONSTRAINT `productline_foreign`
        FOREIGN KEY (`productLine`)
        REFERENCES `productlines`(`productLine`);


/*
* Tạo ràng buộc cho bảng `Employees`
*/
ALTER TABLE `Employees`
    ADD CONSTRAINT `reportTo_foreign`
        FOREIGN KEY (`reportTo`)
        REFERENCES `Customers`(`customerNumber`);

