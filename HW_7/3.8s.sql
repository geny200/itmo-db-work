update Students as s
set debts = (select count(distinct CourseId)
             from Plan as p
             where GroupId = s.GroupId
               and not exists(
                     select *
                     from Marks as m
                     where StudentId = s.StudentId
                       and p.CourseId = CourseId)),
    marks = (select count(*)
             from Marks as m
             where m.StudentId = s.StudentId)