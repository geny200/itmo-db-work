update Students as s
set marks = marks + (select count(*)
                     from NewMarks as m
                     where m.StudentId = s.StudentId)