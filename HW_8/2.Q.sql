select coalesce(avg(cast(Mark as real)), 0)
from Groups
         natural left join Students
         natural left join Marks
         natural left join Courses
where CourseName = :CourseName
  and GroupName = :GroupName
  and Mark is not null
group by CourseId