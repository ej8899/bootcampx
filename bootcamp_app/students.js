//
// LHL - bootcampx w postgress node interface.
// https://flex-web.compass.lighthouselabs.ca/workbooks/flex-m05w12/activities/767?journey_step=42&workbook=16
//

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// update to use argv -- 
// argv2 is cohort name (or "LIKE" cohort name: FEB as example)
// argv3 is limit of results as number (: 2)
// example: node students.js FEB 10

// set some defaults in user didn't enter anything
if(!process.argv[3]) {
  process.argv[3] = 10;
}
if(!process.argv[2]) {
  process.argv[2] = 'FEB';
}

pool.query(`
SELECT s.id, s.name, c.name as cohortname
FROM students as s
join cohorts as c on c.id = s.cohort_id
WHERE c.name LIKE '%${process.argv[2]}%'
LIMIT ${process.argv[3]}
`)
.then(res => {
  res.rows.forEach(user => {
  //console.log(`${user.name} has an id of \t${user.id} and was in the \t${user.cohort_id} cohort`);
  console.log(`${user.name} has an id of \t${user.id} and was in the \t${user.cohortname} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));


/*
pool.query(`
SELECT students.id, students.name, c.name as cohortname
FROM students
join cohorts as c on c.id = students.cohort_id
LIMIT 5;
`)
.then(res => {
  // console.log(res.rows); // output ENTIRE object returned

  res.rows.forEach(user => {
  //console.log(`${user.name} has an id of \t${user.id} and was in the \t${user.cohort_id} cohort`);
  console.log(`${user.name} has an id of \t${user.id} and was in the \t${user.cohortname} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));
*/