delete
from Students as s
where (
          select count(distinct CourseId)
          from Plan as p
          where GroupId = s.GroupId
            and not exists(
                  select *
                  from Marks as m
                  where StudentId = s.StudentId
                    and p.CourseId = CourseId
              )
      ) >= 2