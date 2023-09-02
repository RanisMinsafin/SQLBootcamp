SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM menu AS m
     JOIN person_visits AS pv ON pv.pizzeria_id = m.pizzeria_id
     JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
WHERE pv.person_id = 3 AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;

