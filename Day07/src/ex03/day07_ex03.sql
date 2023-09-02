WITH tmp AS (
    (SELECT p.name, COUNT(*) AS count, 'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria p ON p.id = m.pizzeria_id
    GROUP BY p.name)
UNION ALL
    (SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY pz.name)
)
SELECT name, SUM(count) AS total_count
FROM tmp
GROUP BY name
ORDER BY 2 DESC, 1;