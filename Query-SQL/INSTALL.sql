use `testjdbc`;

/*
 * Tạo bảng bài viết
 */
CREATE TABLE IF NOT EXISTS `post` (
    `id` bigint(20) UNSIGNED not null auto_increment,
    `user_id` bigint(20) UNSIGNED  not null,
    `text` TEXT not null,
     PRIMARY KEY `post_id_primary` (`id`),
     KEY `user_id_index` (`user_id`)
);

/*
 * Tạo bảng người dùng
 */

CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint(20) UNSIGNED not null auto_increment,
    `name` varchar(60) not null,
    PRIMARY KEY `users_id_primary` (`id`)
);


/*
 * Thêm Khóa ngoại
 */

ALTER TABLE `post` ADD
    CONSTRAINT `user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);



/*
 * Thêm người dùng
 */
INSERT INTO `users` (`name`) values
    ('Quang Hải'),
    ('Đức Chinh'),
    ('Tiến Dũng'),
    ('Văn Lâm');

/*
* Thêm Bài đăng
*/

INSERT INTO `post` (`user_id`, `text`) values
    (1, 'bài vết của Quang Hải'),
    (4, 'bài vết của Đức Chinh 1'),
    (2, 'bài vết của Tiến Dũng 1'),
    (3, 'bài vết của Văn Lâm 1'),
    (4, 'bài vết của Đức Chinh 2'),
    (2, 'bài vết của Tiến Dũng 2'),
    (3, 'bài vết của Văn Lâm 2');