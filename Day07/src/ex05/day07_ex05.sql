SELECT DISTINCT name
FROM person_order po
    JOIN person p ON p.id = po.person_id
ORDER BY 1;
