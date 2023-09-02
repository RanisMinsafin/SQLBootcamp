SELECT person.name AS person_name1,
       person_two.name AS person_name2,
       person.address AS common_address
FROM person
JOIN person person_two ON person.address = person_two.address AND person.id > person_two.id
ORDER BY 1,2,3;