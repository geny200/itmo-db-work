select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
         inner join Marks m
                    on s.StudentId = m.StudentId
         inner join Plan p
                    on m.CourseId = p.CourseId
                        and s.GroupId = p.GroupId
         inner join Lecturers l
                    on l.LecturerId = p.LecturerId
where m.Mark = :Mark
  and l.LecturerName = :LecturerName;