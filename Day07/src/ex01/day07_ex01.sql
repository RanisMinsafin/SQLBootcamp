SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits pv
    JOIN person AS p ON p.id = pv.person_id
GROUP BY pv.person_id, p.name
ORDER BY 2 DESC, 1 ASC
LIMIT 4;

