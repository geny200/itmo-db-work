update Students
set marks = (
    select count(CourseId)
    from Marks
    where StudentId = Students.StudentId
)
where StudentId = :StudentId
