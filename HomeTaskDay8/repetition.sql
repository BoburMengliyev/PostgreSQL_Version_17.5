SELECT * FROM province_names;

SELECT first_name, last_name, gender from patients where gender = 'M';

SELECT first_name, last_name from patients where allergies is null;

select first_name from patients where first_name LIKE 'C%';

update patients
set allergies = 'NKA'
where allergies IS null;

select concat (first_name, ' ' ,last_name) AS full_name
from patients;

SELECT
  first_name,
  last_name,
  province_name
FROM patients
  JOIN province_names ON province_names.province_id = patients.province_id;

select first_name, last_name From patients
	where weight between 100 AND 120;

select count(*) AS total_patients from patients where year(birth_date) = 2010;

select first_name,last_name, max(height) from patients;

select * from patients where patient_id in(1, 45, 534, 879, 1000);

select count(*) AS total_admissions FROM admissions;

select * FRom admissions where admission_date = discharge_date;

select patient_id, count(*) AS total_admissions
from admissions
where patient_id = 579;

SELECT distinct(city) AS unique_cities
from patients
where province_id = 'NS';

select first_name, last_name, birth_date from patients
where height > 160 AND weight > 70;

select first_name, last_name, allergies from patients where allergies not null and city = 'Hamilton';