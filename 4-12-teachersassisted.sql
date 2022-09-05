-- 4-12-teachersassisted.sql

select t.name as teacher, c.name as cohort

 from assistance_requests as ar
 join students on students.id = ar.student_id
 join cohorts as c on students.cohort_id = c.id 
 join teachers as t on t.id = teacher_id
 where c.name = 'JUL02'
 group by teacher,cohort
 order by teacher
 ;