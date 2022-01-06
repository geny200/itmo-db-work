-- пытается купить свободное место. Возвращает истину, если удалось
-- и ложь — в противном случае.
create or replace function BuyFree(
    in _FlightId integer,
    in _SeatNo varchar(4)
) returns bool as
$$
begin
        if (exists(
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

        insert into Sales (FlightId, SeatNo, Status, ModifiedTime)
        values (_FlightId, _SeatNo, 'buy', now());
        return true;
    else
        return False;
    end if;
end
$$ language plpgsql;