-- 3-3 - get large cohorts - 18 or more students
SELECT cohorts.name, count(students.*) as student_count
FROM students
GROUP by cohort_id
HAVING COUNT(students.*) > 17
JOIN cohorts ON students.cohort_id = cohorts.id
ORDER by count(students.*);



SELECT count(students.*) as student_count
FROM students
GROUP by cohort_id
HAVING COUNT(students.*) > 17

ORDER by count(students.*);