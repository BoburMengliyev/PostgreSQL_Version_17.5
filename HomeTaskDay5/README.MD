# HomeTaskDay5

## 📦 library_db Database (PostgreSQL 17.5)

## 📋 Maqsad:

Har bir topshiriq uchun kerakli SQL so`rovlar yoziladi va ular ma'lumotlar bazasida quyidagi amallarni bajaradi:

- Jadvaldagi ma'lumotlarni tanlash, tartiblash va filtr qilish.
- Ma'lumotlarni yangilash va o'chirish.
- Jadval strukturasini o'zgartirish (ustun qo'shish, cheklovlar qo'shish, jadval nomini o'zgartirish).

## 📋 Jadvallar:

- authors
- books
- readers
- borrowings

## ✅ Jadvallar bilan ishlash bo‘yicha topshiriqlar:

## 1. Barcha jadvallarni to‘g‘ri tashqi kalitlar `(FOREIGN KEY REFERENCES)` bilan yarating.

```sql
CREATE TABLE authors(
	id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birth_year INTEGER NOT NULL,
	nationality VARCHAR(50) NOT NULL
);
```

```sql
CREATE TABLE books(
	id BIGSERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author_id BIGINT REFERENCES authors(id) ON DELETE SET NULL,
	publication_year INTEGER NOT NULL,
	isbn VARCHAR(13) UNIQUE NOT NULL,
	total_copies INTEGER NOT NULL,
	available_copies INTEGER NOT NULL
);
```

```sql
CREATE TABLE readers(
	id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	registration_date DATE DEFAULT CURRENT_DATE
);
```

```sql
CREATE TABLE borrowings(
	id BIGSERIAL PRIMARY KEY,
	book_id BIGINT REFERENCES books(id) ON DELETE SET NULL,
	reader_id BIGINT REFERENCES readers(id) ON DELETE SET NULL,
	borrow_date DATE DEFAULT CURRENT_DATE,
	due_date DATE DEFAULT CURRENT_DATE,
	return_date DATE DEFAULT NULL,
	status VARCHAR(100) NOT NULL
);
```

## 2. `Authors` jadvaliga 5 ta muallifni qo‘shing.

```sql
INSERT INTO authors (first_name, last_name, birth_year, nationality) VALUES
('George', 'Orwell', 1903, 'British'),
('Jane', 'Austen', 1775, 'British'),
('Mark', 'Twain', 1835, 'American'),
('Fyodor', 'Dostoevsky', 1821, 'Russian'),
('Chinua', 'Achebe', 1930, 'Nigerian');
```

## 3. `Books` jadvaliga 10 ta kitob qo‘shing, ularni mualliflar orasida taqsimlang.

```sql
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
```

## 4. `Readers` jadvaliga 8 ta o‘quvchini qo‘shing.

```sql
INSERT INTO readers (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com'),
('Carol', 'Williams', 'carol.williams@example.com'),
('David', 'Brown', 'david.brown@example.com'),
('Emma', 'Davis', 'emma.davis@example.com'),
('Frank', 'Miller', 'frank.miller@example.com'),
('Grace', 'Wilson', 'grace.wilson@example.com'),
('Henry', 'Moore', 'henry.moore@example.com');
```

## 5. `Borrowings` jadvaliga 12 ta kitob berilganlik yozuvini yarating.

```sql
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
```

6. Agar mavjud bo‘lmasa, `borrowings` jadvalidagi id ustuniga `PRIMARY KEY` (asosiy kalit) belgilang.

```sql
    -- (all borrowings already have PRIMARY KEY in 1-step)
```

7. Qaysi ustunlarda `NOT NULL` cheklovi borligini tekshiring va agar yo‘q bo‘lsa, books jadvalidagi isbn ustuniga `NOT NULL` cheklovi qo‘shing.

```sql
ALTER TABLE books ALTER COLUMN isbn SET NOT NULL;
```

8. Agar yo‘q bo‘lsa, `readers` jadvalidagi `email` ustuniga `UNIQUE` (takrorlanmas) cheklovi qo‘shing.

```sql
ALTER TABLE readers ADD CONSTRAINT unique_email UNIQUE (email);
```

9. `Authors` jadvalidagi `birth_year` ustunini `birth_date` deb qayta nomlang (RENAME COLUMN).

```sql
ALTER TABLE authors RENAME COLUMN birth_year TO birth_date;
```

10. `Books` jadvalidagi `rating` ustuniga `CHECK` cheklovi qo‘shing — qiymat 1 va 5 orasida bo‘lishi kerak.

```sql
ALTER TABLE books ADD CONSTRAINT check_rating CHECK (rating BETWEEN 1 AND 5);
```

## 🔧 `ALTER TABLE` orqali jadval strukturasini o‘zgartirish topshiriqlari:

11. `Books` jadvaliga `genre` ustunini qo‘shing (ADD COLUMN).

```sql
ALTER TABLE books ADD COLUMN genre VARCHAR(50);
```

12. `Books` jadvaliga `description` ustunini qo‘shing.

```sql
ALTER TABLE books ADD COLUMN description TEXT;
```

13. `Books` jadvalidagi `isbn` ustunining ma’lumot turini 17 ta belgini qabul qiladigan qilib o‘zgartiring (avval 13 edi).

```sql
ALTER TABLE books ALTER COLUMN isbn TYPE VARCHAR(17);
```

14. `Books` jadvaliga rating ustunini `(INTEGER)` qo‘shing va unga `CHECK (rating BETWEEN 1 AND 5)` cheklovini o‘rnating.

```sql
ALTER TABLE books ADD COLUMN rating INTEGER CHECK (rating BETWEEN 1 AND 5);
```

15. Readers jadvaliga o‘quvchi haqida batafsil ma’lumot saqlash uchun address ustunini qo‘shing.

```sql
ALTER TABLE readers ADD COLUMN address TEXT;
```

16. Readers jadvalidagi phone ustuniga UNIQUE cheklovi qo‘shing.

```sql
ALTER TABLE readers ADD CONSTRAINT unique_phone UNIQUE (phone);
```

## 📊 Ma’lumotlar bilan ishlash `(SELECT, INSERT, DELETE, UPDATE)`:

17. `rating > 4` va `available_copies > 0 `bo‘lgan kitoblar ro‘yxatini oling.

```sql
SELECT * FROM books WHERE rating > 4 AND available_copies > 0;
```

18. `publication_year > 2000` yoki `rating = 5` bo‘lgan kitoblarni filtrlang.

```sql
SELECT * FROM books WHERE publication_year > 2000 OR rating = 5;
```

19. Qarzdorlar ro‘yxatini oling: `status = 'overdue'` va `return_date IS NULL`.

```sql
SELECT * FROM borrowings WHERE status = 'overdue' AND return_date IS NULL;
```

20. Kitoblarni `rating` bo‘yicha kamayish tartibida, `title` bo‘yicha esa oshish tartibida saralang: ORDER BY rating `DESC`, title `ASC`.

```sql
SELECT * FROM books ORDER BY rating DESC, title ASC;
```

21. Kitoblar ro‘yxatini `publication_year` bo‘yicha kamayish tartibida (DESC) va `title` bo‘yicha oshish tartibida (ASC) chiqaring.

```sql
SELECT * FROM books ORDER BY publication_year DESC, title ASC;
```

22. `borrowings` jadvalidagi barcha yozuvlarni o‘chirib tashlang, lekin jadvalning o‘zini emas `(TRUNCATE)`.

```sql
TRUNCATE TABLE borrowings;
```

23. `readers` jadvalidan `id = 5` bo‘lgan o‘quvchini o‘chirib tashlang `(DELETE FROM)`.

```sql
DELETE FROM readers WHERE id = 5;
```

24. Agar `due_date < CURRENT_DATE` va `return_date IS NULL` bo‘lsa, borrowings jadvalidagi status ustunini overdue qilib yangilang.

```sql
UPDATE borrowings
SET status = 'overdue'
WHERE due_date < CURRENT_DATE AND return_date IS NULL;
```

25. `isbn NULL` bo‘lmagan va `publication_year 1990` yildan katta bo‘lgan kitoblarni chiqaring.

```sql
SELECT * FROM books WHERE isbn IS NOT NULL AND publication_year > 1990;
```

26. Agar mavjud bo‘lmasa, `books` jadvalidagi `title` ustuniga `NOT NULL` cheklovi qo‘shing.

```sql
ALTER TABLE books ALTER COLUMN title SET NOT NULL;
```

27. `id = 3` bo‘lgan o‘quvchining `email` manzilini `new_email@example.com` deb yangilang.

```sql
UPDATE readers SET email = 'new_email@example.com' WHERE id = 3;
```

28. `isbn IS NULL` bo‘lgan kitoblarni chiqaring.

```sql
SELECT * FROM books WHERE isbn IS NULL;
```

29. `total_copies = 0` bo‘lgan kitoblarni books jadvalidan o‘chirib tashlang `(DELETE)`.

```sql
DELETE FROM books WHERE total_copies = 0;
```

30. `borrowings` jadvalini `loans` deb qayta nomlang.

```sql
ALTER TABLE borrowings RENAME TO loans;
```
