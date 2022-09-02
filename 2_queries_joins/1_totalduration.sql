-- example Join:
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;


-- what works on primary table
SELECT SUM(duration)
FROM assignment_submissions
WHERE student_id = 186;

-- final solution:
SELECT SUM(duration)
FROM assignment_submissions
INNER JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';


