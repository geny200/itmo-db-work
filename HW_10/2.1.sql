start transaction read only isolation level read committed;

-- Свободные места доступные для бронирования или покупки.
-- saleSeats - view из 9 ДЗ.
-- :FlightId - id искомого рейса
select SeatNo
from saleSeats
where FlightId = :FlightId;

commit;