SELECT info.order_date, CONCAT (person.name, ' (age:', person.age, ')') AS person_information
FROM (SELECT person_id AS id, order_date FROM person_order) AS info
NATURAL JOIN person
ORDER BY info.order_date, person_information;