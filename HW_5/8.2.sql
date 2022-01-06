select s.StudentName, sum(m.Mark) as SumMark
from Students s
         left join Marks m
                   on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName;
