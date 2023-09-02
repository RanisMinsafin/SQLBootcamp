SELECT pizza_name
FROM menu
UNION
SELECT (SELECT pizza_name FROM menu WHERE menu.id = person_order.menu_id) AS pizza_name
FROM person_order
ORDER BY pizza_name DESC;