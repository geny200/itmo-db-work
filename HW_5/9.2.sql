select s.StudentName,
       avg(cast(m.Mark as real)) as AvgMark
from Students s
         left join Marks m
                   on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName;