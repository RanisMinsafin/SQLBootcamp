CREATE FUNCTION fnc_persons_female()
RETURNS TABLE (id INTEGER, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'female';
$$ LANGUAGE SQL

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE (id INTEGER, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'male';
$$ LANGUAGE SQL

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
