select distinct StudentId, StudentName, GroupId
from Students
where Students.StudentId = :StudentId