-- Cессия 1 - запускаем
BEGIN;
-- Cессия 2 - запускаем
BEGIN;
-- Cессия 1  - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 2 - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 1 - проверяем рейтинг «Pizza Hut»
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - проверяем рейтинг «Pizza Hut»
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 1 - после этого доводим UPDATE рейтинг до значения 4 в сеансе №1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Cессия 2 - после этого доводим UPDATE рейтинг до значения 3.6 в сеансе №2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Cессия 1 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 2 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 1 - проверяем рейтинг «Pizza Hut»
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - проверяем рейтинг «Pizza Hut»
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';

