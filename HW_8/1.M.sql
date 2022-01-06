-- Marks может использоваться как таблица связи -используем
-- покрывающий индекс на StudentId, CourseId; так же можно добавить
-- Mark, но т.к. это сильно увеличит размер индекса то нужно мерить
-- скорость. Т.е. тут возможно два варианта (StudentId, CourseId) и
-- (StudentId, CourseId, Mark)
-- ДЗ-5.4.1 Информацию о студентах не имеющих оценки по :CourseName
-- среди всех
-- ДЗ-5.4.2. Информацию о студентах не имеющих оценки по :CourseName
-- среди тех, у кого он есть
-- ДЗ-5.5.2. ФИО студента и названия предметов которые у него есть
-- без оценки
create index on Marks using btree (StudentId, CourseId);

-- Marks может использоваться как таблица связи -используем
-- покрывающий индекс на CourseId, StudentId; так же можно добавить
-- Mark, но т.к. это сильно увеличит размер индекса то нужно мерить
-- скорость. Т.е. тут возможно два варианта (CourseId, StudentId) и
-- (CourseId, StudentId, Mark)
-- ДЗ-5.6.3 StudentId имеющих оценки по всем предметам :LecturerName
-- ДЗ-5.6.4 StudentId имеющих оценки по всем предметам :LecturerName,
-- которые он у него вёл
-- ДЗ-6.5.3. StudentId имеющих оценки по всем предметам :LecturerName
create index on Marks using btree (CourseId, StudentId);

-- Marks может использоваться как таблица связи с запросом по Mark
-- -используем покрывающий индекс на Marks, StudentId; так же можно
-- добавить CourseId, но т.к. это сильно увеличит размер индекса то
-- нужно мерить скорость. Т.е. тут возможно два варианта
-- (Marks, StudentId) и (Marks, StudentId, CourseId)
-- ДЗ-5.3.1 Информация о студентах с :Mark по предмету :CourseId
-- ДЗ-5.3.4 Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.5.3 ФИО студента и названия предметов которые у него есть, но
-- не 4 или 5
create index on Marks using btree (Marks, StudentId);
