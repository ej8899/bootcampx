-- 4-10-mostconfusing.sql

select ass.id, ass.name,ass.day, ass.chapter,
	count(ar.*) as total_requests
from assistance_requests as ar
JOIN assignments as ass ON ar.assignment_id = ass.id
GROUP By ass.id
ORDER by total_requests DESC;
;