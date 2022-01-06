select ContestId, Letter
from Problems
where not exists(
        select SessionId
        from Sessions
        where ContestId = Problems.ContestId
          and SessionId not in (
            select distinct Sessions.SessionId
            from Sessions
               , Runs
            where Sessions.SessionId = Runs.SessionId
              and ContestId = Problems.ContestId
              and Letter = Problems.Letter
              and Accepted = 1
        )
    );