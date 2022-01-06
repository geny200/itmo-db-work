select s.StudentName,
       c.CourseName
from Students as s,
     Courses as c,
     (select s.StudentId,
             p.CourseId
      from Students as s,
           Plan as p
      where s.GroupId = p.GroupId
        and exists
          (select s.StudentId,
                  m.CourseId
           from Marks as m
           where s.StudentId = m.StudentId
             and p.CourseId = m.CourseId
             and 2 >= m.Mark
          )
     ) as ids
where s.StudentId = ids.StudentId
  and c.CourseId = ids.CourseId
