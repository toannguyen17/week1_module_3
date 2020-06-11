use `testjdbc`;


/*
 * sắp xếp khách hàng theo thứ tự từ A-Z (tăng dần)
 */
SELECT customerName
    FROM customers
    ORDER BY customerName ASC;


/*
 * sắp xếp khách hàng theo thứ tự từ Z-A (giảm dần)
 */
SELECT customerName
    FROM customers
    ORDER BY customerName DESC;



/*
 * Nhóm khách hàng theo quốc gia
 */
SELECT COUNT(customerNumber) AS customerCount, country
    FROM customers
    GROUP BY country
    ORDER BY customerCount DESC;




/*
 * Show các thành phố có lớn hơn 5 khách hàng
 */
SELECT COUNT(customerNumber) AS customerCount, country
    FROM customers
    GROUP BY country
    HAVING customerCount > 5
    ORDER BY customerCount DESC;




SELECT country
    FROM customers
    WHERE customerNumber IN(
        SELECT customerNumber
        FROM customers
        GROUP BY country
        HAVING COUNT(customerNumber) > 5);


SELECT customerName, country
FROM customers
WHERE country IN(
    SELECT country
    FROM customers
    GROUP BY country
    HAVING COUNT(customerNumber) > 5);



/*
 * Giới hạn các bản ghi được lấy ra
 * chỉ lấy ra 10 bản ghi đầu tiên
 */
SELECT customerName
    FROM customers
    ORDER BY customerName DESC
    LIMIT 10;



/*
 * Phân trang trong cơ sở dữ liệu
 */
SELECT customerName
    FROM customers
    ORDER BY customerName DESC
    LIMIT 0, 10;

