select distinct s.StudentId,
                s.StudentName,
                s.GroupId
from Students s
         inner join Plan p on s.GroupId = p.GroupId
         inner join Courses c on c.CourseId = p.CourseId
where c.CourseName = :CourseName
    except
select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
         inner join Marks m on s.StudentId = m.StudentId
         inner join Courses c on m.CourseId = c.CourseId
where c.CourseName = :CourseName;