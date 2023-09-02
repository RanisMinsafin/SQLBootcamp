-- Cессия 1 - запускаем
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Cессия 2 - запускаем
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Cессия 1  - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 2 - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 1
SELECT SUM(rating) FROM pizzeria;
-- Cессия 2 - обновление рейтинга «Pizza Hut» до 5.0 баллов
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
-- Cессия 2 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 1
SELECT SUM(rating) FROM pizzeria;
-- Cессия 1 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 1
SELECT SUM(rating) FROM pizzeria;
-- Cессия 2
SELECT SUM(rating) FROM pizzeria;


