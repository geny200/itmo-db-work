select sum(m.Mark) as SumMark
from Marks m
where m.StudentId = :StudentId;