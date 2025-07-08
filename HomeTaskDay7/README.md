# HomeTaskDay7

## 📦 academy_db Database (PostgreSQL 17.5)

## 📋 Maqsad: Qo‘shimcha SQL-so‘rovlar

- GROUP BY (guruhlash)

- SUBQUERIES (ichki so‘rovlar)

- Aggregate functions (agregat funksiyalar)

- DISTINCT (noyob qiymatlar)

- ORDER BY (saralash)

- LIMIT va OFFSET (cheklash va siljitish)

- IN (ichida bo‘lish)

- BETWEEN (oraliqda bo‘lish)

## 📦 Ma’lumotlar bazasi tuzilmasi

- 1. employees (xodimlar);
- 2. departments (bo‘limlar);
- 3. projects (loyihalar);
- 4. assignments (biriktirishlar);

## 📌 SELECT so‘rovlar:

## 1. Har bir bo‘limdagi xodimlar sonini hisoblang (employees jadvalidan GROUP BY department_id bilan).

```sql
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
```

## 2. Har bir xodim nechta loyihada ishtirok etayotganini hisoblang (assignments jadvalidan GROUP BY employee_id).

```sql
SELECT employee_id, COUNT(*) AS project_count
FROM assignments
GROUP BY employee_id;
```

## 3. employees jadvalidan noyob (takrorlanmas) lavozimlarni oling (DISTINCT).

```sql
SELECT DISTINCT position
FROM employees;
```

## 4. Ishga kirgan sanasi bo‘yicha tartiblab, dastlabki 5 xodimni oling (ORDER BY hire_date LIMIT 5).

```sql
SELECT full_name, hire_date
FROM employees
ORDER BY hire_date
LIMIT 5;
```

## 5. Tugash sanasi '2024-05-01' va '2024-12-31' oralig‘ida bo‘lgan loyihalarni toping (projects jadvalidan BETWEEN bilan).

```sql
SELECT project_name, end_date
FROM projects
WHERE end_date BETWEEN '2024-05-01' AND '2024-12-31';
```

## 6. employees jadvalidan ID’lari 2, 4, 7 bo‘lgan xodimlarni toping (IN bilan).

```sql
SELECT full_name
FROM employees
WHERE employee_id IN (2, 4, 7);
```

## 7. O‘rtacha oylikdan yuqori oylikka ega xodimlarni toping (AVG(salary) dan foydalanib ichki so‘rov).

```sql
SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

## 8. O‘rtacha oyligi 3000 dan yuqori bo‘lgan bo‘limlarni toping (ichki AVG(salary) va GROUP BY department_id).

```sql
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 3000;
```

## 9. Hech qanday xodim biriktirilmagan loyihalarni toping (projects va assignments bilan, NOT IN ishlatib).

```sql
SELECT project_name
FROM projects
WHERE project_id NOT IN (
    SELECT project_id
    FROM assignments
);
```

## 10. employees jadvalidan quyidagilarni hisoblang:

- Umumiy xodimlar soni (COUNT)

- O‘rtacha oylik (AVG)

- Eng kam oylik (MIN)

- Eng yuqori oylik (MAX)

```sql
SELECT
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees;
```
