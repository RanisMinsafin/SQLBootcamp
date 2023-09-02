SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m
    JOIN person_order AS po ON po.menu_id = m.id
    JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
    JOIN person AS p ON p.id = po.person_id
WHERE p.name IN('Denis', 'Anna')
ORDER BY 1, 2;
