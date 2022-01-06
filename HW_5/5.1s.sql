select s.StudentName,
       c.CourseName
from Students s
         inner join Plan p on s.GroupId = p.GroupId
         inner join Courses c on c.CourseId = p.CourseId;