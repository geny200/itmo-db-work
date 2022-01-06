select s.StudentName,
       c.CourseName
from Students s,
     Courses as c,
     (select s.StudentId,
             p.CourseId
      from Students s,
           Plan as p
      where s.GroupId = p.GroupId
      union
      select m.StudentId,
             m.CourseId
      from Marks as m) as ids
where s.StudentId = ids.StudentId
  and c.CourseId = ids.CourseId


