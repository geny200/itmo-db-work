select g.GroupName,
       avg(AvgMark) as AvgAvgMark
from Groups g
         left join
     (
         (
             select s.StudentId,
                    avg(cast(m.Mark as real)) as AvgMark
             from Students s
                      left join Marks m
                                on s.StudentId = m.StudentId
             group by s.StudentId
         ) savg
             inner join Students s2
             on s2.StudentId = savg.StudentId
         )
     on s2.GroupId = g.GroupId
group by g.GroupId, g.GroupName