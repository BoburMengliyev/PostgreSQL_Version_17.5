# HomeTaskDay6

## 📦 academy_db Database (PostgreSQL 17.5)

## 📋 Maqsad:

- DISTINCT – takrorlanuvchi qiymatlarni ajratib olish

- ORDER BY – tartiblash

- LIMIT va OFFSET – ma’lumotlar sonini cheklash va o'tkazib yuborish

- IN – ma’lum qiymatlar ichida qidirish

- BETWEEN – qiymatlar oraliqda bo‘lishini tekshirish

- Agregat funksiyalar (COUNT, AVG, SUM, MIN, MAX)

## 📋 Jadvallar:

### 1. students (talabalar):

```sql
student_id SERIAL PRIMARY KEY
first_name VARCHAR(50) NOT NULL – ismi
last_name VARCHAR(50) NOT NULL – familiyasi
birth_year INT NOT NULL – tug‘ilgan yili
email VARCHAR(100) – elektron pochta
```

### 2. courses (kurslar):

```sql
course_id SERIAL PRIMARY KEY
course_name VARCHAR(100) NOT NULL – kurs nomi
category VARCHAR(50) – yo‘nalish
price NUMERIC(8,2) – narx
```

### 3. enrollments (ro‘yxatdan o‘tganlar):

```sql
enrollment_id SERIAL PRIMARY KEY
student_id INT REFERENCES students(student_id)
course_id INT REFERENCES courses(course_id)
enroll_date DATE NOT NULL – ro‘yxatdan o‘tgan sana
```

## 📌 Ma’lumot kiritish:

`students` (talabalar):

```sql
INSERT INTO students (first_name, last_name, birth_year, email) VALUES
('Ali', 'Rahmon', 2000, 'ali@email.com'),
('Zarina', 'Sharipova', 1999, 'zarina@email.com'),
('Omar', 'Saidov', 2001, 'omar@email.com'),
('Nilufar', 'Umarova', 2002, 'nilufar@email.com'),
('Karim', 'Hamidov', 2000, 'karim@email.com');
```

`courses` (kurslar):

```sql
INSERT INTO courses (course_name, category, price) VALUES
('Python Basics', 'Programming', 150),
('Web Design', 'Design', 200),
('English A1', 'Language', 100),
('Excel Advanced', 'Office', 120),
('C# Fundamentals', 'Programming', 250);
```

`enrollments` (ro‘yxatlar):

```sql
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES
(1, 1, '2024-04-01'),
(2, 2, '2024-04-05'),
(3, 3, '2024-04-10'),
(4, 1, '2024-04-12'),
(5, 5, '2024-04-15');
```

## 📌 SELECT so‘rovlar:

1. courses jadvalidan kurs kategoriyalarining takrorlanmaydigan `(DISTINCT)` ro'yxatini oling.

```sql
SELECT DISTINCT category FROM courses;
```

2. students jadvalidan talabalarni tug'ilgan yili bo'yicha tartiblab chiqarish `(ORDER BY)`.

```sql
SELECT * FROM students ORDER BY birth_year ASC;
```

3. courses jadvalidan dastlabki 3 ta kursni chiqarish `(LIMIT va OFFSET)`.

```sql
SELECT * FROM courses LIMIT 3 OFFSET 0;
```

4. students jadvalidan ID'si 1, 3, 5 bo‘lgan talabalarni toping `(IN)`.

```sql
SELECT student_id FROM students WHERE student_id IN(1, 3, 5);
```

5. courses jadvalidan narxi 100 dan 300 gacha bo'lgan kurslarni toping `(BETWEEN)`.

```sql
SELECT * FROM courses WHERE price BETWEEN 100 AND 300;
```

## 📌 Agregat funksiyalar:

6. Kurslar sonini hisoblang `(COUNT)`.

```sql
SELECT COUNT(*) FROM courses;
```

7. Kurslarning o‘rtacha narxini toping `(AVG)`.

```sql
SELECT AVG(price) FROM courses;
```

8. Eng arzon kurs narxini toping `(MIN)`.

```sql
SELECT MIN(price) FROM courses;
```

9. Eng qimmat kurs narxini toping `(MAX)`.

```sql
SELECT MAX(price) FROM courses;
```

10. Barcha kurs narxlarining yig‘indisini hisoblang `(SUM)`.

```sql
SELECT SUM(price) FROM courses;
```
