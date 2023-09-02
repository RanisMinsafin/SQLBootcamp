SELECT name, COUNT(*) AS count_of_visits
FROM person
    JOIN person_visits pv on person.id = pv.person_id
GROUP BY name
HAVING name = 'Dmitriy';