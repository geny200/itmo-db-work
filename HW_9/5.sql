-- Пытается выкупить забронированное место (пользователи должны совпадать).
-- Возвращает истину, если удалось и ложь — в противном случае.
create or replace function BuyReserved(
    in _UserId integer,
    in _Pass varchar(256),
    in _FlightId integer,
    in _SeatNo varchar(4)
) returns bool as
$$
declare
    result bool;
begin
    if (Authorize(_UserId, _Pass)
        and exists(
                select *
                from reservedSeats
                where FlightId = _FlightId
                  and SeatNo = _SeatNo
                  and UserId = _UserId
            )
        )
    then
        update Sales
        set ModifiedTime = now(),
            Status       = 'buy'
        where FlightId = _FlightId
          and SeatNo = _SeatNo
          and UserId = _UserId
          and Status = 'reserv'
          and ModifiedTime + interval '3 days' >= now()
          and exists(
                select *
                from Flights
                where FlightId = _FlightId
                  and FlightTime >= now()
            )
        returning count(*) > 0 into result;
        return result;
    else
        return False;
    end if;
end
$$ language plpgsql;