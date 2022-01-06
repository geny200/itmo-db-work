select avg(cast(m.Mark as real)) as AvgMark
from Marks m
where m.StudentId = :StudentId;