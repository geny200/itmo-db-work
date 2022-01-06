create view AllMarks as
select s.StudentId, count(SIM.CourseId) as Marks
from Students as s
         left join (
    select StudentId, CourseId
    from Marks
    union all
    select StudentId, CourseId
    from NewMarks
) as SIM on s.StudentId = SIM.StudentId
group by s.StudentId