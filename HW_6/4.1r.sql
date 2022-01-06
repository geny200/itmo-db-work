select s.StudentName,
       c.CourseName
from Students as s,
     Courses as c,
     (select distinct s.StudentId,
                      p.CourseId
      from Students as s,
           Plan as p
      where s.GroupId = p.GroupId
        and not exists
          (select s.StudentId, m.CourseId
           from Marks as m
           where s.StudentId = m.StudentId
             and m.CourseId = p.CourseId)
     ) as ids
where s.StudentId = ids.StudentId
  and c.CourseId = ids.CourseId
