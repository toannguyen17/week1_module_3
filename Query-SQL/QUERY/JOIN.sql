use `testjdbc`;


/*
 * INNER JOIN
 */
SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`, orders.orderDate, orders.customerNumber
    FROM `orders`
    JOIN `customers` ON orders.customerNumber = customers.customerNumber;


SELECT customers.customerName, customers.city as `customers_city`, offices.city as `offices_city`, offices.officeCode
    FROM `customers`
    JOIN `offices` ON offices.city = customers.city;


/*
 * LEFT JOIN
 */

SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`, orders.orderDate, orders.customerNumber
    FROM `customers`
    LEFT JOIN `orders` ON orders.customerNumber = customers.customerNumber;


SELECT customers.customerName, customers.city as `customers_city`, offices.city as `offices_city`, offices.officeCode
    FROM `customers`
    LEFT JOIN `offices` ON offices.city = customers.city;


/*
 * RIGHT JOIN
 */
SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`, orders.orderDate
    FROM `customers`
    RIGHT JOIN `orders` ON orders.customerNumber = customers.customerNumber;


SELECT customers.customerName, customers.city as `customers_city`, offices.city as `offices_city`, offices.officeCode
    FROM `customers`
    RIGHT JOIN `offices` ON offices.city = customers.city;


/*
 * FULL OUTER JOIN
 */


SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`, orders.orderDate
    FROM `customers`
    LEFT JOIN `orders` ON orders.customerNumber = customers.customerNumber
UNION
SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`, orders.orderDate
    FROM `customers`
    RIGHT JOIN `orders` ON orders.customerNumber = customers.customerNumber;



SELECT customers.customerName, customers.city as `customers_city`,
       offices.city as `offices_city`, offices.officeCode
    FROM `customers`
    LEFT JOIN `offices` ON offices.city = customers.city
    UNION
    SELECT customers.customerName, customers.city as `customers_city`,
           offices.city as `offices_city`, offices.officeCode
    FROM `customers`
    RIGHT JOIN `offices` ON offices.city = customers.city;



/*
 * MULTI JOIN
 */
 /*
  * Lấy ra hóa đơn, người thanh toán, và số tiền thanh toán
  */
SELECT orders.orderNumber as `id`, customers.customerName, customers.city as `customers_city`,
       orders.orderDate, orderdetails.quantityOrdered, orderdetails.priceEach
    FROM `orders`
    JOIN `customers` ON orders.customerNumber = customers.customerNumber
    JOIN `orderdetails` ON orders.orderNumber = orderdetails.orderNumber;

