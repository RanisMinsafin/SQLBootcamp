SELECT name || ' (age:' || quote_literal(age) ||  ',gender:' || '' ||  quote_literal(gender) || ',address:' ||  quote_literal(address) || ')'
    AS person_information
FROM person
ORDER BY person_information
