-- 3-4 - get total assignment submissions
SELECT cohorts.name as cohort, count(*) as total_submissions
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP by cohorts.name
ORDER by count(*) DESC;