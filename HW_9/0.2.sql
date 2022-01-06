drop extension if exists pgcrypto cascade;
create extension pgcrypto;

-- Самолёты которые есть.
drop table if exists Planes cascade;
create table Planes
(
    PlaneId integer not null,
    constraint pk_PlaneId primary key (PlaneId)
);

-- Места которые есть в самолёте PlaneId
drop table if exists Seats cascade;
create table Seats
(
    PlaneId       integer    not null,
    SeatNo        varchar(4) not null,
    SeatNormalize varchar(4) not null
        generated always as (lpad(SeatNo, 4, '0')) stored,
    constraint pk_PlaneIdSeatNo primary key (PlaneId, SeatNo),
    constraint fk_Seats_PlaneId foreign key (PlaneId)
        references Planes (PlaneId)
);

-- Список рейсов FlightId - номер рейса, FlightTime - время вылета, PlaneId - id самолёта
drop table if exists Flights cascade;
create table Flights
(
    FlightId   integer   not null,
    FlightTime timestamp not null,
    PlaneId    integer   not null,
    constraint pk_FlightId primary key (FlightId),
    constraint fk_Flights_PlaneId foreign key (PlaneId)
        references Planes (PlaneId)
);

-- Пользователи в системе, и их хэши паролей с солью (crypt умеет запоминать соль в hash)
drop table if exists Users cascade;
create table Users
(
    UserId   integer     not null,
    UserHash varchar(32) not null,
    constraint pk_UserId primary key (UserId)
);

-- Перечесление из зарезервированно/купленно
drop type if exists sale_state cascade;
create type sale_state as enum ('reserv', 'buy');

-- Проданные места и забронированные места на рейсы
drop table if exists Sales cascade;
create table Sales
(
    FlightId     integer    not null,
    SeatNo       varchar(4) not null,
    UserId       integer,
    Status       sale_state not null,
    ModifiedTime timestamp  not null,
    constraint pk_Sales_FlightIdSeatNo primary key (FlightId, SeatNo),
    constraint fk_Sales_UserId foreign key (UserId)
        references Users (UserId),
    constraint fk_Sales_FlightId foreign key (FlightId)
        references Flights (FlightId)
);

-- Представление для получения зарезервированных мест
create or replace view reservedSeats as
select FlightId, SeatNo, UserId
from Sales as s
         natural join Flights as f
where Status = 'reserv'
  and ModifiedTime + interval '3 days' >= now()
  and FlightTime >= now();

-- Представление для получения купленных мест
create or replace view boughtSeats as
select FlightId, SeatNo
from Sales
where Status = 'buy';

-- Представление для получения свободных мест
create or replace view freeSeats as
select FlightId, SeatNo
from Seats as s
         natural join Flights as f
    except
select FlightId, SeatNo
from boughtSeats
    except
select FlightId, SeatNo
from reservedSeats;

-- Представление для получения свободных мест для покупки
create or replace view saleSeats as
select FlightId, SeatNo
from freeSeats
         natural join Flights
where FlightTime >= now();

-- Статистика по рейсам (для 6 и 7 задания)
create or replace view stat as
select u.UserId,
       f.FlightId,
       count(free.SeatNo) + count(r.UserId = u.UserId) > 0 as CanBuy,
       count(free.SeatNo) > 0                              as CanReserve,
       count(free.SeatNo)                                  as FreeSeats,
       count(r.SeatNo)                                     as ReserveSeats,
       count(b.SeatNo)                                     as BuySeats
from Flights f
         cross join Users u
         natural left join Seats s
         natural left join saleSeats sale
         natural left join freeSeats free
         natural left join boughtSeats b
         left join reservedSeats r on f.FlightId = r.FlightId and s.SeatNo = r.SeatNo
group by u.UserId, f.FlightId;
