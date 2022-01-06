select distinct StudentId, StudentName, GroupName
from Students as s,
     Groups as g
where s.GroupId = g.GroupId
