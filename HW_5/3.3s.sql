select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
         inner join Marks m
                    on s.StudentId = m.StudentId
         inner join Plan p
                    on m.CourseId = p.CourseId
                        and s.GroupId = p.GroupId
where m.Mark = :Mark
  and p.LecturerId = :LecturerId;