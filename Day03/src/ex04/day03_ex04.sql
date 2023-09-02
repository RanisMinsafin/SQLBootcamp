WITH male AS (
    SELECT DISTINCT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN menu ON p.id = menu.pizzeria_id
    JOIN person_order po ON menu.id = po.menu_id
    JOIN person p2 on po.person_id = p2.id
    WHERE gender = 'male'
),
female AS (
    SELECT DISTINCT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN menu ON p.id = menu.pizzeria_id
    JOIN person_order po ON menu.id = po.menu_id
    JOIN person p2 on po.person_id = p2.id
    WHERE gender = 'female'
)
SELECT pizzeria_name
FROM male
EXCEPT
SELECT pizzeria_name
FROM female

UNION

SELECT pizzeria_name
FROM female
EXCEPT
SELECT pizzeria_name
FROM male
ORDER BY 1;