(SELECT p.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
    JOIN pizzeria p on pv.pizzeria_id = p.id
GROUP BY p.name
LIMIT 3)

UNION
(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz on pz.id = m.pizzeria_id
GROUP BY pz.name
LIMIT 3)

ORDER BY action_type ASC, count DESC;

