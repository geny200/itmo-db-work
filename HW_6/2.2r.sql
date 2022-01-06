select s.StudentId,
       s.StudentName,
       g.GroupName
from Students s,
     Groups as g
where s.GroupId = g.GroupId
  and s.StudentId not in
      (select distinct s.StudentId
       from Students as s,
            Groups as g,
            Marks as m
       where s.GroupId = g.GroupId
         and s.StudentId = m.StudentId
         and m.CourseId = :CourseId)
