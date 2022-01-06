-- PostgreSQL 13

CREATE OR REPLACE FUNCTION noExtraMarks()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (EXISTS
        (
            SELECT *
            FROM Marks AS m
                     NATURAL LEFT JOIN
                 (
                     Students AS s
                         INNER JOIN Plan p USING (GroupId)
                     ) smth
            WHERE smth.CourseId IS NULL
        )) then
        RAISE EXCEPTION 'No extra marks %', now();
    END IF;
    RETURN new;
END
$$
    LANGUAGE plpgsql;

CREATE TRIGGER NoExtraMarks
    AFTER UPDATE OR DELETE
    ON Plan
EXECUTE PROCEDURE noExtraMarks();

CREATE TRIGGER NoExtraMarks
    AFTER UPDATE OR INSERT
    ON Marks
EXECUTE PROCEDURE noExtraMarks();

CREATE TRIGGER NoExtraMarks
    AFTER UPDATE OR INSERT
    ON Students
EXECUTE PROCEDURE noExtraMarks();

