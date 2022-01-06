select TeamId, count(*) as Opened
from (
         select distinct TeamId, ContestId, Letter
         from Sessions
                  natural join Runs
     ) query
group by TeamId;