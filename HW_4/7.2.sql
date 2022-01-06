insert into "Lecturers" ("LecturerId", "LecturerName")
values (1, 'Басов Владимир'),
       (2, 'Маврин Павел');

insert into "Courses" ("CourseId", "CourseName")
values (1, 'A&DS 1 term'),
       (2, 'ТФКП'),
       (3, 'Дифференциальные уравнения'),
       (4, 'A&DS 2 term');

insert into "Groups" ("GroupId", "GroupName")
values (1, 'M34391'),
       (2, 'M34381'),
       (3, 'M34371');

insert into "Students" ("StudentId", "StudentName", "GroupId")
values (1, 'Борис Шапошников', 3),
       (2, 'Эрика Шэфер', 1),
       (3, 'Дмитрий Стукалов', 3);

insert into "Marks" ("CourseId", "StudentId", "Mark")
values (1, 1, 95),
       (1, 2, 100),
       (2, 1, 75),
       (2, 2, 99);

insert into "Plan" ("GroupId", "CourseId", "LecturerId")
values (1, 1, 1),
       (1, 2, 2),
       (2, 4, 1),
       (2, 3, 2);
