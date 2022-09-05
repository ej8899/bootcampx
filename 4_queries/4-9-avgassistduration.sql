-- 4-9-avgassistduration.sql

select
	--c.name,
	SUM(ar.completed_at - ar.started_at) AS total_duration
from assistance_requests as ar

join students as s on s.id = ar.student_id
join cohorts as c on c.id = s.cohort_id
--group by c.name
order by total_duration asc
;