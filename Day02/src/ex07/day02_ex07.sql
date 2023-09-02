SELECT p.name AS pizzeria_name
FROM pizzeria AS p
JOIN menu AS m ON m.pizzeria_id = p.id
JOIN person_visits AS pv ON pv.pizzeria_id = p.id
WHERE m.price < 800
  AND pv.person_id = 9
  AND pv.visit_date = '2022-01-08';
