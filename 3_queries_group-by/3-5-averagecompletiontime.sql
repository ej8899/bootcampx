-- 3-5 - average completion time
SELECT cohorts.name as cohort, count(*) as total_submissions
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP by cohorts.name
ORDER by count(*) DESC;


SELECT students.name as student, AVG(duration) as average_assignment_duration
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
GROUP BY students.name
ORDER BY average_assignment_duration DESC;
WHERE students.end_date IS NULL;