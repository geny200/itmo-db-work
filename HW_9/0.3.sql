-- Проверяет пользователя
create or replace function Authorize(
    in _UserId integer,
    in _Pass varchar(256)
) returns bool as
$$
begin
    return exists(
            select *
            from Users
            where UserId = _UserId
              and UserHash = crypt(_Pass, UserHash)
        );
end
$$ language plpgsql;