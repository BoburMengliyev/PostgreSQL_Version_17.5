# HomeTaskDay10

## 📋 Maqsad repetition - takrorlash:

```sql
SELECT * FROM admissions;
```

```sql
select distinct year(birth_date) AS birth_year FROm patients order by birth_year;
```

```sql
select first_name from patients group by first_name HAVINg count(first_name) = 1;
```

```sql
select patient_id, first_name from patients WHERE first_name LIKE 'S%s' AND len(first_name) > 5;
```

```sql
select first_name FROM patients order by len(first_name),first_name;
```

```sql
select
(select count(_) FROM patients Where gender='M') AS male_count,
(select count(_) from patients where gender='F') AS female_count;
```

```sql
select first_name, last_name, allergies from patients where allergies IN ('Morphine', 'Penicillin') order by allergies, first_name, last_name;
```

```sql
select patient_id, diagnosis FRom admissions
group by
diagnosis, patient_id
having count(\*) > 1;
```

```sql
select city, count(\*) AS num_patients FROM patients group by city order by num_patients desc, city asc;
```

```sql
select first_name, last_name, 'Patient' AS role FROM patients
UNION ALL
select first_name, last_name, 'Doctor' AS role FROM doctors
order by first_name;
```

```sql
select allergies, count(\*) AS total_diagnosis
FROM patients
where allergies IS NOT NULL
group by allergies
order by total_diagnosis desc;
```

```sql
select first_name, last_name, birth_date
FROm patients
where YEAR(birth_date) between 1970 and 1979
order by birth_date;
```

```sql
select Concat(upper(last_name),',', lower(first_name)) AS new_name_format FRom patients order by first_name desc;
```

```sql
select province_id,SUM(height) AS sum_height FROM patients group by province_id HAving sum_height >= 7000;
```

```sql
select MAX(weight) - MIN(weight) AS weight_delta from patients where last_name = 'Maroni';
```

```sql
select
DAy(admission_date) AS day_number,
COunt(\*) AS number_of_admissions
FROM admissions
group by day_number
order by number_of_admissions desc;
```

```sql
select \* FROm admissions where patient_id = 542 group by patient_id having admission_date = max(admission_date);
```

```sql
select patient_id, attending_doctor_id, diagnosis FROM admissions
where (attending_doctor_id IN (1, 5, 19) AND patient_id % 2 != 0) OR (attending_doctor_id LIKE '%2%' AND LEN(patient_id) = 3);
```

```sql
select doctor_id, first_name || ' ' || last_name AS full_name,
MIN(admission_date) As first_admission_date,
MAx(admission_date) AS last_admission_date
FROM admissions a
join doctors ph ON a.attending_doctor_id = ph.doctor_id
group by doctor_id;
```

```sql
select province_name, count(\*) AS patient_count
FROM patients pa
join province_names pr ON pr.province_id = pa.province_id
group by pr.province_id order by patient_count desc;
```

```sql
select
concat(patients.first_name, ' ', patients.last_name) AS patient_name, diagnosis,
concat(doctors.first_name, ' ', doctors.last_name) AS doctor_name
FROm patients
join admissions ON admissions.patient_id = patients.patient_id
join doctors ON doctors.doctor_id = admissions.attending_doctor_id;
```

```sql
select first_name, last_name, count(_) AS num_of_duplicates FROM patients group by first_name, last_name having count(_) > 1;
```

```sql
select
concat(first_name, ' ', last_name) AS 'patient_name',
round(height / 30.48, 1) AS 'height "Feet"',
ROUND(weight \* 2.205, 0) AS 'weight "Pounds"', birth_date,
CASE
wheN gender = 'M' THEN 'MALE'
ELSE 'FEMALE'
END AS 'gender_type'
FROM patients;
```

```sql
select
patients.patient_id,
first_name,
last_name
from patients
where patients.patient_id NOT IN (
select admissions.patient_id
FROM admissions
);
```

```sql
select
max(number_of_visits) as max_visits,
min(number_of_visits) as min_visits,
round(avg(number_of_visits),2) as average_visits
from (
select admission_date, count(\*) as number_of_visits
from admissions
group by admission_date
);
```
