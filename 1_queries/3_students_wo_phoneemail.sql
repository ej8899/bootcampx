SELECT name, id, cohort_id
FROM students
WHERE phone IS NULL OR email is NULL
ORDER BY name