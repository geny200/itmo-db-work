select TeamName
from Teams
         natural join
     (
         select distinct TeamId
         from (
                  select TeamId, ContestId
                  from Teams
                           cross join Contests
                      except
                  select TeamId, ContestId
                  from Sessions
                           natural join Runs
              ) subQu
     ) query;