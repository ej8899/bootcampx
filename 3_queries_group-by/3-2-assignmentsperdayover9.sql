-- 3-2 - total assignments per day with 10 or more
SELECT day, COUNT(*) as total_assignments
FROM assignments
GROUP by assignments.day
HAVING COUNT(*) > 9
ORDER by assignments.day;