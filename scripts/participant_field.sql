/* 1. ФИО каждого участника и сфера, в которой он работает */

SELECT surname, first_name, patronymic, field
FROM fest.participants p
FULL OUTER JOIN fest.organizations o
ON p.org_id = o.org;
