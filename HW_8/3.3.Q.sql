-- Вывести все предметы группы :GroupName, которые являются
-- предметом soft skills (начинаются на 'soft skills:')
select CourseName
from Courses
         natural join Plan
         natural join Groups
where CourseName like 'soft skills:%'
  and GroupName = :GroupName