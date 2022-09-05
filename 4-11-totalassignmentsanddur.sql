-- 4-11-totalassignmentsanddur.sql

select ass.day as day,
	count (ass.*) as number_of_assignments,
	sum (ass.duration) as duration
from assignments as ass
group by ass.day
order by ass.day
;