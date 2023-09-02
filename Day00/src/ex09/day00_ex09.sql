SELECT
    (
         SELECT name
         FROM person
         WHERE person.id = info.person_id
     ) AS person_name,
     (
         SELECT name
         FROM pizzeria
         WHERE pizzeria.id = info.pizzeria_id
     ) AS pizzeria_name
FROM (
         SELECT *
         FROM person_visits
         WHERE visit_date >= '2022-01-07' AND visit_date <= '2022-01-09'
     ) AS info
ORDER BY person_name ASC, pizzeria_name DESC;