select c.CourseName, g.GroupName
from (
         select CourseId,
                GroupId
         from Marks m1,
              Students s1
             except
         select CourseId, GroupId
         from (
                  select m2.CourseId,
                         s2.StudentId,
                         s2.GroupId
                  from Marks m2,
                       Students s2
                      except
                  select m3.CourseId,
                         s3.StudentId,
                         s3.GroupId
                  from Marks m3
                           inner join Students s3 using (StudentId)
              ) as CISIGICISIGI
     ) as CIGICIGI
         inner join Courses c using (CourseId)
         inner join Groups g using (GroupId)

