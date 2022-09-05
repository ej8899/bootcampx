-- 4-4-avgassisttime.sql
select AVG(ar.completed_at - ar.started_at) AS average_assistance_time
from assistance_requests as ar
;