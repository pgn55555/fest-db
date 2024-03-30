/* 5. Список участников, которые живут в виллах. */

SELECT *
FROM fest.participants
WHERE
    accommodation_id IN(
        SELECT id
        FROM fest.accommodation
        WHERE type_acc = 'Villa'
    );
