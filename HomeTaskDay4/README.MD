# HomeTaskDay4

## 📦 mix_tj Database (PostgreSQL 17.5)

## 📋 Maqsad:

Ushbu loyiha PostgreSQL yoki boshqa SQL bazalarida mashq qilish uchun mo‘ljallangan SQL so‘rovlar to‘plamini o‘z ichiga oladi. Maqsad — ma’lumotlar bazasini boshqarish va ma’lumotlarni so‘rash (query) bo‘yicha ko‘nikmalarni mustahkamlash.

## 🗃️ 1. Baza va jadvallar yaratish

### Baza yaratish:

```sql
CREATE DATABASE mix_tj;
```

## 📋 Jadvallar:

- categories — Video toifalari

- videos — Videolar

- users — Foydalanuvchilar

- comments — Foydalanuvchi fikrlari

- ratings — Videoga baholar

- favorites — Foydalanuvchining yoqtirgan videolari

## 📌 Qo‘shimcha talablar:

1. username maydoni uzunligi 100 belgigacha bo‘lishi kerak.

2. ratings jadvalidagi rating ustunida quyidagi cheklov bo'lishi lozim: CHECK (rating BETWEEN 1 AND 5).

3. videos jadvalidagi status ustuni video holatini bildiradi: "черновик" yoki "опубликовано".

4. duration ustuni video davomiyligini soniyalar bilan saqlaydi.

5. users o‘chirilganda, unga tegishli barcha videolar, kommentlar, baholar va favorites yozuvlari avtomatik o‘chiriladi.

6. videos o‘chirilganda, unga tegishli barcha kommentlar va baholar avtomatik o‘chiriladi.

## 📚 SQL topshiriqlar ro‘yxati:

1. Barcha noyob kategoriya nomlarini ko‘rsatish.

```sql
SELECT DISTINCT name FROM categories;
```

2. Kategoriyalarni nomi bo‘yicha saralab ko‘rsatish.

```sql
SELECT * FROM categories ORDER BY name;
```

3. 5 ta yozuvni, birinchi 5 tasini o‘tkazib, chiqarish.

```sql
SELECT * FROM categories ORDER BY id OFFSET 5 LIMIT 5;
```

4. description bo‘sh yoki NULL bo‘lgan kategoriyalar.

```sql
SELECT * FROM categories WHERE description IS NULL OR description = '';
```

5. name = 'Music', 'Sport', 'News' bo‘lgan yozuvlar.

```sql
SELECT * FROM categories WHERE name IN ('Music', 'Sport', 'News');
```

6. views 100 va 1000 orasidagi videolar.

```sql
SELECT * FROM videos WHERE views BETWEEN 100 AND 1000;
```

7. status = 'черновик' yoki 'опубликовано' bo‘lgan videolar.

```sql
SELECT * FROM videos WHERE status IN ('опубликовано', 'черновик');
```

8. Eng so‘nggi ro‘yxatdan o‘tgan foydalanuvchini topish.

```sql
SELECT * FROM users ORDER BY created_at DESC LIMIT 1;
```

9. Ma’lum postga tegishli eng so‘nggi 5 komment.

```sql
SELECT * FROM comments WHERE video_id = ? ORDER BY posted_at DESC LIMIT 5;
```

10. videos jadvalidagi umumiy video soni.

```sql
SELECT COUNT(*) AS total_videos FROM videos;
```

11. users jadvalidagi foydalanuvchilar soni.

```sql
SELECT COUNT(*) AS total_users FROM users;
```

12. views ustuni bo‘yicha umumiy ko‘rishlar soni.

```sql
SELECT SUM(views) AS total_views FROM videos;
```

13. O‘rtacha rating qiymati.

```sql
SELECT AVG(rating) AS average_rating FROM ratings;
```

14. views bo‘yicha minimal va maksimal qiymat.

```sql
SELECT MIN(views) AS min_views, MAX(views) AS max_views FROM videos;
```

15. Eng ko‘p ko‘rilgan 5 ta nashr etilgan video.

```sql
SELECT * FROM videos WHERE status = 'опубликовано' ORDER BY views DESC LIMIT 5;
```

16. views > 1000 bo‘lgan videolardan keyingi 5 ta yozuv.

```sql
SELECT * FROM videos WHERE views > 1000 ORDER BY views DESC OFFSET 5 LIMIT 5;
```

17. Videolarni nom bo‘yicha alifbo tartibida chiqarish.

```sql
SELECT * FROM videos ORDER BY title ASC LIMIT 10;
```

18. Eng ko‘p ko‘rilgan 10 ta video.

```sql
SELECT * FROM videos ORDER BY views DESC LIMIT 10;
```

19. Eng kam ko‘rilgan bitta video.

```sql
SELECT * FROM videos ORDER BY views ASC LIMIT 1;
```

20. status = 'черновик' bo‘lgan videolar soni.

```sql
SELECT COUNT(*) AS draft_count FROM videos WHERE status = 'черновик';
```

21. Videolarning o‘rtacha davomiyligi (soniyalar).

```sql
SELECT AVG(duration) AS avg_duration FROM videos;
```

22. Videolarning umumiy davomiyligi.

```sql
SELECT SUM(duration) AS total_duration FROM videos;
```

23. Eng uzun 3 ta komment (content bo‘yicha).

```sql
SELECT * FROM comments ORDER BY LENGTH(content) DESC LIMIT 3;
```

24. Eng qisqa 5 ta komment.

```sql
SELECT * FROM comments ORDER BY LENGTH(content) ASC LIMIT 5;
```

25. @gmail.com domenli foydalanuvchilar soni.

```sql
SELECT COUNT(*) AS gmail_users FROM users WHERE email LIKE '%@gmail.com';
```

26. ratings jadvalida 5 bahosi nechta marta ishlatilganini hisoblash.

```sql
SELECT COUNT(*) AS rating_5_count FROM ratings WHERE rating = 5;
```
