/* 7. Ранжирование вместимости поездов для каждого маршрута */

SELECT *, row_number()
OVER (
    PARTITION BY route_train
    ORDER BY capacity DESC
    ) AS rank
FROM fest.transfer;
