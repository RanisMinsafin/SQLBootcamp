SELECT pz1.name AS pizzeria_name
FROM pizzeria as pz1
    JOIN person_visits pv1 ON pv1.pizzeria_id = pz1.id
    JOIN person p1 ON p1.id = pv1.person_id
GROUP BY pz1.id
HAVING COUNT(CASE WHEN p1.gender = 'female' THEN p1.id END) > COUNT(CASE WHEN p1.gender = 'male' THEN p1.id END)
UNION ALL
SELECT pz2.name AS pizzeria_name
FROM pizzeria as pz2
    JOIN person_visits pv2 ON pv2.pizzeria_id = pz2.id
    JOIN person p2 ON p2.id = pv2.person_id
GROUP BY pz2.id
HAVING COUNT(CASE WHEN p2.gender = 'male' THEN p2.id END) > COUNT(CASE WHEN p2.gender = 'female' THEN p2.id END)
ORDER BY 1;
