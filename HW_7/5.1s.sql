create view StudentMarks as
select s.StudentId, count(SIM.CourseId) as Marks
from Students as s
         left join (
    select m.StudentId, CourseId
    from Marks as m
) as SIM on s.StudentId = SIM.StudentId
group by s.StudentId