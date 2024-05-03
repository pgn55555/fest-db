/* 3. Участники, которые едут на поезде маршрутом "Санкт-Петербург" */

CREATE OR REPLACE VIEW fest.participants_v AS
SELECT *
FROM fest.participants
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.transfer_v AS
SELECT train, route_train
FROM fest.transfer
WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW fest.route_spb_v AS
SELECT p.*, t.route_train
FROM fest.participants_v p
FULL OUTER JOIN fest.transfer_v t
ON p.train_id = t.train
WHERE t.route_train = 'Saint-Petersburg';

SELECT *
FROM fest.route_spb_v;
