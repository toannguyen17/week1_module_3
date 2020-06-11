CREATE DATABASE IF NOT EXISTS bookmanager;

USE bookmanager;

/*
 * Tạo bảng
 */

CREATE TABLE IF NOT EXISTS `books` (
    `id`          BIGINT(20)   NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255) NOT NULL,
    `description` TEXT         NOT NULL,
    `content`     LONGTEXT     NOT NULL,
    `author`      VARCHAR(50)  NOT NULL,
    `ISBN`        VARCHAR(50)  NOT NULL,
    `category_id` BIGINT(20)   NOT NULL,
    PRIMARY KEY `id`(`id`)
);

CREATE TABLE IF NOT EXISTS `categories` (
    `id`          BIGINT(20)   NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255) NOT NULL,
    `description` TEXT         NOT NULL,
    PRIMARY KEY `id`(`id`)
);

CREATE TABLE IF NOT EXISTS `student` (
    `student_number` VARCHAR(15),
    `student_name`   VARCHAR(50)  NOT NULL,
    `address`        VARCHAR(500) NOT NULL,
    `email`          VARCHAR(50)  NOT NULL,
    `image`          VARCHAR(100) NOT NULL,
    PRIMARY KEY `student_number`(`student_number`)
);

CREATE TABLE IF NOT EXISTS `borrow_order` (
    `student_number` VARCHAR(15) NOT NULL,
    `books_id`       BIGINT(20)  NOT NULL,
    `time`           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY `studentNumber_bookId` (`student_number`, `books_id`)
);


/*
* Tạo ràng buộc
*/

/*
 * Tạo ràng buộc `books`
 */
ALTER TABLE `books` ADD
    CONSTRAINT `category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

/*
 * Tạo ràng buộc bảng `borrow_order`
 */
ALTER TABLE `borrow_order` ADD
    CONSTRAINT `student_number_foreign` FOREIGN KEY (`student_number`) REFERENCES `student`(`student_number`);

ALTER TABLE `borrow_order` ADD
    CONSTRAINT `books_id_foreign` FOREIGN KEY (`books_id`) REFERENCES `books`(`id`);

