use `testjdbc`;

/*
 * Truy suất toàn bộ dữ liệu của bảng
 */
SELECT * FROM `customers`;

/*
 * Lấy ra khách hàng đang ở Paris
 */
SELECT `customerName` as `name`, `phone`, `city` FROM `customers`
    WHERE `city` = 'Paris';

/*
 * Lấy ra khách hàng đang ở Paris Hoặc London
 */
SELECT `customerName` as `name`, `phone`, `city` FROM `customers`
    WHERE `city` = 'Paris' OR `city` = 'London';


/*
 * Tìm người dùng sống ở Mỹ và số dư tài khoản lớn hơn 200 000$
 */
SELECT `customerName` as `name`, `creditLimit`, `country` FROM `customers`
    WHERE `country` = 'USA' AND `creditLimit` > 200000;



/*
 * Toán tử IN
 */
/*
 * Truy vấn các khách hàng với điều kiện
 * tổng khách hành có trung thành phố lớn hơn 5 người
 */
SELECT customerName, country
FROM customers
WHERE country IN(
    SELECT *
    FROM customers
    GROUP BY country
    HAVING COUNT(customerNumber) > 5);




SELECT customerName, country
FROM customers
WHERE country IN('USA', 'Australia');






SELECT country, count(customerName)
FROM customers
GROUP BY country

/*
 LIKE
 */

SELECT customerName, city
FROM customers
WHERE customerName LIKE '_[abc]%'

