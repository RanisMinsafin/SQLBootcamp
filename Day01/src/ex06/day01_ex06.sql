SELECT action_date, person_name
FROM (SELECT order_date AS action_date,
        (SELECT name FROM person WHERE person.id = person_order.person_id) AS person_name
    FROM person_order
    INTERSECT
    SELECT visit_date AS action_date,
           (SELECT name FROM person WHERE person.id = person_visits.person_id) AS person_name
    FROM person_visits
) AS info
ORDER BY action_date ASC, person_name DESC;
