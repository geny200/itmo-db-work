-- postgreSQL 14
create or replace function after_update()
    returns trigger as
$$
begin
    update Marks
    set Mark = old.Mark
    where Marks.CourseId = old.CourseId
      and Marks.StudentId = old.StudentId;
    return new;
end;
$$
    language 'plpgsql';

create trigger PreserverMarks
    after update of Mark
    on Marks
    for each row
    when (old.mark > new.mark)
execute procedure after_update();
