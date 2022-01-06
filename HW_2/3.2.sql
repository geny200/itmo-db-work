begin;

insert into Persons (PersonID, FirstName, FullName, Gender, BirthDate, Email)
values (1, 'Дмитрий', 'Ковалёв', B'0', '20010618', 'dima@niuitmo.com'),
       (2, 'Олег', 'Тормалёв', B'0', '20010113', 'oleg@niuitmo.com'),
       (3, 'Ольга', 'Исаева', B'1', '20000808', 'olu@niuitmo.com'),
       (4, 'Руслан', 'Яблоко', B'0', '19910725', 'rus_apple@niuitmo.com'),
       (5, 'Евгений', 'Иванов', B'0', '19861204', 'eugene@niuitmo.com'),
       (6, 'Татьяна', 'Ифитова', B'1', '19701002', 'tifitova@niuitmo.com');

insert into Teachers (PersonID, TeacherID, JobTitle, Salary)
values (5, 1, 'Head of the department', 1000000),
       (4, 2, 'Младший научный сотрудник', 17690),
       (3, 3, 'Стажёр', 1600),
       (6, 4, 'Старший научный сотрудник', 25680);

insert into Students (PersonID, StudentID, GroupID)
values (1, 1, 1),
       (2, 2, 1),
       (3, 3, 2);

insert into Groups (GroupID, GroupName, StudentID, LessonID)
values (1, 'M34361', 1, 1),
       (2, 'M34371', 3, 2);

insert into Subjects (SubjectID, SubjectName)
values (1, 'Физика'),
       (2, 'Философия'),
       (3, 'ТФКП'),
       (4, 'Базы данных');

insert into Lessons (LessonID, Semester, TeacherID, GroupID, SubjectID)
values (1, 7, 2, 1, 4),
       (2, 7, 4, 2, 4),
       (3, 5, 3, 2, 3),
       (4, 6, 3, 1, 3),
       (5, 3, 4, 1, 2);

insert into Marks (Mark, StudentID, LessonID)
values (100, 3, 3),
       (84, 3, 1),
       (63, 1, 4),
       (74.1, 1, 2),
       (74, 2, 4),
       (85, 2, 5),
       (95, 1, 5);

commit;

-- Get all the marks of all the students
select FirstName, FullName, SubjectName, Mark
from Students
         inner join Persons
                    on Students.PersonID = Persons.PersonID
         inner join Marks
                    on Students.StudentID = Marks.StudentID
         inner join Lessons
                    on Marks.LessonID = Lessons.LessonID
         inner join Subjects
                    on Lessons.SubjectID = Subjects.SubjectID;

-- Get a teacher in the group
select GroupName, FirstName, FullName
from Groups
         inner join Lessons
                    on Groups.GroupID = Lessons.GroupID
         inner join Teachers
                    on Lessons.TeacherID = Teachers.TeacherID
         inner join Persons
                    on Teachers.PersonID = Persons.PersonID;

-- How many marks did the teacher give
select FirstName, FullName, count(Mark) as CountOfMark
from Teachers
         inner join Persons
                    on Teachers.PersonID = Persons.PersonID
         inner join Lessons
                    on Teachers.TeacherID = Lessons.TeacherID
         inner join Marks
                    on Lessons.LessonID = Marks.LessonID
group by FirstName, FullName;

-- How many lessons are there in each subject
select SubjectName, count(Lessons.SubjectID) as CountOfLessons
from Subjects
         left join Lessons
                   on Subjects.SubjectID = Lessons.SubjectID
group by SubjectName;

