INSERT INTO fest.organizations (org, field) VALUES 
('Organization_A', 'Business'),
('Organization_B', 'Science'),
('Organization_C', 'IT'),
('Organization_D', 'Business'),
('Organization_E', 'Manufacturing'),
('Organization_F', 'Media'),
('Organization_G', 'Business'),
('Organization_H', 'Media'),
('Organization_I', 'Business'),
('Organization_J', 'Science'),
('Organization_K', 'IT'),
('Organization_L', 'Media'),
('Organization_M', 'IT'),
('Organization_N', 'Manufacturing'),
('Organization_O', 'IT');

INSERT INTO fest.transfer (train, route_train, capacity) VALUES 
('100', 'Saint-Petersburg', '128'),
('101', 'Sochi', '177'),
('102', 'Vladivostok', '187'),
('103', 'Samara', '197'),
('104', 'Vladivostok', '8'),
('105', 'Vladivostok', '123'),
('106', 'Sochi', '186'),
('107', 'Samara', '111'),
('108', 'Saint-Petersburg', '95'),
('109', 'Saint-Petersburg', '95'),
('110', 'Moscow', '91'),
('111', 'Moscow', '118'),
('112', 'Samara', '111'),
('113', 'Samara', '144'),
('114', 'Moscow', '53'),
('115', 'Saint-Petersburg', '130'),
('116', 'Moscow', '183'),
('117', 'Saint-Petersburg', '173'),
('118', 'Sochi', '27'),
('119', 'Moscow', '116'),
('120', 'Samara', '107'),
('121', 'Samara', '120'),
('122', 'Moscow', '92'),
('123', 'Moscow', '112'),
('124', 'Vladivostok', '96'),
('125', 'Sochi', '194'),
('126', 'Samara', '124'),
('127', 'Sochi', '146'),
('128', 'Sochi', '16'),
('129', 'Sochi', '119');

INSERT INTO fest.supervisors (surname, region) VALUES 
('Smirnov', 'Sochi'),
('Ivanov', 'Vladivostok'),
('Kuznetsov', 'Saint-Petersburg'),
('Sokolov', 'Samara'),
('Popov', 'Vladivostok'),
('Lebedev', 'Moscow'),
('Kozlov', 'Sochi'),
('Novikov', 'Saint-Petersburg'),
('Morozov', 'Samara'),
('Petrov', 'Vladivostok'),
('Wolves', 'Saint-Petersburg'),
('Solovyov', 'Saint-Petersburg'),
('Vasiliev', 'Samara'),
('Zaitsev', 'Vladivostok'),
('Pavlov', 'Sochi');

INSERT INTO fest.accommodation (name_acc, address_acc, type_acc) VALUES 
('Forest Comfort', 'Lenina, 41', 'Apartment'),
('Forest Comfort', 'Svetlaya, 40', 'Room'),
('Best Place', 'Svetlaya, 4', 'Villa'),
('Sea Breeze', 'Svetlaya, 35', 'Cottage'),
('Academic Resort', 'Svetlaya, 31', 'Room'),
('Good Vibes', 'Molodezhnaya, 41', 'Room'),
('Academic Resort', 'Pervomayskaya, 35', 'Hostel'),
('Sea Breeze', 'Pervomayskaya, 37', 'Hostel'),
('Best Place', 'Svetlaya, 6', 'Hostel'),
('Forest Comfort', 'Molodezhnaya, 40', 'Hostel'),
('Academic Resort', 'Lenina, 15', 'Cottage'),
('Best Place', 'Molodezhnaya, 44', 'Villa'),
('Best Place', 'Lenina, 50', 'Hostel'),
('Forest Comfort', 'Svetlaya, 11', 'Room'),
('Academic Resort', 'Svetlaya, 41', 'Room');

INSERT INTO fest.participants (surname, first_name, patronymic, sex, email, passport, org_id, train_id, accommodation_id, supervisor_id) VALUES 
('Popova', 'Maria', 'Ivanovna', FALSE, 'Maria.Popova0@email.com', 7859580398, 'Organization_O', 104, 9, 6),
('Popov', 'Artyom', 'Ivanovich', TRUE, 'Artyom.Popov1@email.com', 7167871973, 'Organization_A', 108, 2, 6),
('Popova', 'Eva', 'Ivanovna', FALSE, 'Eva.Popova2@email.com', 6810283107, 'Organization_B', 118, 15, 6),
('Novikova', 'Maria', 'Evgenievna', FALSE, 'Maria.Novikova3@email.com', 4589859541, 'Organization_F', 113, 8, 1),
('Popov', 'Maxim', 'Evgenievich', TRUE, 'Maxim.Popov4@email.com', 2205382766, 'Organization_N', 103, 6, 7),
('Ivanova', 'Victoria', 'Petrovna', FALSE, 'Victoria.Ivanova5@email.com', 8557668532, 'Organization_A', 121, 4, 13),
('Vasiliev', 'Maxim', 'Petrovich', TRUE, 'Maxim.Vasiliev6@email.com', 1258140019, 'Organization_J', 102, 8, 13),
('Wolves', 'Artyom', 'Ivanovich', TRUE, 'Artyom.Wolves7@email.com', 2029355641, 'Organization_C', 124, 1, 6),
('Petrov', 'Alexander', 'Ivanovich', TRUE, 'Alexander.Petrov8@email.com', 2161602296, 'Organization_H', 115, 10, 2),
('Smirnov', 'Alexander', 'Evgenievich', TRUE, 'Alexander.Smirnov9@email.com', 3138201418, 'Organization_A', 128, 6, 9),
('Petrova', 'Victoria', 'Evgenievna', FALSE, 'Victoria.Petrova10@email.com', 5570279212, 'Organization_C', 124, 2, 4),
('Pavlov', 'Maxim', 'Evgenievich', TRUE, 'Maxim.Pavlov11@email.com', 4812056201, 'Organization_D', 115, 9, 15),
('Zaitsev', 'Artyom', 'Evgenievich', TRUE, 'Artyom.Zaitsev12@email.com', 7127065773, 'Organization_M', 129, 11, 12),
('Vasilieva', 'Victoria', 'Evgenievna', FALSE, 'Victoria.Vasilieva13@email.com', 8045055744, 'Organization_A', 106, 1, 5),
('Kuznetsov', 'Artyom', 'Ivanovich', TRUE, 'Artyom.Kuznetsov14@email.com', 7571203010, 'Organization_M', 102, 3, 13),
('Lebedev', 'Alexander', 'Petrovich', TRUE, 'Alexander.Lebedev15@email.com', 9717771830, 'Organization_K', 109, 13, 7),
('Ivanova', 'Anna', 'Ivanovna', FALSE, 'Anna.Ivanova16@email.com', 9325124366, 'Organization_M', 108, 2, 8),
('Solovyova', 'Eva', 'Petrovna', FALSE, 'Eva.Solovyova17@email.com', 1826978613, 'Organization_M', 105, 7, 11),
('Wolves', 'Artyom', 'Evgenievich', TRUE, 'Artyom.Wolves18@email.com', 2400913916, 'Organization_M', 105, 3, 8),
('Smirnov', 'Artyom', 'Ivanovich', TRUE, 'Artyom.Smirnov19@email.com', 7707132456, 'Organization_K', 118, 10, 7),
('Novikova', 'Anna', 'Evgenievna', FALSE, 'Anna.Novikova20@email.com', 7920101952, 'Organization_M', 124, 15, 3),
('Popov', 'Maxim', 'Ivanovich', TRUE, 'Maxim.Popov21@email.com', 2627689639, 'Organization_K', 123, 1, 10),
('Vasiliev', 'Maxim', 'Ivanovich', TRUE, 'Maxim.Vasiliev22@email.com', 5120317631, 'Organization_F', 125, 7, 4),
('Morozova', 'Victoria', 'Evgenievna', FALSE, 'Victoria.Morozova23@email.com', 5351923099, 'Organization_A', 113, 9, 10),
('Ivanova', 'Maria', 'Evgenievna', FALSE, 'Maria.Ivanova24@email.com', 4028539321, 'Organization_I', 119, 3, 8);

INSERT INTO fest.participants (surname, first_name, sex, email, passport, org_id, train_id, accommodation_id, supervisor_id) VALUES 
('Smirnov', 'Maxim', TRUE, 'Maxim.Smirnov25@email.com', 9244587421, 'Organization_L', 120, 11, 2),
('Kuznetsov', 'Maxim', TRUE, 'Maxim.Kuznetsov26@email.com', 1286834724, 'Organization_M', 128, 4, 2),
('Pavlova', 'Maria', FALSE, 'Maria.Pavlova27@email.com', 4370950041, 'Organization_H', 106, 6, 7),
('Zaitseva', 'Victoria', FALSE, 'Victoria.Zaitseva28@email.com', 5916038044, 'Organization_M', 117, 5, 2),
('Vasilieva', 'Eva', FALSE, 'Eva.Vasilieva29@email.com', 6082264159, 'Organization_G', 126, 2, 5);