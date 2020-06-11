
/*
 * Tạo khóa ngoại khi tạo bảng
 */

CREATE TABLE `nametable` (
    `foreign_id` BIGINT(20) NOT NULL,
    CONSTRAINT `nameKEY` FOREIGN KEY (`foreign_id`) REFERENCES `table_acb`(`id`);
);

/*
 * Tạo khóa ngoại sau khi bảng đã được tạo
 */

ALTER TABLE `nametable` ADD
    CONSTRAINT `nameKEY` FOREIGN KEY (`foreign_id`) REFERENCES `table_acb`(`id`);

/*
 * Xóa Khóa ngoại
 */
ALTER TABLE `nametable` DROP CONSTRAINT `nameKEY`;

