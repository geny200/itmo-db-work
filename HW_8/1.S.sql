-- StudentId - первичный ключ, поэтому hash индекс ускоряет
-- соединения.
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-5.3.2. Информацию о студентах с :Mark по предмету :CourseName
-- ДЗ-5.5.2. ФИО студента и названия предметов которые у него есть
-- без оценки
create unique index on Students using hash (StudentId);

-- GroupId - внешний ключ, поэтому hash индекс ускоряет соединения.
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-5.3.2. Информацию о студентах с :Mark по предмету :CourseName
-- ДЗ-5.6.4. StudentId имеющих оценки по всем предметам
-- :LecturerName, которые он у него вёл
create index on Students using hash (GroupId);

-- StudentName - поиск всегда по имени в целом, потому используем
-- hash.
-- ДЗ-5.1.2. Информация о студентах по :StudentName
-- ДЗ-5.2.2. Полная информация о студентах по :StudentName
-- ДЗ-6.1.1. Информация о студентах по :StudentName
create index on Students using hash (StudentName);

-- GroupId, StudentId - может использоваться как таблица связи,
-- поэтому добавим btree GroupId, StudentId
-- ДЗ-5.8.3. SumMark студентов каждой группы (GroupName)
-- ДЗ-5.9.3. AvgMark каждой группы (GroupName)
-- ДЗ-5.9.4. AvgAvgMark студентов каждой группы (GroupName)
create index on Students using btree (GroupId, StudentId);