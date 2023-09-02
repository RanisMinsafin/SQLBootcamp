SELECT p.name AS pizzeria_name
FROM pizzeria p
    JOIN person_visits pv ON p.id = pv.pizzeria_id
    LEFT JOIN person_order po ON pv.person_id = po.person_id AND pv.visit_date = po.order_date
WHERE pv.person_id = 2
AND po.id IS NULL
ORDER BY 1;
