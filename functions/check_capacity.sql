/* 3. Проверка, поместятся ли пассажиры в поезд. */

CREATE OR REPLACE FUNCTION fest.check_capacity(
    -- Ввод: номер поезда
    in p_train_id INTEGER,
    -- Вывод: информация о поезде и ответ на запрос
    out train INTEGER,
    out route_train VARCHAR(100),
    out count BIGINT,
    out capacity INTEGER,
    out is_fit BOOL
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT query.*,
        CASE
            -- Проверка на вместимость
            WHEN query.count <= query.capacity
                THEN TRUE
            ELSE FALSE
        END
    INTO train, route_train, count, capacity, is_fit
    FROM (
        SELECT train_id, t.route_train, count(*), t.capacity
        FROM
            fest.participants p
            INNER JOIN fest.transfer t
            ON p.train_id = t.train
        GROUP BY p.train_id, t.route_train, t.capacity
        HAVING p_train_id = p.train_id
    ) AS query;
END;
$$;

-- Тестирование функции
SELECT *
FROM fest.update_capacity(105, 1);

SELECT *
FROM fest.check_capacity(105);

SELECT *
FROM fest.update_capacity(105, 200);

SELECT *
FROM fest.check_capacity(105);
