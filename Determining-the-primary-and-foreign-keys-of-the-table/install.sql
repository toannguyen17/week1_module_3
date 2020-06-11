
CREATE DATABASE data_banking;
USE data_banking;

/*
 * Tạo bảng
 */

CREATE TABLE `email` (
    `id`          BIGINT(20)   NOT NULL AUTO_INCREMENT,
    `email`       VARCHAR(50) NOT NULL,
    `customer_id` BIGINT(20)  NOT NULL,
    PRIMARY KEY `id`(`id`),
    UNIQUE `email`(`email`),
    KEY `customer_id`(`customer_id`)
);


CREATE TABLE `phone` (
    `id`          BIGINT(20)  NOT NULL AUTO_INCREMENT,
    `phone`       VARCHAR(20) NOT NULL,
    `customer_id` BIGINT(20)  NOT NULL,
    `region`      VARCHAR(6)  NOT NULL,
    PRIMARY KEY `id`(`id`),
    UNIQUE `phone`(`phone`),
    KEY `customer_id`(`customer_id`)
);


CREATE TABLE `customer` (
    `id`      BIGINT(20)  NOT NULL AUTO_INCREMENT,
    `code`    VARCHAR(20) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `name`    VARCHAR(50) NOT NULL,
    `phone`   VARCHAR(50) NOT NULL,
    PRIMARY KEY `id`(`id`),
    UNIQUE `code`(`code`)
);


CREATE TABLE `accounts` (
    `id`              BIGINT(20)  NOT NULL AUTO_INCREMENT,
    `number_account`  VARCHAR(20) NOT NULL,
    `type`            VARCHAR(30) NOT NULL,
    `created_at`      TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `balance`         DOUBLE      NOT NULL,
    `customer_number` BIGINT(20)  NOT NULL,
    PRIMARY KEY `id`(`id`),
    UNIQUE `number_account`(`number_account`)
);


CREATE TABLE `transactions` (
    `id`           BIGINT(20)  NOT NULL AUTO_INCREMENT,
    `trading_code` VARCHAR(20) NOT NULL,
    `transfer`     BIGINT(20)  NOT NULL,
    `receiver`     BIGINT(20)  NOT NULL,
    `description`  TEXT        NOT NULL,
    `amount`       DOUBLE      NOT NULL,
    `account_id`   BIGINT(20)  NOT NULL,
    `created_at`   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at`   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY `id`(`id`),
    UNIQUE `trading_code`(`trading_code`),
    KEY `account_id`(`account_id`)
);


/*
 * Tạo ràng buộc
 */


/*
 * Tạo ràng buộc cho bảng email
 */
ALTER TABLE `email` ADD
    CONSTRAINT `customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`);

/*
 * Tạo ràng buộc cho bảng phone
 */
ALTER TABLE `phone` ADD
    CONSTRAINT `phone_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`);

/*
 * Tạo ràng buộc cho bảng accounts
 */
ALTER TABLE `accounts` ADD
    CONSTRAINT `customer_number_foreign` FOREIGN KEY (`customer_number`) REFERENCES `customer`(`id`);



