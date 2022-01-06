select distinct s.StudentId
from Students s
         inner join Marks m
                    on s.StudentId = m.StudentId
         inner join Plan p
                    on s.GroupId = p.GroupId
                        and m.CourseId = p.CourseId
         inner join Lecturers l
                    on l.LecturerId = p.LecturerId
where l.LecturerName = :LecturerName