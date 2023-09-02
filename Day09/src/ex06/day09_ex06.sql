CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice INTEGER DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE(pizzeria_name VARCHAR)
AS $$
BEGIN
      RETURN QUERY
    SELECT pizzeria.name
    FROM pizzeria
        JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
        JOIN person p on p.id = pv.person_id
        JOIN menu m on pizzeria.id = m.pizzeria_id
    WHERE p.name = pperson
        AND m.price < pprice
        AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');