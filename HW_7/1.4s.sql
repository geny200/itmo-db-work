delete
from Students
where (
          select count(Mark)
          from Marks
          where StudentId = Students.StudentId
          group by StudentId
      ) >= 3