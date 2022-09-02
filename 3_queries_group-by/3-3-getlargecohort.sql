-- 3-3 - get large cohorts - 18 or more students
SELECT cohorts.name, count(students.*) as student_count
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP by cohorts.name
HAVING COUNT(students.*) > 17
ORDER by COUNT(students.*);
