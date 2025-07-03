CREATE TABLE authors(
	id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	birth_year INTEGER NOT NULL,
	nationality VARCHAR(50) NOT NULL
);

CREATE TABLE books(
	id BIGSERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author_id BIGINT REFERENCES authors(id) ON DELETE SET NULL,
	publication_year INTEGER NOT NULL,
	isbn VARCHAR(13) UNIQUE NOT NULL,
	total_copies INTEGER NOT NULL,
	available_copies INTEGER NOT NULL
);

CREATE TABLE readers(
	id BIGSERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE borrowings(
	id BIGSERIAL PRIMARY KEY,
	book_id BIGINT REFERENCES books(id) ON DELETE SET NULL,
	reader_id BIGINT REFERENCES readers(id) ON DELETE SET NULL,
	borrow_date DATE DEFAULT CURRENT_DATE,
	due_date DATE DEFAULT CURRENT_DATE,
	return_date DATE DEFAULT NULL,
	status VARCHAR(100) NOT NULL
);

INSERT INTO authors (first_name, last_name, birth_year, nationality) VALUES
('George', 'Orwell', 1903, 'British'),
('Jane', 'Austen', 1775, 'British'),
('Mark', 'Twain', 1835, 'American'),
('Fyodor', 'Dostoevsky', 1821, 'Russian'),
('Chinua', 'Achebe', 1930, 'Nigerian');

INSERT INTO books (title, author_id, publication_year, isbn, total_copies, available_copies) VALUES
('1984', 1, 1949, '9780451524935', 10, 7),
('Animal Farm', 1, 1945, '9780451526342', 8, 3),
('Pride and Prejudice', 2, 1813, '9780141439518', 6, 4),
('Emma', 2, 1815, '9780141439587', 5, 2),
('Adventures of Huckleberry Finn', 3, 1884, '9780486280615', 7, 5),
('The Innocents Abroad', 3, 1869, '9780142437728', 4, 1),
('Crime and Punishment', 4, 1866, '9780140449136', 9, 6),
('The Brothers Karamazov', 4, 1880, '9780374528379', 5, 2),
('Things Fall Apart', 5, 1958, '9780385474542', 6, 4),
('No Longer at Ease', 5, 1960, '9780385474559', 4, 2);

INSERT INTO readers (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com'),
('Carol', 'Williams', 'carol.williams@example.com'),
('David', 'Brown', 'david.brown@example.com'),
('Emma', 'Davis', 'emma.davis@example.com'),
('Frank', 'Miller', 'frank.miller@example.com'),
('Grace', 'Wilson', 'grace.wilson@example.com'),
('Henry', 'Moore', 'henry.moore@example.com');

INSERT INTO borrowings (book_id, reader_id, borrow_date, due_date, return_date, status) VALUES
(1, 1, '2025-06-01', '2025-06-15', '2025-06-14', 'returned'),
(2, 2, '2025-06-05', '2025-06-19', NULL, 'borrowed'),
(3, 3, '2025-06-03', '2025-06-17', '2025-06-20', 'overdue'),
(4, 4, '2025-06-10', '2025-06-24', NULL, 'borrowed'),
(5, 5, '2025-06-11', '2025-06-25', '2025-06-24', 'returned'),
(6, 6, '2025-06-12', '2025-06-26', NULL, 'borrowed'),
(7, 7, '2025-06-13', '2025-06-27', NULL, 'borrowed'),
(8, 8, '2025-06-14', '2025-06-28', NULL, 'borrowed'),
(9, 1, '2025-06-15', '2025-06-29', '2025-06-29', 'returned'),
(10, 2, '2025-06-16', '2025-06-30', NULL, 'borrowed'),
(3, 4, '2025-06-17', '2025-07-01', NULL, 'borrowed'),
(5, 6, '2025-06-18', '2025-07-02', NULL, 'borrowed');

ALTER TABLE authors
RENAME COLUMN birth_year TO birth_date;

ALTER TABLE books
ADD COLUMN rating INTEGER; 

ALTER TABLE books 
ADD CONSTRAINT rating_check CHECK(rating BETWEEN 1 and 5);

ALTER TABLE books
ADD COLUMN genre VARCHAR(50);

ALTER TABLE books
ADD COLUMN description VARCHAR(100);

ALTER TABLE books
ALTER COLUMN isbn TYPE VARCHAR(17);

ALTER TABLE books
ADD COLUMN rating INTEGER CHECK(rating BETWEEN 1 and 5);

ALTER TABLE books
DROP COLUMN rating;

ALTER TABLE readers 
ADD COLUMN address VARCHAR(100);

ALTER TABLE readers
ADD COLUMN phone VARCHAR(50) UNIQUE;

SELECT * FROM books
WHERE rating > 4 AND available_copies > 0; 

SELECT * FROM books
WHERE publication_year > 2000 OR rating = 5;

SELECT * FROM borrowings
WHERE status = 'overdue' AND return_date IS NULL;

SELECT * FROM books
ORDER BY rating DESC, title ASC;

SELECT * FROM books
ORDER BY publication_year DESC, title ASC;

TRUNCATE TABLE borrowings;

DELETE FROM readers
WHERE id = 5;

UPDATE borrowings
SET status = 'overdue'
WHERE due_date < CURRENT_DATE AND return_date IS NULL;

SELECT * FROM books
WHERE isbn IS NOT NULL AND publication_year > 1990;

ALTER TABLE books
ALTER COLUMN title SET NOT NULL;

UPDATE readers 
SET email = 'new_email@example.com'
WHERE id = 3;

SELECT * FROM books
WHERE isbn IS NULL;

DELETE FROM books
WHERE total_copies = 0;

ALTER TABLE borrowings
RENAME TO loans;

SELECT * FROM loans;