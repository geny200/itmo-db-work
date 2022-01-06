-- LecturerId - первичный ключ, так же hash индекс ускоряет
-- соединения.
-- ДЗ-5.6.3. StudentId имеющих оценки по всем предметам :LecturerName
-- ДЗ-5.6.4. StudentId имеющих оценки по всем предметам :LecturerName
-- которые он у него вёл
create unique index on Lecturers using hash (LecturerId);

-- LecturerName - всегда ищем по имени в целом, используем hash.
-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.6.1. StudentId имеющих хотя бы одну оценку у :LecturerName
-- ДЗ-5.6.2. StudentId не имеющих оценок у :LecturerName
create index on Lecturers using hash (LecturerName);
