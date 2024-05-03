import psycopg2

from random import randint

conn = psycopg2.connect(dbname='...', user='...', password='...', host='...', port=...)
cursor = conn.cursor()


# organizations
length = 15
fields = ['IT', 'Business', 'Media', 'Science', 'Manufacturing']

query = "INSERT INTO fest.organizations (org, field) VALUES \n"
for i in range(length):
    query += f"('Organization_{chr(65+i)}', '{fields[randint(0, len(fields)-1)]}')"
    if i != length - 1:
        query += ',\n'
        continue
    query += ';\n\n'

cursor.execute(query)
conn.commit()

# transfer
length = 30
route_train = ['Moscow', 'Saint-Petersburg', 'Samara', 'Sochi', 'Vladivostok']

query = "INSERT INTO fest.transfer (train, route_train, capacity) VALUES \n"
for i in range(length):
    query += f"('{str(100+i)}', '{route_train[randint(0, len(route_train)-1)]}', '{str(randint(1, 200))}')"
    if i != length - 1:
        query += ',\n'
        continue
    query += ';\n\n'

cursor.execute(query)
conn.commit()

# supervisors
length = 15
surnames = ['Smirnov', 'Ivanov', 'Kuznetsov', 'Sokolov', 'Popov', 'Lebedev', 'Kozlov', 'Novikov', 'Morozov', 'Petrov', 'Wolves', 'Solovyov', 'Vasiliev', 'Zaitsev', 'Pavlov']

query = "INSERT INTO fest.supervisors (surname, region) VALUES \n"
for i in range(length):
    query += f"('{surnames[i]}', '{route_train[randint(0, len(route_train)-1)]}')"
    if i != length - 1:
        query += ',\n'
        continue
    query += ';\n\n'

cursor.execute(query)
conn.commit()

# accommodation
length = 15
types = ['Apartment', 'Cottage', 'Room', 'Villa', 'Hostel']
streets = ['Pervomayskaya', 'Polytechnicheskaya', 'Svetlaya', 'Lenina', 'Molodezhnaya']
names = ['Academic Resort', 'Sea Breeze', 'Good Vibes', 'Best Place', 'Forest Comfort']

query = "INSERT INTO fest.accommodation (name_acc, address_acc, type_acc) VALUES \n"
for i in range(length):
    query += f"('{names[randint(0, len(names)-1)]}', '{streets[randint(0, len(streets)-1)]}, {randint(1, 50)}', '{types[randint(0, len(types)-1)]}')"
    if i != length - 1:
        query += ',\n'
        continue
    query += ';\n\n'

cursor.execute(query)
conn.commit()

# participants
length = 30
surnames_m = ['Smirnov', 'Ivanov', 'Kuznetsov', 'Sokolov', 'Popov', 'Lebedev', 'Kozlov', 'Novikov', 'Morozov', 'Petrov', 'Wolves', 'Solovyov', 'Vasiliev', 'Zaitsev', 'Pavlov']
surnames_f = ['Smirnova', 'Ivanova', 'Kuznetsova', 'Sokolova', 'Popova', 'Lebedeva', 'Kozlova', 'Novikova', 'Morozova', 'Petrova', 'Wolves', 'Solovyova', 'Vasilieva', 'Zaitseva', 'Pavlova']
names_m = ['Alexander', 'Maxim', 'Artyom']
names_f = ['Eva', 'Anna', 'Maria', 'Victoria']
patronymics_m = ['Ivanovich', 'Evgenievich', 'Petrovich']
patronymics_f = ['Ivanovna', 'Evgenievna', 'Petrovna']
passports = set()

query = "INSERT INTO fest.participants (surname, first_name, patronymic, sex, email, passport, org_id, train_id, accommodation_id, supervisor_id) VALUES \n"
for i in range(length - 5):
    sex = bool(randint(0, 1))
    surname = surnames_m[randint(0, len(surnames_f)-1)] if sex else surnames_f[randint(0, len(surnames_f)-1)]
    name = names_m[randint(0, len(names_m)-1)] if sex else names_f[randint(0, len(names_f)-1)]
    patronymic = patronymics_m[randint(0, len(patronymics_m)-1)] if sex else patronymics_f[randint(0, len(patronymics_f)-1)]
    email = f"{name}.{surname}{str(i)}@email.com"
    query += f"('{surname}', '{name}', '{patronymic}', {"TRUE" if sex else "FALSE"}, '{email}', "

    passport = randint(1000000000, 9999999999)
    while passport in passports:
        passport = randint(1000000000, 9999999999)
    passports.add(passport)

    query += f"{passport}, 'Organization_{chr(65+randint(0, 14))}', {randint(100, 129)}, {randint(1, 15)}, {randint(1, 15)})"
    if i != length - 6:
        query += ',\n'
        continue
    query += ';\n\n'

query += "INSERT INTO fest.participants (surname, first_name, sex, email, passport, org_id, train_id, accommodation_id, supervisor_id) VALUES \n"
for i in range(length - 5, length):
    sex = bool(randint(0, 1))
    surname = surnames_m[randint(0, len(surnames_f)-1)] if sex else surnames_f[randint(0, len(surnames_f)-1)]
    name = names_m[randint(0, len(names_m)-1)] if sex else names_f[randint(0, len(names_f)-1)]
    patronymic = patronymics_m[randint(0, len(patronymics_m)-1)] if sex else patronymics_f[randint(0, len(patronymics_f)-1)]
    email = f"{name}.{surname}{str(i)}@email.com"
    query += f"('{surname}', '{name}', {"TRUE" if sex else "FALSE"}, '{email}', "

    passport = randint(1000000000, 9999999999)
    while passport in passports:
        passport = randint(1000000000, 9999999999)
    passports.add(passport)

    query += f"{passport}, 'Organization_{chr(65+randint(0, 14))}', {randint(100, 129)}, {randint(1, 15)}, {randint(1, 15)})"

    if i != length - 1:
        query += ',\n'
        continue
    query += ';\n'

cursor.execute(query)
conn.commit()

cursor.close()
conn.close()
