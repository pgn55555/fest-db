/* 9. Количество людей в каждом варианте размещения */

SELECT a.*, count(p.passport)
FROM fest.accommodation a
FULL OUTER JOIN fest.participants p
ON p.accommodation_id = a.id
GROUP BY a.id
ORDER BY a.id;
