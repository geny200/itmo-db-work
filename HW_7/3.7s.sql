update Students as s
set debts = (
    select count(distinct CourseId)
    from Plan as p
    where GroupId = s.GroupId
      and not exists(
            select *
            from Marks as m
            where StudentId = s.StudentId
              and p.CourseId = CourseId
        )
)
where s.GroupId = (select GroupId
                   from Groups
                   where GroupName = :GroupName)