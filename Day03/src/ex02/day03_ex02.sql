SELECT pizza_name, price, pz.name
FROM menu AS m
    JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE m.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY 1, 2;
