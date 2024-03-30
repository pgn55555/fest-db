# Физическая модель

## Таблица `participants`

| Название         | Описание                                                          | Тип данных  | Ограничение |
|------------------|-------------------------------------------------------------------|-------------|-------------|
| surname          | Фамилия участника                                                 | VARCHAR(20) | NOT NULL    |
| first_name             | Имя участника                                                     | VARCHAR(20) | NOT NULL    |
| patronymic       | Отчество участника                                                | VARCHAR(20) |             |
| sex              | Пол участника                                                     | BOOL        | NOT NULL    |
| email            | Электронная почта                                                 | VARCHAR(50) | NOT NULL    |
| passport         | Номер паспорта с серией                                           | BIGINT     | PRIMARY KEY |
| org_id           | Название организации (компании), где работает или учится участник | VARCHAR(50) | FOREIGN KEY |
| train_id         | Номер поезда трансфера                                            | INTEGER     | FOREIGN KEY |
| accommodation_id | ID места размещения на фестивале                                  | INTEGER     | FOREIGN KEY |
| supervisor_id    | ID куратора группы участника                                      | INTEGER     | FOREIGN KEY |

*Примечание:* пол участника равен `true`, если он мужской, `false`, если женский.

Создание таблицы:
``` sql
CREATE TABLE fest.participants(
    surname VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    patronymic VARCHAR(20),
    sex BOOL NOT NULL,
    email VARCHAR(50) NOT NULL,
    passport BIGINT,
    org_id VARCHAR(50),
    train_id INTEGER,
    accommodation_id INTEGER,
    supervisor_id INTEGER,

    CONSTRAINT participants_pk PRIMARY KEY (passport),

    CONSTRAINT fk_participants_organizations FOREIGN KEY (org_id)
        REFERENCES fest.organizations(org) ON DELETE SET NULL,
    CONSTRAINT fk_participants_transfer FOREIGN KEY (train_id)
        REFERENCES fest.transfer(train) ON DELETE SET NULL,
    CONSTRAINT fk_participants_accommodation FOREIGN KEY (accommodation_id)
        REFERENCES fest.accommodation(id) ON DELETE SET NULL,
    CONSTRAINT fk_participants_supervisors FOREIGN KEY (supervisor_id)
        REFERENCES fest.supervisors(id) ON DELETE SET NULL
);
```

## Таблица `organizations`

| Название | Описание                    | Тип данных   | Ограничение |
|----------|-----------------------------|--------------|-------------|
| org      | Название организации        | VARCHAR(20)  | PRIMARY KEY |
| field    | Описание сферы деятельности | VARCHAR(100) | NOT NULL    |

Создание таблицы:
``` sql
CREATE TABLE fest.organizations(
    org VARCHAR(20),
    field VARCHAR(100) NOT NULL,

    CONSTRAINT organizations_pk PRIMARY KEY (org)
);
```

## Таблица `transfer`

| Название | Описание               | Тип данных   | Ограничение |
|----------|------------------------|--------------|-------------|
| train    | Номер поезда           | INTEGER      | PRIMARY KEY |
| route_train    | Путь следования поезда | VARCHAR(200) | NOT NULL    |
| capacity | Вместимость поезда     | INTEGER      | > 0         |

Создание таблицы:
``` sql
CREATE TABLE fest.transfer(
    train INTEGER,
    route_train VARCHAR(100) NOT NULL,
    capacity INTEGER CHECK (capacity >= 0),

    CONSTRAINT transfer_pk PRIMARY KEY (train)
);
```

## Таблица `supervisors`

| Название | Описание                                              | Тип данных  | Ограничение |
|----------|-------------------------------------------------------|-------------|-------------|
| id       | ID куратора                                           | SERIAL     | PRIMARY KEY |
| surname  | Фамилия куратора                                      | VARCHAR(20) | NOT NULL    |
| region   | Регион участников, лежащий в ответственности куратора | VARCHAR(20) | NOT NULL    |

Создание таблицы:
``` sql
CREATE TABLE fest.supervisors(
    id SERIAL,
    surname VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL,

    CONSTRAINT supervisors_pk PRIMARY KEY (id)
);
```

## Таблица `accommodation`

| Название | Описание                        | Тип данных   | Ограничение |
|----------|---------------------------------|--------------|-------------|
| id       | ID места проживания             | SERIAL      | PRIMARY KEY |
| name_acc     | Название места проживания       | VARCHAR(20)  | NOT NULL    |
| address_acc  | Адрес места проживания          | VARCHAR(200) | NOT NULL    |
| type_acc     | Тип (категория) места проживания | VARCHAR(20)  | NOT NULL    |

Создание таблицы:
``` sql
CREATE TABLE fest.accommodation(
    id SERIAL,
    name_acc VARCHAR(20) NOT NULL,
    address_acc VARCHAR(200) NOT NULL,
    type_acc VARCHAR(20) NOT NULL,

    CONSTRAINT accommodation_pk PRIMARY KEY (id)
);
```