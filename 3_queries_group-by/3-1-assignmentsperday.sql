-- 3-1 - total assignments per day
SELECT day, COUNT(id) as total_assignments
FROM assignments
GROUP BY day
ORDER by day;