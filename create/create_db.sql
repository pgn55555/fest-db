CREATE SCHEMA IF NOT EXISTS fest;


DROP VIEW IF EXISTS fest.passport_acc_v;
DROP VIEW IF EXISTS fest.route_spb_v;
DROP VIEW IF EXISTS fest.accommodation_v;
DROP VIEW IF EXISTS fest.organizations_v;
DROP VIEW IF EXISTS fest.participants_v;
DROP VIEW IF EXISTS fest.transfer_v;


DROP TABLE IF EXISTS fest.participants;
DROP TABLE IF EXISTS fest.organizations;
CREATE TABLE fest.organizations(
    org VARCHAR(20),
    field VARCHAR(100) NOT NULL,

    CONSTRAINT organizations_pk PRIMARY KEY (org)
);

DROP INDEX IF EXISTS ix_organizations_field;
CREATE INDEX ix_organizations_field
ON fest.organizations (field);


DROP TABLE IF EXISTS fest.transfer;
CREATE TABLE fest.transfer(
    train INTEGER,
    route_train VARCHAR(100) NOT NULL,
    capacity INTEGER CHECK (capacity >= 0),

    CONSTRAINT transfer_pk PRIMARY KEY (train)
);

DROP INDEX IF EXISTS ix_transfer_route;
CREATE INDEX ix_transfer_route
ON fest.transfer (route_train);

DROP INDEX IF EXISTS ix_transfer_capacity;
CREATE INDEX ix_transfer_capacity
ON fest.transfer (capacity);


DROP TABLE IF EXISTS fest.supervisors;
CREATE TABLE fest.supervisors(
    id SERIAL,
    surname VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL,

    CONSTRAINT supervisors_pk PRIMARY KEY (id)
);

DROP INDEX IF EXISTS ix_supervisors_surname;
CREATE INDEX ix_supervisors_surname
ON fest.supervisors (surname);

DROP INDEX IF EXISTS ix_supervisors_region;
CREATE INDEX ix_supervisors_region
ON fest.supervisors (region);


DROP TABLE IF EXISTS fest.accommodation;
CREATE TABLE fest.accommodation(
    id SERIAL,
    name_acc VARCHAR(20) NOT NULL,
    address_acc VARCHAR(200) NOT NULL,
    type_acc VARCHAR(20) NOT NULL,

    CONSTRAINT accommodation_pk PRIMARY KEY (id)
);

DROP INDEX IF EXISTS ix_accommodation_name;
CREATE INDEX ix_accommodation_name
ON fest.accommodation (name_acc);

DROP INDEX IF EXISTS ix_accommodation_address;
CREATE INDEX ix_accommodation_address
ON fest.accommodation (address_acc);

DROP INDEX IF EXISTS ix_accommodation_type;
CREATE INDEX ix_accommodation_type
ON fest.accommodation (type_acc);


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

DROP INDEX IF EXISTS ix_participants_surname;
CREATE INDEX ix_participants_surname
ON fest.participants (surname);

DROP INDEX IF EXISTS ix_participants_first_name;
CREATE INDEX ix_participants_first_name
ON fest.participants (first_name);

DROP INDEX IF EXISTS ix_participants_sex;
CREATE INDEX ix_participants_sex
ON fest.participants (sex);

DROP INDEX IF EXISTS ix_participants_email;
CREATE INDEX ix_participants_email
ON fest.participants (email);
