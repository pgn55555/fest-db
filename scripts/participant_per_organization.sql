/* 2. Количество участников в каждой организации в отсортированом порядке по названиям организаций */

SELECT org, count(org)
FROM fest.organizations o
FULL OUTER JOIN fest.participants p
ON p.org_id = o.org
GROUP BY org
ORDER BY org;
