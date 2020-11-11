CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price INT
);
 
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(product_id),
  user_id INT REFERENCES users(user_id)
);


INSERT INTO users 
(name, email)
VALUES
('Bruce Wayne', 'imbatman@batcave.net'),
('Clark Kent', 'superman@dailyplanet.org'),
('Diana Prince', 'wonderwoman@themyscira.com');

INSERT INTO products 
(name, price)
VALUES
('Batmobile', 1250000),
('Fortress of Solitude', 500000),
('Invisible Plane', 2300000);

INSERT INTO orders 
(user_id, product_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 3),
(3, 2),
(1, 1);

SELECT * FROM orders
WHERE order_id = 1;

SELECT * FROM orders;

SELECT sum(p.price) 
FROM products p 
JOIN orders o ON p.product_id = o.product_id
WHERE order_id = 3;

ALTER TABLE users
ADD COLUMN order_id INT;

SELECT * 
FROM orders
WHERE user_id = 1;
  
SELECT COUNT(*), u.name
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.name;