create view Debts as
select s.StudentId, count(distinct CourseId) as Debts
from Plan as p
         inner join Students as s using (GroupId)
where not exists(
        select *
        from Marks as m
        where StudentId = s.StudentId
          and p.CourseId = CourseId
    )
group by s.StudentId