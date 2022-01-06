select s.StudentId,
       p.CourseId
from Students s,
     Plan as p
where s.GroupId = p.GroupId
union
select m.StudentId,
       m.CourseId
from Marks as m

