CREATE DATABASE  CRM;
\c crm

--admin
DROP TABLE IF EXISTS admin;
CREATE TABLE admin(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "username" VARCHAR(100) UNIQUE NOT NULL,
    "password" VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO admin(username,password) VALUES('ziyadem','ziyadem17');

--course
DROP TABLE IF EXISTS courses cascade;
CREATE TABLE courses(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "course_title" VARCHAR(100) UNIQUE NOT NULL,
    "time" TIMESTAMP  DEFAULT NOW()
);
INSERT INTO courses(course_title) VALUES('backend');
INSERT INTO courses(course_title) VALUES('frontend');
INSERT INTO courses(course_title) VALUES('full-stack');
INSERT INTO courses(course_title) VALUES('matematika');
INSERT INTO courses(course_title) VALUES('inglis tili');
select * from courses;


--teachers
DROP TABLE IF EXISTS teachers cascade;
CREATE TABLE teachers(
    "id" SERIAL NOT NULL PRIMARY KEY, 
    "teacher_name" VARCHAR(100)  NOT NULL,
    "teacher_surname" VARCHAR(100) NOT NULL,
    "teacher_tell" INT UNIQUE NOT NULL,
    "teacher_img" text NOT NULL
);
INSERT INTO teachers(teacher_name,teacher_surname,teacher_tell,teacher_img) VALUES('Alisher','Egamberdiyev',991234567,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1684941146/exam_three_folder/vjinedbfturezigf4yjg.jpg');
INSERT INTO teachers(teacher_name,teacher_surname,teacher_tell,teacher_img) VALUES('Jorabek','Suyunov',901234567,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1684941038/exam_three_folder/ljvicljyibe5tpi9abk4.jpg');
INSERT INTO teachers(teacher_name,teacher_surname,teacher_tell,teacher_img) VALUES('Husnidin','Tangirov',951234567,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1684940935/exam_three_folder/a7r52wroldbaxwh7noqq.jpg');
select * from teachers;



--groups
DROP TABLE IF EXISTS groups cascade;
CREATE TABLE groups(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "group_title" VARCHAR(100) UNIQUE NOT NULL,
    "day_lesson" VARCHAR(100) NOT NULL,
    "time_lesson" VARCHAR(100) NOT NULL,
    "teacher_id" INT ,
    CONSTRAINT groups_teacher
    FOREIGN KEY(teacher_id) 
	REFERENCES teachers(id),
    "course_id" INT,
    CONSTRAINT groups_course
    FOREIGN KEY(course_id) 
	REFERENCES courses(id)
);
INSERT INTO groups(group_title,day_lesson,time_lesson,teacher_id,course_id) VALUES('backend-n1','se-chor-pay','08:00-11:00',2,1);
INSERT INTO groups(group_title,day_lesson,time_lesson,teacher_id,course_id) VALUES('backend-n2','se-chor-pay','11:00-14:00',3,3);
INSERT INTO groups(group_title,day_lesson,time_lesson,teacher_id,course_id) VALUES('frontend-n1','se-chor-pay','14:30-17:30',1,2);
select * from groups;


--student
DROP TABLE IF EXISTS students cascade;
CREATE TABLE students(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "student_name" VARCHAR(100) NOT NULL,
    "student_surname" VARCHAR(100) NOT NULL,
    "parents_name" VARCHAR(100) NOT NULL,
    "student_tel_nomer" INT UNIQUE NOT NULL,
    "parents_tel_nomer" INT NOT NULL,
    "student_img" TEXT NOT NULL,
    "group_id" INT,
    CONSTRAINT groups_student
    FOREIGN KEY(group_id) 
    REFERENCES groups("id")
);

INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda','Maxkamova','Samariddin',997821721,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda1','Maxkamova','Samariddin',997821722,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda2','Maxkamova','Samariddin',997821723,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda3','Maxkamova','Samariddin',997821724,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda4','Maxkamova','Samariddin',997821725,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda5','Maxkamova','Samariddin',997821726,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda6','Maxkamova','Samariddin',997821727,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda7','Maxkamova','Samariddin',997821728,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda8','Maxkamova','Samariddin',997821729,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Ziyoda9','Maxkamova','Samariddin',997821730,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433192/exam_three_folder/oabfrkghri6ohcheqgw9.jpg',2);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun','Toshtemirov','Humoyunn',909042208,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun1','Toshtemirov','Humoyunn',909042209,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun2','Toshtemirov','Humoyunn',909042210,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun3','Toshtemirov','Humoyunn',909042211,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun4','Toshtemirov','Humoyunn',909042212,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun5','Toshtemirov','Humoyunn',909042213,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun6','Toshtemirov','Humoyunn',909042214,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun7','Toshtemirov','Humoyunn',909042215,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun8','Toshtemirov','Humoyunn',909042216,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Humoyun9','Toshtemirov','Humoyunn',909042217,993003576,' https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685433755/exam_three_folder/wspgyi3dwxbsnsohsw7d.jpg',1);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa','Risbayeva','Humoyunn',941234567,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa1','Risbayeva','Humoyunn',941234568,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa2','Risbayeva','Humoyunn',941234569,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa3','Risbayeva','Humoyunn',941234560,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa4','Risbayeva','Humoyunn',941234571,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa5','Risbayeva','Humoyunn',941234570,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa6','Risbayeva','Humoyunn',941234572,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa7','Risbayeva','Humoyunn',941234573,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa8','Risbayeva','Humoyunn',941234574,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Muhlisa9','Risbayeva','Humoyunn',941234575,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434039/exam_three_folder/dnc6oehgwkjhpxpjlzkj.jpg',3);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz','Maxkamova','Samaridin,Marxuba',990987654,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz1','Maxkamova','Samaridin,Marxuba',990987651,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz2','Maxkamova','Samaridin,Marxuba',990987650,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz3','Maxkamova','Samaridin,Marxuba',990987652,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz4','Maxkamova','Samaridin,Marxuba',990987653,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz5','Maxkamova','Samaridin,Marxuba',990987655,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz6','Maxkamova','Samaridin,Marxuba',990987656,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz7','Maxkamova','Samaridin,Marxuba',990987657,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz8','Maxkamova','Samaridin,Marxuba',990987658,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Sarvinoz9','Maxkamova','Samaridin,Marxuba',990987659,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434349/exam_three_folder/nobtvfgajqzqtj3cql18.jpg',4);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya','Maxkamova','Samaridin,Marxuba',907654321,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya1','Maxkamova','Samaridin,Marxuba',907654322,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya2','Maxkamova','Samaridin,Marxuba',907654323,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya3','Maxkamova','Samaridin,Marxuba',907654324,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya4','Maxkamova','Samaridin,Marxuba',907654325,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya5','Maxkamova','Samaridin,Marxuba',907654326,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya6','Maxkamova','Samaridin,Marxuba',907654327,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya7','Maxkamova','Samaridin,Marxuba',907654328,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya8','Maxkamova','Samaridin,Marxuba',907654329,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);
INSERT INTO students(student_name,student_surname,parents_name,student_tel_nomer,parents_tel_nomer,student_img,group_id) VALUES('Zulfiya9','Maxkamova','Samaridin,Marxuba',907654320,993003576,'https://res.cloudinary.com/dsv0yl7sh/image/upload/v1685434521/exam_three_folder/kgkjkzjfwrcjujhasc2w.jpg',5);




select * from students;


--davomat
DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance(
    "id" SERIAL NOT NULL PRIMARY KEY ,
    "student_id" INT NOT NULL,
    "date" DATE NOT NULL DEFAULT CURRENT_DATE,
    "attendance" BOOLEAN,
    CONSTRAINT student_payment
    FOREIGN KEY(student_id) 
    REFERENCES students("id")
);
INSERT INTO attendance(student_id,attendance) VALUES(1,false);
INSERT INTO attendance(student_id,attendance) VALUES(2,true);
INSERT INTO attendance(student_id,attendance) VALUES(3,true);
select * from attendance;


--tolov
DROP TABLE IF EXISTS payment;
CREATE TABLE payment(
    "id" SERIAL NOT NULL PRIMARY KEY, 
    "student_id" INT NOT NULL,
    "payment" BOOLEAN DEFAULT true,
    "date" TIMESTAMP  DEFAULT now(),
    CONSTRAINT student_payment
    FOREIGN KEY(student_id) 
    REFERENCES students("id")
);
INSERT INTO payment(student_id) VALUES(1);
INSERT INTO payment(student_id) VALUES(2);
INSERT INTO payment(student_id) VALUES(3);
select * from payment;


--delete student
DROP TABLE IF EXISTS delete_student;
CREATE TABLE delete_student(
    "id" SERIAL NOT NULL, 
    "student_id" INT NOT NULL,
    "date" TIMESTAMP  DEFAULT now()
);
INSERT INTO delete_student(student_id) VALUES(1);
INSERT INTO delete_student(student_id) VALUES(2);
INSERT INTO delete_student(student_id) VALUES(3);
select * from delete_student;




