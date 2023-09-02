DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons_female;

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id INTEGER, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
