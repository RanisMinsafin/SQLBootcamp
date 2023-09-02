-- Создаем последовательность баз данных
CREATE SEQUENCE seq_person_discounts START 1;
-- Устанавливаем для объекта последовательности текущее значение
SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts) + 1);