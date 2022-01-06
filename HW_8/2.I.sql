-- GroupId - внешний ключ, поэтому hash индекс ускоряет естественные
-- соединения.
create index on Students using hash (GroupId);

-- Т.к. есть ФЗ GroupName -> GroupId, значит для GroupName
-- единственнен GroupId, и мы хотим получать id по имени то
-- используем покрывающий индекс для GroupId при поиске по GroupName,
-- что бы не ходить лишний раз в память
create unique index on Groups using btree (GroupName, GroupId);

-- Т.к. CourseName ищем по имени в целом, используем hash.
create index on Courses using hash (CourseName);

-- Marks имеет в запросе natural join по 2 аттрибутам, поэтому
-- используем hash на (StudentId, CourseId).
create index on Marks using btree (StudentId, CourseId);