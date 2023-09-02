INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id, po.person_id, m.pizzeria_id,
       (CASE
            WHEN COUNT(po.id) = 1 THEN 10.5
            WHEN COUNT(po.id) = 2 THEN 22
            ELSE 30
        END) AS discount
FROM person_order AS po
    JOIN menu AS m ON m.id = po.menu_id
GROUP BY po.person_id, m.pizzeria_id;