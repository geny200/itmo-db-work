-- Пытается забронировать место на трое суток начиная с момента бронирования.
-- Возвращает истину, если удалось и ложь — в противном случае.
create or replace function Reserve(
    in _UserId integer,
    in _Pass varchar(256),
    in _FlightId integer,
    in _SeatNo varchar(4)
) returns bool
as
$$
begin
    if (Authorize(_UserId, _Pass)
        and exists(
                select *
                from saleSeats
                where FlightId = _FlightId
                  and SeatNo = _SeatNo
            )
        )
    then
        delete
        from Sales
        where FlightId = _FlightId
          and SeatNo = _SeatNo;

        insert into Sales (FlightId, SeatNo, UserId, Status, ModifiedTime)
        values (_FlightId, _SeatNo, _UserId, 'reserv', now());
        return true;
    else
        return False;
    end if;
end
$$ language plpgsql;