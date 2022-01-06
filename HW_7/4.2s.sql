update Marks
set mark = (select mark
            from NewMarks as nm
            where Marks.StudentId = nm.StudentId
              and Marks.CourseId = nm.CourseId)
where exists(select mark
             from NewMarks as nm
             where Marks.StudentId = nm.StudentId
               and Marks.CourseId = nm.CourseId)

