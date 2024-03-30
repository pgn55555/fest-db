/* 4. Суммарная вместимость поездов для маршрута "Санкт-Петербург" */

SELECT route_train, sum(capacity)
FROM fest.transfer
GROUP BY route_train
HAVING route_train = 'Saint-Petersburg';
