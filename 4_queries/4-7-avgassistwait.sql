-- 4-7-avgassistwait.sql

select
	AVG(ar.started_at - ar.created_at) AS average_wait_time
from assistance_requests as ar
;
