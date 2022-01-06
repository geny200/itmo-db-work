-- Пытается продлить бронь места на трое суток начиная с момента продления.
-- Возвращает истину, если удалось и ложь — в противном случае.
create or replace function ExtendReservation(
    in _UserId int,
    in _Pass varchar(256),
    in _FlightId int,
    in _SeatNo varchar(4)
) returns bool
as
$$
declare
    result bool;
begin
    if Authorize(_UserId, _Pass)
    then
        update Sales
        set ModifiedTime = now()
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