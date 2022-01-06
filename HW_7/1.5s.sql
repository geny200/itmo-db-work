delete
from Students
where (
          select count(Mark)
          from Marks
          where StudentId = Students.StudentId
      ) <= 3