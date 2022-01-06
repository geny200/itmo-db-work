-- Статистика по рейсам: возможность бронирования и покупки, число
-- свободных, забронированных и проданных мест.
-- Примечание: возвращает статистику для каждого рейса.
create or replace function FlightsStatistics(
    in _UserId int,
    in _Pass varchar(256)
)
    returns table
            (
                FlightId     integer,
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
            select FlightId,
                   CanBuy,
                   CanReserve,
                   FreeSeats,
                   ReserveSeats,
                   BuySeats
            from stat
            where UserId = _UserId
        );
    else
        return;
    end if;
end
$$ language plpgsql;