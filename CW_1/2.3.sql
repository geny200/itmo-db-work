select distinct TeamId
from Sessions
   , Runs
where ContestId = :ContestId
  and Accepted = 0
  and Runs.SessionId = Sessions.SessionId;