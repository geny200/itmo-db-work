-- PostgreSQL 13

CREATE OR REPLACE FUNCTION sameMarks()
    RETURNS TRIGGER AS
$$
BEGIN
    IF (
        NOT EXISTS(
                SELECT *
                FROM Students as s
                         INNER JOIN Marks AS m USING (StudentId)
                         FULL OUTER JOIN
                     (
                         SELECT DISTINCT CourseId, GroupId
                         FROM Students AS s2
                                  INNER JOIN Marks USING (StudentId)
                     ) AS smth
                     ON m.CourseId = smth.CourseId
                         AND s.GroupId = smth.GroupId
                WHERE smth.CourseId IS NULL
                   OR m.CourseId IS NULL
            )
        ) THEN
        RAISE EXCEPTION 'Should be same marks %', now();
    END IF;
    RETURN new;
END
$$
    LANGUAGE plpgsql;

CREATE TRIGGER SameMarks
    AFTER UPDATE OR DELETE OR INSERT
    ON Marks
EXECUTE PROCEDURE sameMarks();

CREATE TRIGGER SameMarks
    AFTER UPDATE OR INSERT
    ON Students
EXECUTE PROCEDURE sameMarks();
