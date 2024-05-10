/* 6. Список участников женского пола, которые работают в IT. */

CREATE OR REPLACE VIEW fest.organizations_v AS
SELECT org
FROM fest.organizations
WHERE field = 'IT'
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.participants_v AS
SELECT *
FROM fest.participants
WHERE
    NOT sex
    AND org_id IN(
        SELECT org
        FROM fest.organizations_v
    )
WITH CASCADED CHECK OPTION;

SELECT *
FROM fest.participants_v;
