select TeamName
from Teams,
     (
         select TeamId
         from Teams
         where TeamId not in
               (
                   select distinct s.TeamId
                   from Sessions as s,
                        Runs as r
                   where s.SessionId = r.SessionId
                     and r.Letter = :Letter
                     and s.ContestId = :ContestId
                     and r.Accepted = 1
               )
     ) as q
where Teams.TeamId = q.TeamId;