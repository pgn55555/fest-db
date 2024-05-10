/* 5. Список участников, которые живут в виллах. */

CREATE OR REPLACE VIEW fest.accommodation_v AS
SELECT id
FROM fest.accommodation
WHERE type_acc = 'Villa'
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.participants_v AS
SELECT *
FROM fest.participants
WHERE
    accommodation_id IN(
        SELECT id
        FROM fest.accommodation_v
    )
WITH CASCADED CHECK OPTION;

SELECT *
FROM fest.participants_v;
