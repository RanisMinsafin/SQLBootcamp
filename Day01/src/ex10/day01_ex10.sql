SELECT p.name AS person_name, m.pizza_name AS pizza_name,  p2.name AS pizzeria_name
FROM person_order AS po
    JOIN person AS p ON po.person_id = p.id
    JOIN menu AS m     ON po.menu_id = m.id
    JOIN pizzeria AS p2    ON m.pizzeria_id = p2.id
ORDER BY person_name, pizza_name, pizzeria_name;
