# HomeTaskDay8

## 📋 Maqsad repetition - takrorlash:

```sql
SELECT * FROM province_names;
```

```sql
SELECT first_name, last_name, gender from patients where gender = 'M';
```

```sql
SELECT first_name, last_name from patients where allergies is null;
```

```sql
select first_name from patients where first_name LIKE 'C%';
```

```sql
update patients
set allergies = 'NKA'
where allergies IS null;
```

```sql
select concat (first_name, ' ' ,last_name) AS full_name
from patients;
```

```sql
SELECT
  first_name,
  last_name,
  province_name
FROM patients
  JOIN province_names ON province_names.province_id = patients.province_id;
```

```sql
select first_name, last_name From patients
	where weight between 100 AND 120;
```

```sql
select count(*) AS total_patients from patients where year(birth_date) = 2010;
```

```sql
select first_name,last_name, max(height) from patients;
```

```sql
select * from patients where patient_id in(1, 45, 534, 879, 1000);
```

```sql
select count(*) AS total_admissions FROM admissions;
```

```sql
select * FRom admissions where admission_date = discharge_date;
```

```sql
select patient_id, count(*) AS total_admissions
from admissions
where patient_id = 579;
```

```sql
SELECT distinct(city) AS unique_cities
from patients
where province_id = 'NS';
```

```sql
select first_name, last_name, birth_date from patients
where height > 160 AND weight > 70;
```

```sql
select first_name, last_name, allergies from patients where allergies not null and city = 'Hamilton';
```
