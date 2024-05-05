/* 2. Запрет на изменение организаций. */

CREATE OR REPLACE FUNCTION fest.tfun_const_organizations()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    -- Вызываем исключение при попытке изменить значение
    RAISE EXCEPTION 'It is forbidden to change organizations';
END;
$$;


-- Проверка происходит до обновления
CREATE OR REPLACE TRIGGER t_const_organizations
BEFORE UPDATE ON fest.organizations
FOR EACH ROW
EXECUTE FUNCTION fest.tfun_const_organizations();

-- Проверка триггера
UPDATE fest.organizations
SET field = 'IT'
WHERE org = 'Organization_A';
