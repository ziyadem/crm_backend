const fetchData = require("../../utils/pg");
 '2023-05-27'
const POSTATTENDANCE = `insert into attendance(student_id,attendance) values($1,$2) returning *`;
const GETATTENDANCEGROUP = `select s.student_name,s.id as student_id,g.group_title,g.id as group_id,a.date from groups g 
Join students s ON s.group_id=g.id
Join attendance a ON a.student_id=s.id
 where date=$1 and g.id=$2 and a.attendance=false;`;

const postAtendance = (...params) => fetchData(POSTATTENDANCE, params);
const getAtendance = (...params) => fetchData(GETATTENDANCEGROUP, params);

module.exports = {
  postAtendance,
  getAtendance,
};
