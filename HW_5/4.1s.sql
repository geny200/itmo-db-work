select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
    except
select s.StudentId,
       s.StudentName,
       s.GroupId
from Students s
         inner join Marks m using (StudentId)
         inner join Courses c using (CourseId)
where c.CourseName = :CourseName;
