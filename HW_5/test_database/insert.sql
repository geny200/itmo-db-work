insert into Lecturers (LecturerId, LecturerName)
values (1, 'Басов Владимир'),
       (2, 'Маврин Павел'),
       (3, 'Трифонов');

insert into Courses (CourseId, CourseName)
values (1, 'A&DS 1 term'),
       (2, 'ТФКП'),
       (3, 'Дифференциальные уравнения'),
       (4, 'A&DS 2 term'),
       (5, 'Теория кодирования');

insert into Groups (GroupId, GroupName)
values (1, 'M34391'),
       (2, 'M34381'),
       (3, 'M34371'),
       (4, 'M34351');

insert into Students (StudentId, StudentName, GroupId)
values (1, 'Борис Шапошников', 3),
       (2, 'Эрика Шэфер', 1),
       (3, 'Дмитрий Стукалов', 3),
       (4, 'Коновалов Евгений', 4),
       (5, 'Баженов Егор', 4),
       (6, 'Виктор Шарепо', 1);

insert into Marks (CourseId, StudentId, Mark)
values (1, 1, 95),
       (1, 2, 100),
       (1, 3, 70),
       (1, 5, 90),
       (1, 6, 60),
       (2, 1, 75),
       (2, 2, 99),
       (5, 1, 95),
       (5, 2, 100),
       (5, 3, 75),
       (5, 5, 90),
       (5, 6, 60);

insert into Plan (GroupId, CourseId, LecturerId)
values (1, 1, 2),
       (2, 1, 2),
       (3, 1, 2),
       (4, 1, 2),
       (1, 5, 3),
       (2, 5, 3),
       (3, 5, 3),
       (4, 5, 3),
       (1, 2, 1),
       (2, 2, 1);
