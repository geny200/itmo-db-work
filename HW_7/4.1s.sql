insert into Marks
select StudentId, CourseId, Mark
from (
         select distinct StudentId, CourseId
         from NewMarks
             except
         select distinct StudentId, CourseId
         from Marks
     ) as nm
         inner join NewMarks as n using (StudentId, CourseId)