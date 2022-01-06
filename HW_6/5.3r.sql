select s.StudentId
from Students as s
where not exists
    (select distinct s.StudentId
     from Plan as p,
          Lecturers as l
     where p.LecturerId = l.LecturerId
       and l.LecturerName = :LecturerName
       and not exists
         (select m.StudentId
          from Marks as m
          where m.CourseId = p.CourseId
            and m.StudentId = s.StudentId
         )
    )
