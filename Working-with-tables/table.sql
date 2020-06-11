
/*
 * Tạo bảng
 */

CREATE TABLE `nametable` (
    `id`   BIGINT(20)  NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY `id`(`id`)
)
    ENGINE InnoDB
    CHAR SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;

/*
* Đổi tên bảng
*/
ALTER TABLE `nametable` RENAME TO `newtable`;

/*
 * Xóa bảng
 */
DROP TABLE `nametable`;


/*
* Thêm cột
*/
ALTER TABLE `nametable` ADD
    `nameColumn` INT(11) NOT NULL;

ALTER TABLE `nametable` ADD COLUMN
    `nameColumn` INT(11) NOT NULL;

/*
* Thay đổi cột
* đổi tên và vàng buộc của cột
*/
ALTER TABLE `nametable` CHANGE
     `old_name_column` `new_name_column` INT(11) NOT NULL;

ALTER TABLE `nametable` CHANGE COLUMN
    `old_name_column` `new_name_column` INT(11) NOT NULL;

/*
* Thay kểu dữ liệu và ràng bộc của cột
*/
ALTER TABLE `nametable` MODIFY
    `nameColumn` INT(11) NOT NULL;

ALTER TABLE `nametable` MODIFY COLUMN
    `nameColumn` INT(11) NOT NULL;
