delete
from Students as s
where exists(
              select StudentId, CourseId
              from Plan
              where GroupId = s.GroupId
                  except
              select StudentId, CourseId
              from Marks
              where StudentId = s.StudentId
          )