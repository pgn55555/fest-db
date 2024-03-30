/* 6. Список участников женского пола, которые работают в IT. */

SELECT *
FROM fest.participants
WHERE
    NOT sex
    AND org_id IN(
        SELECT org
        FROM fest.organizations
        WHERE field = 'IT'
    );
