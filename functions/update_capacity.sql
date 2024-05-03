CREATE OR REPLACE FUNCTION fest.update_capacity(
    in p_train INTEGER,
    in p_capacity INTEGER,
    out train INTEGER,
    out route_train VARCHAR(100),
    out capacity INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE fest.transfer t
    SET capacity = p_capacity
    WHERE t.train = p_train;

    SELECT *
    INTO train, route_train, capacity
    FROM fest.transfer t
    WHERE t.train = p_train;
END;
$$;

SELECT *
FROM fest.update_capacity(101, 200);
