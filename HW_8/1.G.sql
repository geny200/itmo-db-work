-- GroupId - первичный ключ, так же hash индекс ускоряет
-- соединения.
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-5.5.1. ФИО студента и названия предметов которые у него
-- есть по плану
-- ДЗ-5.7.2. GroupName и CourseName, такие что все студенты группы
-- сдали предмет
create unique index on Groups using hash (GroupId);

-- GroupName - всегда ищем по имени в целом, используем hash.
-- ДЗ-6.1.2. Информация о студентах по :GroupName
-- ДЗ-7.1.2. Удаление студентов по :GroupName
-- ДЗ-7.2.4. Перевод всех студентов группы по :*GroupName
create unique index on Groups using hash (GroupName);


-- Т.к. есть ФЗ GroupName -> GroupId, значит для GroupName
-- единственнен GroupId, и мы всегда хотим получать id по имени то
-- используем покрывающий индекс для GroupId при поиске по GroupName,
-- что бы не ходить лишний раз в память
-- ДЗ-6.1.2. Информация о студентах по :GroupName
-- ДЗ-7.1.2. Удаление студентов по :GroupName
-- ДЗ-7.2.4. Перевод всех студентов группы по :*GroupName
create unique index on Groups using btree (GroupName, GroupId);