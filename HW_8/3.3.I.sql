-- Требуется порядок по CourseName, hash ничем не может помочь,
-- btree имеет упорядоченную структуру, поэтому ускорит запрос
create unique index on Courses using btree (CourseName, CourseId)