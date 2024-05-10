/* 10. Список пасспортов и id места проживания c названием */

CREATE OR REPLACE VIEW fest.participants_v AS
SELECT *
FROM fest.participants
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.accommodation_v AS
SELECT *
FROM fest.accommodation
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.passport_acc_v AS
SELECT p.passport, a.id, a.name_acc
FROM fest.participants_v p
FULL OUTER JOIN fest.accommodation_v a
ON p.accommodation_id = a.id;

SELECT *
FROM fest.passport_acc_v;
