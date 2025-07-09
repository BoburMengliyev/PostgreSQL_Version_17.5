# HomeTaskDay8

## 📋 Maqsad: PostgreSQL — JOIN amallari va SET operatorlari

## 🧠 O‘rganiladigan asosiy mavzular:

### 🔗 JOIN turlari

- **Implicit JOIN**: FROM va WHERE orqali bog‘lash (tavsiya etilmaydi)
- **Explicit JOIN**:
  - `INNER JOIN`: Faqat mos keluvchi qatorlar
  - `LEFT JOIN`: Chap jadvaldagi barcha, o‘ngdan mos tushganlar
  - `RIGHT JOIN`: O‘ng jadvaldagi barcha, chapdan mos tushganlar
  - `FULL OUTER JOIN`: Har ikkala jadvaldan hamma qator

### 📦 GROUPING IN JOIN

- JOIN'dan olingan natijalarni guruhlash (`GROUP BY`) orqali agregatsiya qilish.

### 📚 SET OPERATORS

- **UNION**: Ikkita SELECT natijasini birlashtirish (takrorlar chiqarilmaydi)
- **UNION ALL**: Takrorlarni ham chiqaradi
- **EXCEPT**: Birinchi SELECT'da bor, ikkinchisida yo‘q bo‘lganlar
- **INTERSECT**: Har ikkala SELECT'da bor bo‘lganlar
