CREATE OR REPLACE FUNCTION fnc_currency_type(ttype int)
    RETURNS TABLE
            (
                user_id      bigint,
                name    varchar,
                lastname     varchar,
                currency_id  int,
                before_update timestamp,
                after_update timestamp
            )
AS
$$
(
    SELECT user_id,
           "user".name,
           "user".lastname,
           currency_id,
           balance.updated AS before_update,
           currency.updated AS after_update
    FROM balance
             FULL JOIN currency ON currency.id = balance.currency_id
        AND (CASE WHEN ttype = 1 THEN currency.updated > balance.updated ELSE currency.updated <= balance.updated END)
             FULL JOIN "user" ON "user".id = balance.user_id
    WHERE balance.currency_id IN (100, 200, 300)

)
$$ LANGUAGE sql;



SELECT
    COALESCE(all_changes.name, 'not defined') AS name,
    COALESCE(all_changes.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    (b.money * c.rate_to_usd)::real AS currency_in_usd
FROM (
         SELECT user_id,
                name,
                lastname,
                currency_id,
                before_update,
                MAX(after_update)
         FROM(
                 SELECT *
                 FROM (SELECT * FROM fnc_currency_type(0)) as type_0
                 WHERE (user_id, currency_id, before_update) NOT IN (
                     SELECT user_id,
                            currency_id,
                            before_update
                     FROM (SELECT user_id,
                                  name,
                                  lastname,
                                  currency_id,
                                  before_update,
                                  MIN(after_update)
                           FROM(
                                   SELECT *
                                   FROM fnc_currency_type(1)
                                   WHERE (user_id, currency_id, before_update) IN (
                                       SELECT user_id,
                                              currency_id,
                                              before_update
                                       FROM (SELECT * FROM fnc_currency_type(0)) as type_0
                                       WHERE after_update IS NULL
                                   )
                               ) AS future_curse
                           GROUP BY user_id,
                                    name,
                                    lastname,
                                    currency_id,
                                    before_update) as future
                 )
             ) AS past_curse
         GROUP BY user_id,
                  name,
                  lastname,
                  currency_id,
                  before_update
         UNION

         SELECT user_id,
                name,
                lastname,
                currency_id,
                before_update,
                MIN(after_update)
         FROM(
                 SELECT *
                 FROM fnc_currency_type(1)
                 WHERE (user_id, currency_id, before_update) IN (
                     SELECT user_id,
                            currency_id,
                            before_update
                     FROM fnc_currency_type(0)
                     WHERE after_update IS NULL
                 )
             ) AS future_curse
         GROUP BY user_id,
                  name,
                  lastname,
                  currency_id,
                  before_update

     ) AS all_changes
         INNER JOIN balance as b ON b.updated = all_changes.before_update
    AND b.user_id = all_changes.user_id
    AND b.currency_id = all_changes.currency_id
         INNER JOIN currency AS c ON c.id = all_changes.currency_id
    AND c.updated = all_changes.max
ORDER BY name DESC,
         lastname,
         currency_name