-- Вывести список действующих преподавателей (которые ведут хотя
-- бы 1 предмемт по плану) в алфавитном порядке
select LecturerName
from Lecturers natural join Plan
order by LecturerName