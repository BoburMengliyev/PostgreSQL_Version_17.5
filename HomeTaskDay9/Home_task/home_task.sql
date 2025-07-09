CREATE TABLE categories (
	category_id SERIAL PRIMARY KEY,
	category_name TEXT NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	product_name TEXT NOT NULL,
	category_id INT REFERENCES categories(category_id),
	price NUMERIC(19, 2) NOT NULL CHECK(price > 0),
	stock INT NOT NULL CHECK(stock > 0)
);

CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone TEXT NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE
);

CREATE TABLE sales (
	sale_id SERIAL PRIMARY KEY,
	product_id INT REFERENCES products(product_id),
	customer_id INT REFERENCES customers(customer_id),
	quantity INT NOT NULL CHECK(quantity > 0),
	sale_date DATE NOT NULL,
	total_price INTEGER
);

INSERT INTO categories (category_name, description) VALUES ('Fruits', 'Fresh and delicious fruits');
INSERT INTO categories (category_name, description) VALUES ('Vegetables', 'Green and healthy vegetables');
INSERT INTO categories (category_name, description) VALUES ('Dairy', 'Milk, cheese, and more');
INSERT INTO categories (category_name, description) VALUES ('Bakery', 'Freshly baked goods');
INSERT INTO categories (category_name, description) VALUES ('Beverages', 'Hot and cold drinks');
INSERT INTO categories (category_name, description) VALUES ('Snacks', 'Sweet and salty snacks');
INSERT INTO categories (category_name, description) VALUES ('Meat', 'Fresh meat products');
INSERT INTO categories (category_name, description) VALUES ('Seafood', 'Fresh seafood items');
INSERT INTO categories (category_name, description) VALUES ('Frozen', 'Frozen foods');
INSERT INTO categories (category_name, description) VALUES ('Canned', 'Canned goods and products');
INSERT INTO categories (category_name, description) VALUES ('Spices', 'Variety of spices and herbs');
INSERT INTO categories (category_name, description) VALUES ('Pasta', 'Pasta, noodles, and more');
INSERT INTO categories (category_name, description) VALUES ('Sauces', 'Different types of sauces');
INSERT INTO categories (category_name, description) VALUES ('Breakfast', 'Breakfast cereals and products');
INSERT INTO categories (category_name, description) VALUES ('Organic', 'Organic and eco-friendly products');
INSERT INTO categories (category_name, description) VALUES ('Baby Products', 'Products for babies');
INSERT INTO categories (category_name, description) VALUES ('Pet Food', 'Food for your pets');
INSERT INTO categories (category_name, description) VALUES ('Cleaning Supplies', 'Household cleaning items');
INSERT INTO categories (category_name, description) VALUES ('Personal Care', 'Personal hygiene products');
INSERT INTO categories (category_name, description) VALUES ('Health & Wellness', 'Supplements and health items');

INSERT INTO products (product_name, category_id, price, stock) VALUES ('Apple', 1, 0.50, 100);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Banana', 1, 0.30, 150);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Carrot', 2, 0.20, 200);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Tomato', 2, 0.40, 180);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Milk', 3, 1.20, 50);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Cheese', 3, 3.50, 30);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Bread', 4, 1.00, 100);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Croissant', 4, 1.50, 40);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Orange Juice', 5, 2.00, 60);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Tea', 5, 1.50, 70);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Potato Chips', 6, 1.20, 90);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Chocolate', 6, 2.50, 80);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Chicken', 7, 5.00, 20);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Beef', 7, 8.00, 15);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Shrimp', 8, 10.00, 10);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Salmon', 8, 12.00, 8);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Frozen Pizza', 9, 7.00, 25);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Frozen Vegetables', 9, 4.00, 50);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Canned Beans', 10, 1.50, 70);
INSERT INTO products (product_name, category_id, price, stock) VALUES ('Canned Tuna', 10, 2.50, 60);

INSERT INTO customers (first_name, last_name, phone, email) VALUES ('John', 'Doe', '1234567890', 'john.doe@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Jane', 'Smith', '2345678901', 'jane.smith@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Alice', 'Brown', '3456789012', 'alice.brown@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Bob', 'Taylor', '4567890123', 'bob.taylor@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Charlie', 'White', '5678901234', 'charlie.white@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Diana', 'Green', '6789012345', 'diana.green@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Eve', 'Black', '7890123456', 'eve.black@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Frank', 'Blue', '8901234567', 'frank.blue@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Grace', 'Red', '9012345678', 'grace.red@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Hank', 'Gray', '0123456789', 'hank.gray@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Ivy', 'Gold', '1023456789', 'ivy.gold@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Jack', 'Silver', '2034567891', 'jack.silver@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Kim', 'Copper', '3045678912', 'kim.copper@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Liam', 'Bronze', '4056789123', 'liam.bronze@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Mia', 'Amber', '5067891234', 'mia.amber@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Noah', 'Quartz', '6078912345', 'noah.quartz@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Olivia', 'Pearl', '7089123456', 'olivia.pearl@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Paul', 'Stone', '8091234567', 'paul.stone@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Quinn', 'Jade', '9102345678', 'quinn.jade@example.com');
INSERT INTO customers (first_name, last_name, phone, email) VALUES ('Ruby', 'Diamond', '0123456798', 'ruby.diamond@example.com');

INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (1, 1, 5, '2024-11-01');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (2, 2, 10, '2024-11-02');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (3, 3, 7, '2024-11-03');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (4, 4, 8, '2024-11-04');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (5, 5, 12, '2024-11-05');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (6, 6, 9, '2024-11-06');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (7, 7, 4, '2024-11-07');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (8, 8, 3, '2024-11-08');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (9, 9, 2, '2024-11-09');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (10, 10, 6, '2024-11-10');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (11, 1, 1, '2024-11-11');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (12, 2, 4, '2024-11-12');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (13, 3, 2, '2024-11-13');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (14, 4, 3, '2024-11-14');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (15, 5, 5, '2024-11-15');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (16, 6, 7, '2024-11-16');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (17, 7, 6, '2024-11-17');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (18, 8, 3, '2024-11-18');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (19, 9, 1, '2024-11-19');
INSERT INTO sales (product_id, customer_id, quantity, sale_date) VALUES (20, 10, 2, '2024-11-20');

SELECT * FROM products;

-- Task 1:
SELECT * FROM products WHERE stock < 10;

-- Task 2:
SELECT 
	p.product_name,
	c.category_name
FROM products p
JOIN 
	categories c ON p.category_id = c.category_id;

-- Task 3:
SELECT 
	p.product_name,
	c.first_name,
	c.last_name
FROM sales s
JOIN 
	products p ON s.product_id = p.product_id
JOIN
	customers c ON s.customer_id = c.customer_id;

-- Task 4:
SELECT
	c.category_name,
	MIN(p.price) AS min_price
FROM products p
JOIN
	categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- Task 5:
SELECT
	p.product_name,
	SUM(s.quantity) AS total_quantity
FROM sales s
JOIN 
	products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity) > 5;

-- Task 6:
SELECT
	c.category_name,
	AVG(p.price) AS avg_price
FROM products p
JOIN
	categories c ON p.product_id = c.category_id
GROUP BY c.category_name
HAVING AVG(p.price) > 2;

-- Task 7:
SELECT DISTINCT 
    cu.first_name, 
    cu.last_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers cu ON s.customer_id = cu.customer_id
WHERE p.price > 5;

-- Task 8:
SELECT 
    cu.first_name, 
    cu.last_name, 
    COUNT(s.sale_id) AS total_sales
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id
HAVING COUNT(s.sale_id) > 3;

--Task 9:
SELECT 
    c.category_name, 
    SUM(p.price * s.quantity) AS total_sales_amount
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

--Task 10:
SELECT 
    p.product_name, 
    c.category_name, 
    SUM(s.quantity * p.price) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY p.product_name, c.category_name
HAVING SUM(s.quantity) > 3;

--Task 11:
SELECT 
    DISTINCT ON (c.category_name) c.category_name, 
    p.product_name, 
    p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name, p.price ASC;

--Task 12:
SELECT 
    c.category_name, 
    COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;

--Task 13:
SELECT 
    cu.first_name, 
    cu.last_name, 
    SUM(s.quantity * p.price) AS total_spent
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id
ORDER BY total_spent DESC
LIMIT 1;

--Task 14:
SELECT 
    SUM(s.quantity * p.price) AS total_sales_last_year
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.sale_date >= CURRENT_DATE - INTERVAL '1 year';

--Task 15:
SELECT 
    p.product_name, 
    SUM(s.quantity * p.price) AS total_sales_this_month
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE EXTRACT(MONTH FROM s.sale_date) = EXTRACT(MONTH FROM CURRENT_DATE)
	AND EXTRACT(YEAR FROM s.sale_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY p.product_name;