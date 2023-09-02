COMMENT ON TABLE person_discounts IS 'This table contain discounts to individuals at pizzerias';

COMMENT ON COLUMN person_discounts.id is 'Column which contain unique id';
COMMENT ON COLUMN person_discounts.person_id is 'The ids of persons who receives the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id is 'The ids of pizzerias where discount is available';
COMMENT ON COLUMN person_discounts.discount is 'The discount value in percentage for the person at the specific pizzeria';