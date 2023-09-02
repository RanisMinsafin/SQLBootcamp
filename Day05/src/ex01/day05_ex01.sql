SET enable_seqscan = OFF;
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu m
    JOIN pizzeria pz ON pz.id = m.pizzeria_id;

EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu m
    JOIN pizzeria pz ON pz.id = m.pizzeria_id;