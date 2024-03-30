/* 8. Статистика по вместимости поездов для каждого маршрута */

SELECT route_train,
    min(capacity) as minimum,
    max(capacity) as maximum,
    avg(capacity) as average
FROM fest.transfer
GROUP BY route_train;
