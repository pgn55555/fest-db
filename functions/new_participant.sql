/* 1. Добавление нового участника. */

CREATE OR REPLACE PROCEDURE fest.new_participant(
    -- Ввод: информация о новом участнике
    p_surname VARCHAR(20),
    p_first_name VARCHAR(20),
    p_patronymic VARCHAR(20),
    p_sex BOOL,
    p_email VARCHAR(50),
    p_passport BIGINT,
    p_org_id VARCHAR(50),
    p_city VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
DECLARE
    train_id INTEGER;
    accommodation_id INTEGER;
    supervisor_id INTEGER;
BEGIN
    EXECUTE format('SELECT train
                    FROM fest.transfer 
                    WHERE route_train = %L
                    ORDER BY RANDOM() LIMIT 1', p_city)
    INTO train_id;

    -- Генерация информации о кураторе, поезде и проживании
    EXECUTE 'SELECT id
    FROM fest.accommodation 
    ORDER BY RANDOM() LIMIT 1'
    INTO accommodation_id;

    EXECUTE 'SELECT id
    FROM fest.supervisors
    ORDER BY RANDOM() LIMIT 1'
    INTO supervisor_id;

    INSERT INTO fest.participants (
        surname,
        first_name,
        patronymic,
        sex,
        email,
        passport,
        org_id,
        train_id,
        accommodation_id,
        supervisor_id
    )
    VALUES (
        p_surname,
        p_first_name,
        p_patronymic,
        p_sex,
        p_email,
        p_passport,
        p_org_id,
        train_id,
        accommodation_id,
        supervisor_id
    );
END;
$$;

-- Тестирование процедуры
CALL fest.new_participant(
    'Ivanov',
    'Ivan',
    'Ivanovich',
    TRUE,
    'ivanov.ivan@email.ru',
    1234567890,
    'Organization_B',
    'Moscow'
);
