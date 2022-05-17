CREATE DATABASE BTquanlybanhang;
USE BTquanlybanhang;

CREATE TABLE customer
(
    customer_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(60) NOT NULL,
    customer_age  INT CHECK (customer_age > 0)
);

CREATE TABLE `order`
(
    order_id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id       INT,
    order_date        DATE,
    order_total_price DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

CREATE TABLE product
(
    product_id    INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name  VARCHAR(60) NOT NULL,
    product_price DOUBLE
);

CREATE TABLE order_detail
(
    order_id   INT,
    product_id INT,
    amount     INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `order` (order_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

INSERT INTO customer
VALUES (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);

INSERT INTO `order`(order_id, customer_id, order_date)
VALUES (1, 1, '2006-03-21'),
       (2, 2, '2006-03-23'),
       (3, 1, '2006-03-16');

INSERT INTO product
VALUES (1, 'May Giat', 3),
       (2, 'Tu lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);

INSERT INTO order_detail
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

SELECT `order`.order_id, `order`.order_date, product.product_price
FROM `order`
         JOIN order_detail ON `order`.order_id = order_detail.order_id
         JOIN product ON order_detail.product_id = product.product_id;

SELECT customer.customer_name, product.product_name, product.product_price
FROM customer
         JOIN `order` ON customer.customer_id = `order`.customer_id
         JOIN order_detail ON `order`.order_id = order_detail.order_id
         JOIN product ON order_detail.product_id = product.product_id;

SELECT customer.customer_name
FROM customer
         LEFT JOIN `order` ON customer.customer_id = `order`.customer_id
WHERE `order`.order_id IS NULL;

SELECT `order`.order_id, `order`.order_date, SUM(order_detail.amount * product.product_price) AS price
FROM `order`
         JOIN order_detail ON `order`.order_id = order_detail.order_id
         JOIN product ON order_detail.product_id = product.product_id
GROUP BY `order`.order_id;