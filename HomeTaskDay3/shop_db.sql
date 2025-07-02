CREATE TABLE users(
	user_id BIGSERIAL PRIMARY KEY,
	username TEXT UNIQUE NOT NULL,
	password TEXT NOT NULL
);

INSERT INTO users (username, password) VALUES
('ali1995', 'passAli!123'),
('malika_q', 'qwerty2024'),
('john_doe', 'securePass1'),
('nargiza12', 'nargiza#456'),
('bekmirza', 'bek@789');

CREATE TABLE user_profiles(
	profile_id BIGSERIAL PRIMARY KEY,
	user_id BIGINT, 
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone TEXT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO user_profiles (user_id, first_name, last_name, phone) VALUES
(1, 'Ali', 'Karimov', '+998901112233'),
(2, 'Malika', 'Qodirova', '+998931234567'),
(3, 'John', 'Doe', NULL),
(4, 'Nargiza', 'Islomova', '+998909998877'),
(5, 'Bekmirza', 'Tursunov', NULL);

CREATE TABLE orders(
	order_id BIGSERIAL PRIMARY KEY,
	user_id BIGINT REFERENCES users(user_id),
	order_date DATE DEFAULT CURRENT_DATE NOT NULL,
	total_amount NUMERIC NOT NULL
);

INSERT INTO orders (user_id, order_date, total_amount) VALUES
(1, '2025-07-01', 150.00),
(2, '2025-07-01', 220.50),
(3, '2025-07-02', 89.99),
(4, '2025-07-03', 310.75),
(5, '2025-07-03', 45.00);

CREATE TABLE products(
	product_id BIGSERIAL PRIMARY KEY,
	product_name VARCHAR(50) NOT NULL,
	price NUMERIC CHECK(price >= 0)
);

INSERT INTO products (product_name, price) VALUES
('Smartphone', 599.99),
('Laptop', 1099.50),
('Headphones', 149.95),
('Wireless Mouse', 29.99),
('Keyboard', 49.99);

CREATE TABLE order_products(
	order_id BIGINT REFERENCES orders(order_id ),
	product_id BIGINT REFERENCES products(product_id),
	quantity INTEGER CHECK(quantity > 0),
	PRIMARY KEY (order_id, product_id)
);

INSERT INTO order_products (order_id, product_id, quantity) VALUES
(1, 1, 2),   
(1, 3, 1),   
(2, 2, 1),   
(3, 4, 3),   
(4, 5, 1);

SELECT * FROM orders WHERE order_date = '2025-07-01';

SELECT * FROM user_profiles  WHERE first_name = 'Ali';

SELECT * FROM products WHERE price > 0;

SELECT * FROM orders WHERE user_id > 0;

SELECT * FROM order_products WHERE order_id > 0;

ALTER TABLE products
ADD COLUMN description VARCHAR(255);

ALTER TABLE products 
ALTER COLUMN price TYPE DECIMAL(10,2);

ALTER TABLE products
ADD COLUMN stock INT DEFAULT 0;

ALTER TABLE products
ALTER COLUMN stock SET DEFAULT 0;

ALTER TABLE orders
ADD COLUMN status VARCHAR(20) CHECK (status IN ('pending', 'completed', 'canceled'));

ALTER TABLE user_profiles 
ALTER COLUMN phone TYPE VARCHAR(20);

ALTER TABLE user_profiles 
DROP COLUMN phone;

ALTER TABLE order_products
ADD CONSTRAINT fk_order_products_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

SELECT * FROM products;