select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
         inner join Marks m on s.StudentId = m.StudentId
         inner join Courses c on m.CourseId = c.CourseId
where m.Mark = :Mark
  and c.CourseName = :CourseName;