select StudentName, CourseName
from (
         select s.StudentId,
                s.StudentName,
                c.CourseId,
                c.CourseName
         from Students s
                  inner join Plan p on s.GroupId = p.GroupId
                  inner join Courses c on c.CourseId = p.CourseId
             except
         select s.StudentId,
                s.StudentName,
                c.CourseId,
                c.CourseName
         from Marks m
                  inner join Students s on m.StudentId = s.StudentId
                  inner join Courses c on m.CourseId = c.CourseId
     ) as spcmsc;