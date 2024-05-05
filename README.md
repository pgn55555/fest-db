# Регистрация участников на фестиваль

* [Модели БД](models/README.md)
* [Скрипты для создания схемы и заполнения таблиц данными *(использование индексов)*. Генерация данных и их вставка.](create)
* [Скрипты для запросов к БД *(использование представлений)*](scripts)
* [Функции и процедуры](functions)
* [Триггеры](triggers)
* [Анализ данных](analysis.ipynb)

Для подключения к базе данных через python используется psycopg2. Его можно установить следующей командой:

    pip install psycopg2-binary

Возможно, ещё потребуется установить зависимости в вашей ОС. На Ubuntu их можно установить так:

    sudo apt-get install build-dep python-psycopg2

Проект подразумевает несколько таблиц в Третьей нормальной форме (3NF) и с версионными данными (SCD 1). 3NF заключается в том, что нет транзитивной зависимости Участник -> Город, но она выражается через направление поезда-трансфера участника. Версионные данные - вместимость конкретного поезда (может уменьшаться по мере покупки билетов).
