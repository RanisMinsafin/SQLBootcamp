SELECT COALESCE(p.name, '-') AS person_name,
       pv.visit_date AS visit_date, COALESCE(pz.name, '-') AS pizzeria_name
FROM person AS p
    LEFT JOIN person_visits AS pv
        ON pv.person_id = p.id AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    FULL JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
ORDER BY 1, 2, 3;
