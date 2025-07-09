# home_task:

```sql
-- Task 1: Omborda soni 10 dan kam bo‘lgan mahsulotlar ro‘yxatini chiqaring.
SELECT * FROM products WHERE stock < 10;
```

```sql
-- Task 2: Har bir mahsulotni tegishli kategoriyasi bilan birga ro‘yxatlang.
SELECT
	p.product_name,
	c.category_name
FROM products p
JOIN
	categories c ON p.category_id = c.category_id;
```

```sql
-- Task 3: Har bir sotuv bo‘yicha mahsulot nomi, xaridorning ismi va familiyasini ko‘rsating.
SELECT
	p.product_name,
	c.first_name,
	c.last_name
FROM sales s
JOIN
	products p ON s.product_id = p.product_id
JOIN
	customers c ON s.customer_id = c.customer_id;
```

```sql
-- Task 4: Har bir kategoriya bo‘yicha mahsulotlarning eng arzon narxini toping.
SELECT
	c.category_name,
	MIN(p.price) AS min_price
FROM products p
JOIN
	categories c ON p.category_id = c.category_id
GROUP BY c.category_name;
```

```sql
-- Task 5: Umumiy hisobda 5 martadan ko‘p sotilgan mahsulotlarni toping.
SELECT
	p.product_name,
	SUM(s.quantity) AS total_quantity
FROM sales s
JOIN
	products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity) > 5;
```

```sql
-- Task 6: Har bir kategoriya uchun mahsulotlarning o‘rtacha narxini hisoblang va o‘rtacha narxi 2 dan katta bo‘lganlarini chiqaring.
SELECT
	c.category_name,
	AVG(p.price) AS avg_price
FROM products p
JOIN
	categories c ON p.product_id = c.category_id
GROUP BY c.category_name
HAVING AVG(p.price) > 2;
```

```sql
-- Task 7: Narxi 5 dan yuqori bo‘lgan mahsulotlarni sotib olgan xaridorlarni chiqaring.
SELECT DISTINCT
    cu.first_name,
    cu.last_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers cu ON s.customer_id = cu.customer_id
WHERE p.price > 5;
```

```sql
-- Task 8: 3 martadan ko‘p xarid qilgan xaridorlarni (har birining sotuvlar soni bilan birga) ro‘yxatlang.
SELECT
    cu.first_name,
    cu.last_name,
    COUNT(s.sale_id) AS total_sales
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id
HAVING COUNT(s.sale_id) > 3;
```

```sql
--Task 9: Har bir kategoriya uchun umumiy sotuv summasini chiqaring (miqdor × narx asosida).
SELECT
    c.category_name,
    SUM(p.price * s.quantity) AS total_sales_amount
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;
```

```sql
--Task 10: 3 martadan ko‘p sotilgan mahsulotlarni, ularning kategoriyasi va umumiy sotuv summasi bilan birga chiqaring.
SELECT
    p.product_name,
    c.category_name,
    SUM(s.quantity * p.price) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY p.product_name, c.category_name
HAVING SUM(s.quantity) > 3;
```

```sql
--Task 11: Har bir kategoriya bo‘yicha eng arzon mahsulotni toping.
SELECT
    DISTINCT ON (c.category_name) c.category_name,
    p.product_name,
    p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name, p.price ASC;
```

```sql
--Task 12: Har bir kategoriyada nechta mahsulot borligini ko‘rsatuvchi ro‘yxat chiqaring.
SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;
```

```sql
--Task 13: Eng ko‘p pul sarflagan xaridorni toping (ismi, familiyasi va umumiy xarajat summasi bilan).
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
```

```sql
--Task 14: So‘nggi bir yil ichidagi umumiy sotuv hajmini chiqaring.
SELECT
    SUM(s.quantity * p.price) AS total_sales_last_year
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.sale_date >= CURRENT_DATE - INTERVAL '1 year';
```

```sql
--Task 15: Joriy oyda har bir mahsulot uchun umumiy sotuv hajmini chiqaring.
SELECT
    p.product_name,
    SUM(s.quantity * p.price) AS total_sales_this_month
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE EXTRACT(MONTH FROM s.sale_date) = EXTRACT(MONTH FROM CURRENT_DATE)
	AND EXTRACT(YEAR FROM s.sale_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY p.product_name;
```
