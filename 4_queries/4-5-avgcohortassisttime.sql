-- 4-5-avgcohortassisttime.sql

select
	c.name,
	AVG(ar.completed_at - ar.started_at) AS average_assistance_time
from assistance_requests as ar
join students as s on s.id = ar.student_id
join cohorts as c on c.id = s.cohort_id
group by c.name
order by average_assistance_time
;