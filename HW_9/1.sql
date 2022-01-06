-- Список мест, доступных для продажи и для бронирования.
create or replace function FreeSeats(in _FlightId int)
    returns table
            (
                SeatNo varchar(4)
            )
as
$$
declare
begin
    return query (
        select SeatNo
        from saleSeats
        where FlightId = _FlightId
    );
end
$$ language plpgsql;
