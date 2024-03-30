CREATE SCHEMA IF NOT EXISTS fest;


DROP TABLE IF EXISTS fest.participants;
DROP TABLE IF EXISTS fest.organizations;
CREATE TABLE fest.organizations(
    org VARCHAR(20),
    field VARCHAR(100) NOT NULL,

    CONSTRAINT organizations_pk PRIMARY KEY (org)
);


DROP TABLE IF EXISTS fest.transfer;
CREATE TABLE fest.transfer(
    train INTEGER,
    route_train VARCHAR(100) NOT NULL,
    capacity INTEGER CHECK (capacity >= 0),

    CONSTRAINT transfer_pk PRIMARY KEY (train)
);


DROP TABLE IF EXISTS fest.supervisors;
CREATE TABLE fest.supervisors(
    id SERIAL,
    surname VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL,

    CONSTRAINT supervisors_pk PRIMARY KEY (id)
);


DROP TABLE IF EXISTS fest.accommodation;
CREATE TABLE fest.accommodation(
    id SERIAL,
    name_acc VARCHAR(20) NOT NULL,
    address_acc VARCHAR(200) NOT NULL,
    type_acc VARCHAR(20) NOT NULL,

    CONSTRAINT accommodation_pk PRIMARY KEY (id)
);


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
