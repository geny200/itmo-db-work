create view StudentDebts as
select s.StudentId, count(distinct CourseId) as Debts
from Students as s
         left join(
    select distinct StudentId, CourseId
    from Plan as p
             inner join Students as s using (GroupId)
    where not exists(
            select *
            from Marks as m
            where m.StudentId = s.StudentId
              and p.CourseId = CourseId
        )
) as SDB on s.StudentId = SDB.StudentId
group by s.StudentId