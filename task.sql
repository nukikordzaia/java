-- t = table
-- lst = list
-- lnk = linker

create schema if not exists `task_db` default character set = utf8mb4;

create table if not exists `task_db`.`t_lst_subjects`(
`subject_id` int not null auto_increment,
`subject_desc` varchar(32) not null,
primary key (`subject_id`),
index `t_lst_subjects_subject_desc`(`subject_desc` desc),
unique index `t_lst_subjects_subject_desc_u`(`subject_desc` desc))
default charset = utf8mb4; -- utf8mb4 = Any symbols are allowed

create table if not exists `task_db`.`t_lst_students`(
`student_id` int not null auto_increment,
`student_first_name` varchar(32) not null,
`student_last_name` varchar(32) not null,
`student_sex` tinyint not null, -- Using tinyint instead of boolean, since boolean sometimes acts weird with MySQL [1 = Male, 0 = Female]
`student_grade` tinyint not null,
primary key (`student_id`),
index `t_lst_students_student_first_name`(`student_first_name` desc),
index `t_lst_students_student_last_name`(`student_last_name` desc),
index `t_lst_students_student_sex`(`student_sex` desc),
index `t_lst_students_student_grade`(`student_grade` desc),
index `t_lst_students_combine`(`student_first_name` desc, `student_last_name` desc), -- Create combine index
unique index `t_lst_students_combine_u`(`student_first_name` desc, `student_last_name` desc)) -- Which is also unique
default charset = utf8mb4;

create table if not exists `task_db`.`t_lst_teachers`(
`teacher_id` int not null auto_increment,
`teacher_first_name` varchar(32) not null,
`teacher_last_name` varchar(32) not null,
`teacher_sex` tinyint not null,
`subject_id` int not null,
primary key (`teacher_id`),
index `t_lst_teachers_teacher_first_name`(`teacher_first_name` desc),
index `t_lst_teachers_teacher_last_name`(`teacher_last_name` desc),
index `t_lst_teachers_teacher_sex`(`teacher_sex` desc),
index `t_lst_teachers_subject_id`(`subject_id` desc),
index `t_lst_teachers_combine`(`teacher_first_name` desc, `teacher_last_name` desc),
unique index `t_lnk_teachers_combine_u`(`teacher_first_name` desc, `teacher_last_name` desc))
default charset = utf8mb4;

create table if not exists `task_db`.`t_lnk_teacher_students`(
`lnk_id` int not null auto_increment,
`student_id` int not null,
`teacher_id` int not null,
primary key (`lnk_id`),
index `t_lnk_teacher_students_student_id`(`student_id` desc),
index `t_lnk_teacher_students_teacher_id`(`teacher_id` desc),
index `t_lnk_teacher_students_combine`(`student_id` desc, `teacher_id` desc),
unique index `t_lnk_teacher_students_combine_u`(`student_id` desc, `teacher_id` desc))
default charset = utf8mb4;

-- Let's fill the tables with some data...

insert into task_db.t_lst_subjects(subject_desc)
							values('Math');
insert into task_db.t_lst_subjects(subject_desc)
							values('Literature');
insert into task_db.t_lst_subjects(subject_desc)
							values('History');
insert into task_db.t_lst_subjects(subject_desc)
							values('Geography');
                            
insert into task_db.t_lst_students(student_first_name,
								   student_last_name,
                                   student_sex,
                                   student_grade)
							values('Nikoloz',
								   'Beruashvili',
                                   1,
                                   8);
insert into task_db.t_lst_students(student_first_name,
								   student_last_name,
                                   student_sex,
                                   student_grade)
							values('Giorgi',
								   'Melashvili',
                                   1,
                                   10);
insert into task_db.t_lst_students(student_first_name,
								   student_last_name,
                                   student_sex,
                                   student_grade)
							values('Mariam',
								   'Eradze',
                                   0,
                                   3);

insert into	task_db.t_lst_teachers(teacher_first_name,
								   teacher_last_name,
                                   teacher_sex,
                                   subject_id)
							values('Nini',
								   'Mamaladze',
                                   0,
                                   3);
insert into	task_db.t_lst_teachers(teacher_first_name,
								   teacher_last_name,
                                   teacher_sex,
                                   subject_id)
							values('Baqar',
								   'Nakashidze',
                                   1,
                                   2);
insert into	task_db.t_lst_teachers(teacher_first_name,
								   teacher_last_name,
                                   teacher_sex,
                                   subject_id)
							values('Maia',
								   'Chitidze',
                                   0,
                                   1);
                                   
insert into task_db.t_lnk_teacher_students(student_id,
										   teacher_id)
									values(1, 3);
insert into task_db.t_lnk_teacher_students(student_id,
										   teacher_id)
									values(1, 2);
insert into task_db.t_lnk_teacher_students(student_id,
										   teacher_id)
									values(2, 1);
insert into task_db.t_lnk_teacher_students(student_id,
										   teacher_id)
									values(2, 3);
insert into task_db.t_lnk_teacher_students(student_id,
										   teacher_id)
									values(3, 2);
                                    
-- Finish the task: let's see every teacher that teaches a student named "Giorgi"

select c.teacher_first_name,
	   c.teacher_last_name,
       d.subject_desc
  from task_db.t_lst_students as a
			inner join
	   task_db.t_lnk_teacher_students as b on a.student_id = b.student_id
			inner join
	   task_db.t_lst_teachers as c on b.teacher_id = c.teacher_id
			inner join
	   task_db.t_lst_subjects as d on c.subject_id = d.subject_id
 where a.student_first_name = 'Giorgi';