-- Создаем временные таблицы currency_eur, currency_usd и currency_jpy, затем объединяем все в current_course
WITH currency_eur AS (
  SELECT *
  FROM currency
  WHERE name = 'EUR'
  ORDER BY updated DESC
  LIMIT 1
), currency_usd AS (
  SELECT *
  FROM currency
  WHERE name = 'USD'
  ORDER BY updated DESC
  LIMIT 1
), currency_jpy AS (
  SELECT *
  FROM currency
  WHERE name = 'JPY'
  ORDER BY updated DESC
  LIMIT 1
), current_course AS (
  SELECT *
  FROM currency_eur
  UNION
  SELECT *
  FROM currency_usd
  UNION
  SELECT *
  FROM currency_jpy
)
-- Соединяем все в один селект
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       SUM(b.money) AS volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       COALESCE(c.rate_to_usd, 1) * SUM(b.money)::real AS total_volume_in_usd
FROM "user" u
    FULL JOIN balance b ON b.user_id = u.id
    FULL JOIN current_course c ON b.currency_id = c.id
GROUP BY u.name, u.lastname, b.type, c.name, c.rate_to_usd
ORDER BY name DESC, lastname, b.type;