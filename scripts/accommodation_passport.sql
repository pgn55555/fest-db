/* 10. Список пасспортов и id места проживания c названием */

SELECT p.passport, a.id, a.name_acc
FROM fest.participants p
FULL OUTER JOIN fest.accommodation a
ON p.accommodation_id = a.id;
