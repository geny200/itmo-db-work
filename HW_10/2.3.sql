start transaction read write isolation level snapshot;

select Reserve(:UserId, :Password, :FlightId, :SeatNo);

commit;

start transaction read write isolation level snapshot;

select BuyFree(:FlightId, :SeatNo);

commit;