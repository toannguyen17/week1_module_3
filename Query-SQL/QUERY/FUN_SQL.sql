use `testjdbc`;

/*
 * Tổng tiền thanh toán của tất cả khách hàng
 */
SELECT SUM(amount) as total
    FROM payments;


/*
 * Tổng tiền thanh toán của mã bắt đầu bằng HQ
 */
SELECT SUM(amount) as total
    FROM payments
    WHERE checkNumber LIKE 'HQ%';

SELECT SUM(amount) as total_customer, customerNumber
FROM payments
GROUP BY customerNumber;


SELECT AVG(amount) as total_customer, customerNumber
FROM payments
GROUP BY customerNumber;


/*
 * tính giá trị trung bình trong bảng payments
 */
SELECT AVG(amount) as avg_amount
    FROM payments;


/*
 * Số tiền thanh toán trung bình của mã HQ
 */
SELECT AVG(amount) as avg_amount_HQ
    FROM payments
    WHERE checkNumber LIKE 'HQ%';




/*
 * Đếm số khách hàng trên hệ thống
 */
SELECT COUNT(*) as total
    FROM customers
where customerName LIKE 'A%';


/*
 * Đếm tổng số hóa đơn
 */
SELECT COUNT(*) as total
    FROM orders;




/*
 * Số tiền lớn nhất từng được thanh toán
 */

SELECT MIN(amount) as amount_max, customers.customerName
    FROM payments
JOIN customers on payments.customerNumber = customers.customerNumber;


/*
 * Số tiền nhỏ nhất từng được thanh toán
 */
SELECT MIN(amount) as amount_max
    FROM payments;





/*
 * Truy vấn trả về In hoa toàn bộ tên người dùng
 */
SELECT UCASE(customerName) AS name
    FROM customers;


/*
 * Truy vấn trả về In thường toàn bộ tên người dùng
 */
SELECT LCASE(customerName) AS name
    FROM customers;


/*
 * Truy vấn trả về độ dài tên người dùng LEN
 */
SELECT customerName, LENGTH(customerName) AS length
    FROM customers;

/*
 * Truy vấn trả về độ dài tên người dùng
 */
SELECT customerName, addressLine1, NOW() AS now
    FROM customers;




