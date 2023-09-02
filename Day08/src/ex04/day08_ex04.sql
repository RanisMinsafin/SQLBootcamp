-- Cессия 1 - запускаем
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Cессия 2 - запускаем
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Cессия 1  - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 2 - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - обновление рейтинга «Pizza Hut» до 3.6 баллов
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
-- Cессия 2 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 1 - убеждаемся, что вы видим изменения в сеансе № 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 1 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 1 - убеждаемся, что вы видим изменения в сеансе № 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - убеждаемся, что вы видим изменения в сеансе № 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';