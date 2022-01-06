delete
from Runs as r
where r.SessionId in (
    select SessionId
    from Sessions
             natural join Contests
    where ContestName = :ContestName
);