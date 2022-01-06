select m.StudentId
from Marks m
         natural join Plan
         natural join Lecturers l
         natural join Students
where LecturerName = :LecturerName
group by m.StudentId, l.LecturerId
having count(LecturerName) = (
    select count(CourseId)
    from Lecturers
             natural join Plan
             natural join Students
    where LecturerName = :LecturerName
      and StudentId = m.StudentId
      and LecturerId = l.LecturerId
);