/* 3. Участники, которые едут на поезде маршрутом "Санкт-Петербург" */

SELECT p.*, t.route_train
FROM fest.participants p
FULL OUTER JOIN fest.transfer t
ON p.train_id = t.train
WHERE t.route_train = 'Saint-Petersburg';
