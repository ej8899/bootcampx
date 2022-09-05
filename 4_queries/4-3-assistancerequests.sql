-- 4-3-assistancerequests.sql

select 
	t.name as teacher,
	s.name as student,
	a.name as assignment,
	(ar.completed_at - ar.created_at) as duration
from assistance_requests ar
join teachers as t on t.id = ar.teacher_id
join students as s on s.id = ar.student_id
join assignments as a on a.id = ar.assignment_id
group by t.name, s.name, a.name, ar.completed_at, ar.created_at
order by duration asc
;


-- 4-3-assistancerequests.sql

select 
	t.name as teacher,
	s.name as student,
	a.name as assignment,
	(ar.completed_at - ar.started_at) as duration
from assistance_requests as ar
join teachers as t on t.id = ar.teacher_id
join students as s on s.id = ar.student_id
join assignments as a on a.id = ar.assignment_id
order by duration
;

-- LHL version which gives desired output:
SELECT
	teachers.name as teacher, 
	students.name as student, 
	assignments.name as assignment, 
	(completed_at-started_at) as duration
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;