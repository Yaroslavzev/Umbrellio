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
