-- Оптимизирует занятость мест в самолете. В результате оптимизации,
-- в начале самолета должны быть купленные места, затем — забронированные,
-- а в конце — свободные.
-- Примечание: клиенты, которые уже выкупили билеты также должны быть пересажены.
create or replace procedure CompressSeats(
    in _FlightId integer
)
as
$$
declare
    cursorSeats cursor for
        select SeatNo
        from Seats s
                 natural join Flights f
        where f.FlightId = _FlightId
        order by SeatNormalize;
    cursorBought cursor for
        select SeatNo
        from boughtSeats
                 natural join Flights
                 natural join Seats
        where FlightId = _FlightId
        order by SeatNormalize for update;
    cursorReserved cursor for
        select SeatNo
        from reservedSeats
                 natural join Flights
                 natural join Seats
        where FlightId = _FlightId
        order by SeatNormalize for update;
    rowvar varchar(4);
begin
    -- Удалить просроченные брони
    call BuyReserved()
    delete
    from Sales as s
    where exists(
                  select *
                  from freeSeats as f
                  where f.FlightId = s.FlightId
                    and f.SeatNo = s.SeatNo
              );

    open cursorSeats;
    for _ in cursorBought
        loop
            fetch cursorSeats into rowvar;
            update Sales set SeatNo = rowvar where current of cursorBought;
        end loop;

    for _ in cursorReserved
        loop
            fetch cursorSeats into rowvar;
            update Sales set SeatNo = rowvar where current of cursorReserved;
        end loop;
end
$$ language plpgsql;