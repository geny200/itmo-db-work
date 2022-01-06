select distinct s.StudentId, StudentName, GroupId
from Students as s,
     Marks as m,
     Courses as c
where s.StudentId = m.StudentId
  and c.CourseId = m.CourseId
  and m.Mark = :Mark
  and c.CourseName = :CourseName