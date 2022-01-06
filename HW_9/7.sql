-- Статистика по рейсу: возможность бронирования и покупки, число
-- свободных, забронированных и проданных мест.
create or replace function FlightStat(
    in _UserId int,
    in _Pass varchar(256),
    in _FlightId integer
)
    returns table
            (
                CanBuy       bool,
                CanReserve   bool,
                FreeSeats    integer,
                ReserveSeats integer,
                BuySeats     integer
            )
as
$$
begin
    if (Authorize(_UserId, _Pass))
    then
        return query (
            select CanBuy,
                   CanReserve,
                   FreeSeats,
                   ReserveSeats,
                   BuySeats
            from stat
            where UserId = _UserId
              and FlightId = _FlightId
        );
    else
        return;
    end if;
end
$$ language plpgsql;
