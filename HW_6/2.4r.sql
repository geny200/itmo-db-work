select distinct s.StudentId,
                s.StudentName,
                g.GroupName
from Students s,
     Groups as g,
     Plan as p
where s.GroupId = g.GroupId
  and s.GroupId = p.GroupId
  and p.CourseId = :CourseId
  and s.StudentId not in
      (select distinct s.StudentId
       from Students as s,
            Groups as g,
            Marks as m
       where s.GroupId = g.GroupId
         and s.StudentId = m.StudentId
         and m.CourseId = :CourseId)
