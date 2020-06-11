
/*
 * Tạo khóa chính khi tạo bảng
 */

CREATE TABLE `nametable` (
    `id` BIGINT(20) NOT NULL PRIMARY KEY
);

CREATE TABLE `nametable` (
    `id` BIGINT(20) NOT NULL,
    PRIMARY KEY `id`(`id`)
);

/*
 * Tạo khóa chính sau khi bảng đã được tạo
 */

ALTER TABLE `nametable` ADD PRIMARY KEY `id`(`id`);

/*
 * Xóa Khóa chính
 */
ALTER TABLE `nametable` DROP PRIMARY KEY;

