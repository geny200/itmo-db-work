-- Требуется порядок по StudentName, hash ничем не еможет помочь,
-- btree имеет упорядоченную структуру, поэтому ускорит запрос
create index on Students using btree (GroupId, StudentName)