CREATE TABLE IF NOT EXISTS person_discounts (
  id BIGINT PRIMARY KEY,
  person_id BIGINT NOT NULL,
  pizzeria_id BIGINT NOT NULL,
  discount NUMERIC NOT NULL,
  CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
  CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);

-- INSERT INTO menu
-- VALUES (19, 2,'greek pizza',800);
--
-- INSERT INTO menu (id, pizzeria_id, pizza_name, price)
-- VALUES ((SELECT MAX(id) + 1 FROM menu),
--         (SELECT id FROM pizzeria WHERE name = 'Dominos'),
--         'sicilian pizza', 900);
--
-- INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
-- VALUES ((SELECT MAX(id) + 1 FROM person_visits),
--         (SELECT id FROM person WHERE name = 'Denis'),
--          (SELECT id FROM pizzeria WHERE name = 'Dominos'),
--          '2022-02-24');
--
-- INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
-- VALUES ((SELECT MAX(id) + 1 FROM person_visits),
--         (SELECT id FROM person WHERE name = 'Irina'),
--          (SELECT id FROM pizzeria WHERE name = 'Dominos'),
--          '2022-02-24');
--
-- INSERT INTO person_order (id, person_id, menu_id, order_date)
-- VALUES ((SELECT MAX(id) + 1 FROM person_order),
--         (SELECT id FROM person WHERE name = 'Denis'),
--          (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
--          '2022-02-24');
--
-- INSERT INTO person_order (id, person_id, menu_id, order_date)
-- VALUES ((SELECT MAX(id) + 1 FROM person_order),
--         (SELECT id FROM person WHERE name = 'Irina'),
--          (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
--          '2022-02-24');
--
-- UPDATE menu
-- SET price = price * 0.9
-- WHERE pizza_name = 'greek pizza';
--
-- INSERT INTO person_order (id, person_id, menu_id, order_date)
-- SELECT generate_series( (SELECT MAX(id) + 1 FROM person_order),
--     (SELECT MAX(id) + (SELECT MAX(id) FROM person) FROM person_order)),
--        generate_series( (SELECT MIN(id) FROM person),
--            (SELECT MAX(id) FROM person)),
--        (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25';
--
-- DELETE FROM person_order WHERE order_date = '2022-02-25';
-- DELETE FROM menu WHERE pizza_name = 'greek pizza';
--
-- INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
-- VALUES ((SELECT MAX(id) + 1 FROM person_visits),
--         (SELECT id FROM person WHERE name = 'Dmitriy'),
--         (SELECT id FROM pizzeria WHERE name = 'DoDo Pizza'),
--         '2022-01-08');

