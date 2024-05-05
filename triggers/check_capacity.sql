/* 1. Обновление номера поезда для участника, только если он туда поместится. */

CREATE OR REPLACE FUNCTION fest.tfun_check_capacity()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INTEGER;
    v_capacity INTEGER;
BEGIN
    SELECT count(*), t.capacity
    INTO v_count, v_capacity
    FROM fest.participants p
    INNER JOIN fest.transfer t ON p.train_id = t.train
    WHERE p.train_id = NEW.train_id
    GROUP BY t.train, t.capacity;

    -- Если проверка не проходит, вызываем исключение, иначе возвращаем новое значение
    IF v_count <= v_capacity THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Capacity of the train is exceeded';
    END IF;
END;
$$;


-- Проверка происходит до обновления
CREATE OR REPLACE TRIGGER t_check_capacity
BEFORE UPDATE OF train_id ON fest.participants
FOR EACH ROW
EXECUTE FUNCTION fest.tfun_check_capacity();

-- Проверка триггера
UPDATE fest.participants
SET train_id = 1004
WHERE passport = 6810283107;
