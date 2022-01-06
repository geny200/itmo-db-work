-- Вывести всех студентов :GroupId группы в алфавитном порядке
select StudentName
from Students
where GroupId = :GroupId
order by StudentName