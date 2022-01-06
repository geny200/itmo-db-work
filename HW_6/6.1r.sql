select distinct g.GroupId, c.CourseId
from Groups as g,
     Courses as c
where not exists
    (select distinct g.GroupId
     from Students as s2
     where s2.GroupId = g.GroupId
       and not exists
         (select m2.StudentId
          from Marks as m2
          where c.CourseId = m2.CourseId
            and s2.StudentId = m2.StudentId
         )
    )
