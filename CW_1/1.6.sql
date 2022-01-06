select TeamName
from (
         select distinct TeamName, TeamId
         from (
                  select TeamName, TeamId, ContestId
                  from Sessions
                           natural join Teams
                      except
                  select TeamName, TeamId, ContestId
                  from Sessions
                           natural join Runs
                           natural join Teams
              ) query
     ) query;