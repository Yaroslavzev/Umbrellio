# README

Тестовое задание для Umbrellio на позицию младшего разработчика.  
В основном задания сделаны.
Экшены для 1 и 2 задания выполняются менее чем, за 100 мc, 3 и 4 — в среднем 250 и 1300 мс соотвественно на 200к постов, 100 юзерах, 50 ip и 50к оценок.
Экшены сделаны через сервисы с помощью гема `tolist` и `tainbox`.  
Установлен Sequel ORM. Ввиду первого использования Sequel не все запросы в базу данных сделаны на его синтаксисе.
Уставновлен гем `sequel-batches`. Я думал он поднимет скорость обработки запросов к базе, но это оказалось не так =) Пример использования гема оставлен в `rate_service.rb`. Значение выставлено `of: 1000`, так как бысрее всего запрос выполняется за один проход.  

В проекте, есть вещи, которые хотелось бы доделать:  
- валидировать все цифровые значения, которые попадают в контроллеры;  
- переписать все запросы в базу данных с использованием ситнтаксиса Sequel;
- оптимизировать запросы в Sequel;
- написать полные тесты.



## rubocop
Установлен `gem "rubocop-config-umbrellio"`.
Строка `Style/TrailingCommaInLiteral` заменена на две:

```ruby
Style/TrailingCommaInArrayLiteral:
  EnforcedStyleForMultiline: comma

Style/TrailingCommaInHashLiteral:
  EnforcedStyleForMultiline: comma
```


## настройка .env
```
DATABASE_HOSTNAME=localhost
DATABASE_PORT=port
DATABASE_USERNAME=username
DATABASE_NAME=database
TEST_DATABASE_NAME=test_database
DATABASE_PASSWORD=password
```


## Задание на знание SQL
дана таблица users вида - `id, group_id`
```SQL
CREATE temp TABLE users (
    id bigserial,
    group_id bigint
);

INSERT INTO users (group_id)
    VALUES (1), (1), (1), (2), (1), (3);
```
В этой таблице, упорядоченной по ID необходимо:
1. Выделить непрерывные группы по group_id с учетом указанного порядка записей (их 4)
2. Подсчитать количество записей в каждой группе
3. Вычислить минимальный ID записи в группе

Ответ:
```SQL
SELECT
    min(sub1.id),
    group_id,
    count(*) AS count
FROM (
    SELECT
        *,
        count(step
            OR NULL)
        OVER (
        ORDER BY
            id) AS grp
    FROM (
        SELECT
            *, (lag(id)
                OVER (PARTITION BY
                        group_id
                    ORDER BY
                        id) + 1)
                IS DISTINCT FROM id AS step
            FROM
                users) sub2) sub1
    GROUP BY
        grp,
        group_id
```

## Нарушение соглашений Rubocop
Rubocop выдает нарушения соглашения, которые, как мне кажется, связаны с Sequel:
```ruby
app/services/rate_service.rb:23:10: C: Rails/SaveBang: Use create! instead of create if the return value is not checked.
    Rate.create(value: @rate_data["value"], post_id: @rate_data["id"])
         ^^^^^^
app/services/post_service.rb:25:5: C: Style/UnlessElse: Do not use unless with else. Rewrite these with the positive case first.
    unless User[@post_data["user_id"]] ...
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/services/post_service.rb:28:17: C: Rails/SaveBang: Use save! instead of save if the return value is not checked.
      @post_new.save
                ^^^^
app/services/post_service.rb:30:12: C: Rails/SaveBang: create returns a model which is always truthy.
      Post.create(@post_data)
           ^^^^^^
```
