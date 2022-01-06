select s.StudentId
from Students s
         left join(
    Students s2
        inner join Marks m
        on s2.StudentId = m.StudentId
        inner join Plan p
        on s2.GroupId = p.GroupId
            and m.CourseId = p.CourseId
        inner join Lecturers l
        on l.LecturerId = p.LecturerId
    )
                  on s.StudentId = s2.StudentId
                      and l.LecturerName = :LecturerName
where s2.StudentId is null;
