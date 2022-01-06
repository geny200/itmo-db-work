update Students
set debts = (
    select count(distinct p.CourseId)
    from Students s
             natural left join Plan as p
             natural left join Marks as m
    where s.StudentId = Students.StudentId
      and m.Mark is null
)
where StudentId = :StudentId