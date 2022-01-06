merge into Marks
using NewMarks
on Marks.StudentId = NewMarks.StudentId
    and Marks.CourseId = NewMarks.CourseId
when matched and NewMarks.mark > Marks.mark then
    update set mark = NewMarks.mark
when not matched then
    insert (StudentId, CourseId, Mark)
    values (NewMarks.StudentId, NewMarks.CourseId, NewMarks.Mark)