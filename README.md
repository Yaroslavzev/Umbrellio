# README

Тестовое задание для Umbrellio


## rubocop
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
<<<<<<< HEAD
В этой таблице, упорядоченной по ID необходимо:
1. Выделить непрерывные группы по group_id с учетом указанного порядка записей (их 4)
2. Подсчитать количество записей в каждой группе
3. Вычислить минимальный ID записи в группе
=======
>>>>>>> b36aa2e1ae050160e6b95560a27ccfca2724cbe5

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
