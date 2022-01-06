update Students
set marks = (
    select count(distinct CourseId)
    from Marks
    where StudentId = Students.StudentId
)