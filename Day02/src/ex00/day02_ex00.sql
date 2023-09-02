SELECT pz.name, pz.rating
FROM  pizzeria AS pz
    LEFT JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
WHERE pv.id IS NULL;
