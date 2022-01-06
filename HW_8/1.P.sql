-- Plan используется как таблица связи -используем покрывающий индекс
-- на CourseId, GroupId; так же можно добавить LecturerId, но т.к.
-- это увеличит размер индекса на 50% то нужно мерить скорость.
-- Т.е. тут возможно два варианта (CourseId, GroupId) и
-- (CourseId, GroupId, LecturerId)
-- ДЗ-5.3.3. Информацию о студентах с :Mark по предмету :LecturerId
-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.3.5. Информацию о студентах с :Mark по предмету :LecturerId
create index on Plan using btree (CourseId, GroupId);

-- Plan используется как таблица связи -используем покрывающий индекс
-- на GroupId, CourseId; так же можно добавить LecturerId, но т.к.
-- это увеличит размер индекса на 50% то нужно мерить скорость.
-- Т.е. тут возможно два варианта (GroupId, CourseId) и
-- (GroupId, CourseId, LecturerId)
-- ДЗ-5.4.2. Информацию о студентах не имеющих оценки по :CourseName
-- среди тех, у кого он есть
-- ДЗ-5.5.1. ФИО студента и названия предметов которые у него есть
-- по плану
-- ДЗ-5.5.2. ФИО студента и названия предметов которые у него есть
-- без оценки
create index on Plan using btree (GroupId, CourseId);

-- Plan используется как таблица связи -используем покрывающий индекс
-- на LecturerId, CourseId.так же можно добавить GroupId, но т.к.
-- это увеличит размер индекса на 50% то нужно мерить скорость.
-- Т.е. тут возможно два варианта (LecturerId, CourseId) и
-- (LecturerId, CourseId, GroupId)
-- ДЗ-5.3.3. Информацию о студентах с :Mark по предмету :LecturerId
-- ДЗ-5.3.5. Информацию о студентах с :Mark по предмету :LecturerId
-- ДЗ-5.6.3. StudentId имеющих оценки по всем предметам :LecturerName
create index on Plan using btree (LecturerId, CourseId);