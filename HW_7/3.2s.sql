update Students as s
set marks = (select count(*)
             from Marks as m
             where m.StudentId = s.StudentId)