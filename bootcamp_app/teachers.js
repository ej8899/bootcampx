//
// LHL - bootcampx w postgress node interface.
// https://flex-web.compass.lighthouselabs.ca/workbooks/flex-m05w12/activities/767?journey_step=42&workbook=16
// teachers.js
//


const { Pool } = require('pg');
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// set some defaults in user didn't enter anything
if(!process.argv[2]) {
  process.argv[2] = 'JUL02';
}

// BELOW is SQL injection setup --  
// put items into "values" and then in SQL qhere we're using $1 and $2 (etc) as required
const cohortName = process.argv[2];
// Store all potentially malicious values in an array.
const values = [`${cohortName}`];

pool.query(`
select t.name as teacher, c.name as cohort

 from assistance_requests as ar
 join students on students.id = ar.student_id
 join cohorts as c on students.cohort_id = c.id 
 join teachers as t on t.id = teacher_id
 where c.name = $1
 group by teacher,cohort
 order by teacher;
`,values)
.then(res => {
  res.rows.forEach(user => {
  console.log(`${user.cohort}:\t${user.teacher}`)
  })
})
.catch(err => console.error('query error', err.stack));

