-- 3-5 - average completion time - enrolled students only
SELECT students.name AS student, 
avg(assignment_submissions.duration) AS average_assignment_duration,
avg(assignments.duration) AS average_estimated_duration
FROM students

JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date is NULL
GROUP BY students.id
 -- pay attention to the question!
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;
