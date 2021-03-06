start transaction read only isolation level read uncommitted;

-- Рассмотрим аномалии:
-- * Косая запись - не мешает, т.к. транзакция read only;
-- * Фантомная запись - не мешает, т.к. достаточно прочитать один раз;
-- * Неповторяемое чтение - не мешает, т.к. читаем один раз;
-- * Грязное чтение - мешает т.к. можем вернуть, что места забронированы,
-- хотя транзакция о бронировании может быть откачена.
-- Запрос проходит по всем записям и может сильно снизить производительность
-- при добавлении уровней изоляции.
-- Вывод: Т.к. запрос статистический и данные быстро устаревают, и запрос
-- тяжёлый, то выберем уровень read uncommitted, т.к. +- забронированное
-- или купленное место во время продаж это номальное явление, а когда рейс
-- улетел, то новых продаж и бронирований нет, и запрос будет выдвать точную
-- статистику.