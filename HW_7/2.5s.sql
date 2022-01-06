update Students
set GroupId = (select GroupId
               from Groups
               where GroupName = :GroupName)
where exists(select GroupId
             from Groups
             where GroupName = :GroupName)
  and GroupId = (select GroupId
                 from Groups
                 where GroupName = :FromGroupName)