select s1.StudentId,
       coalesce(total.CountCourse, 0)        as Total,
       coalesce(passed.CountCourse, 0)       as Passed,
       coalesce(total.CountCourse, 0)
           - coalesce(passed.CountCourse, 0) as Failed
from Students s1
         left join
     (
         select StudentId,
                coalesce(count(distinct CourseId), 0) as CountCourse
         from Students
                  natural join Plan
         group by StudentId
     ) total on total.StudentId = s1.StudentId,
     Students s2
         left join
     (
         select StudentId,
                coalesce(count(CourseId), 0) as CountCourse
         from Students
                  natural join Marks
                  natural join Plan
         group by StudentId
     ) passed on passed.StudentId = s2.StudentId
where s1.StudentId = s2.StudentId;