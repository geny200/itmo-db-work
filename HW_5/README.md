# Домашнее задание 5. Реляционная алгебра

## [Содержание](./../README.md)

* [**ДЗ-1. Установка и использование СУБД**](./../HW_1)
* [**ДЗ-2. Моделирование БД «Университет»**](./../HW_2)
* [**ДЗ-3. Функциональные зависимости в БД «Университет»**](./../HW_3)
* [**ДЗ-4. Нормализация БД «Университет»**](./../HW_4)
* **ДЗ-5. Реляционная алгебра**
* [**ДЗ-6. Реляционное исчисление**](./../HW_6)
* [**ДЗ-7. Изменение данных**](./../HW_7)
* [**ДЗ-8. Индексирование**](./../HW_8)
* [**ДЗ-9. Хранимые процедуры**](./../HW_9)
* [**ДЗ-10. Транзакции**](./../HW_10)
* [**КР-1. Контрольная по запросам**](./../CW_1)
* [**Технические особенности проверки**](./../Technical_specifics.md)

---

## Задание

#### Структура базы данных «Университет»:

* *Students(StudentId, StudentName, GroupId)*
* *Groups(GroupId, GroupName)*
* *Courses(CourseId, CourseName)*
* *Lecturers(LecturerId, LecturerName)*
* *Plan(GroupId, CourseId, LecturerId)*
* *Marks(StudentId, CourseId, Mark)*

#### Составьте выражения реляционной алгебры и соответствующие SQL-запросы, позволяющие получать

1. Информацию о студентах
    1) С заданным идентификатором *(StudentId, StudentName, GroupId по :StudentId)*.
    2) С заданным ФИО *(StudentId, StudentName, GroupId по :StudentName)*.
2. Полную информацию о студентах
    1) С заданным идентификатором *(StudentId, StudentName, GroupName по :StudentId)*.
    2) С заданным ФИО *(StudentId, StudentName, GroupName по :StudentName)*.
3. Информацию о студентах с заданной оценкой по дисциплине
    1) С заданным идентификатором *(StudentId, StudentName, GroupId по :Mark, :CourseId)*.
    2) С заданным названием *(StudentId, StudentName, GroupId по :Mark, :CourseName)*.
    3) Которую у него вёл лектор заданный идентификатором *(StudentId, StudentName, GroupId по :Mark, :LecturerId)*.
    4) Которую у него вёл лектор, заданный ФИО *(StudentId, StudentName, GroupId по :Mark, :LecturerName)*.
    5) Которую вёл лектор, заданный идентификатором *(StudentId, StudentName, GroupId по :Mark, :LecturerId)*.
    6) Которую вёл лектор, заданный ФИО *(StudentId, StudentName, GroupId по :Mark, :LecturerName)*.
4. Информацию о студентах не имеющих оценки по дисциплине
    1) Среди всех студентов *(StudentId, StudentName, GroupId по :CourseName)*.
    2) Среди студентов, у которых есть эта дисциплина *(StudentId, StudentName, GroupId по :CourseName)*.
5. Для каждого студента ФИО и названия дисциплин
    1) Которые у него есть по плану *(StudentName, CourseName)*.
    2) Есть, но у него нет оценки *(StudentName, CourseName)*.
    3) Есть, но у него не 4 или 5 *(StudentName, CourseName)*.
6. Идентификаторы студентов по преподавателю
    1) Имеющих хотя бы одну оценку у преподавателя *(StudentId по :LecturerName)*.
    2) Не имеющих ни одной оценки у преподавателя *(StudentId по :LecturerName)*.
    3) Имеющих оценки по всем дисциплинам преподавателя *(StudentId по :LecturerName)*.
    4) Имеющих оценки по всем дисциплинам преподавателя, которые он вёл у этого студента *(StudentId по :LecturerName)*.
7. Группы и дисциплины, такие что все студенты группы сдали эту дисциплину
    1) Идентификаторы *(GroupId, CourseId)*.
    2) Названия *(GroupName, CourseName)*.

#### Составьте SQL-запросы, позволяющие получать

8. Суммарный балл
    1) Одного студента *(SumMark по :StudentId)*.
    2) Каждого студента *(StudentName, SumMark)*.
    3) Каждой группы *(GroupName, SumMark)*.
9. Средний балл
    1) Одного студента *(AvgMark по :StudentId)*.
    2) Каждого студента *(StudentName, AvgMark)*.
    3) Каждой группы *(GroupName, AvgMark)*.
    4) Средний балл средних баллов студентов каждой группы *(GroupName, AvgAvgMark)*.
10. Для каждого студента: число дисциплин, которые у него были, число сданных дисциплин и число несданных дисциплин *(
    StudentId, Total, Passed, Failed)*.