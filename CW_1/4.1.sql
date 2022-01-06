select SessionId, count(*) as Opened
from (
         select distinct SessionId, Letter
         from Runs
     ) query
group by SessionId;