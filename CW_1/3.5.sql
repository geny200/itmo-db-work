update Runs as r
set Accepted = 0
where r.RunId in (
    select RunId
    from Runs
             natural join
         (
             select SessionId, Letter, min(SubmitTime) as SubmitTime
             from Runs
             group by SessionId, Letter
         ) query
);