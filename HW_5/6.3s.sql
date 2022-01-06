select m.StudentId
from Marks m
         left join Plan p1
                   on m.CourseId = p1.CourseId
         left join Lecturers l1
                   on l1.LecturerId = p1.LecturerId
                       and l1.LecturerName = :LecturerName
group by m.StudentId
having count(l1.LecturerName) = (
    select count(p2.CourseId)
    from Lecturers l2
             inner join Plan p2
                        on l2.LecturerId = p2.LecturerId
                            and l2.LecturerName = :LecturerName
);