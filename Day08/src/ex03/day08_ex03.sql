-- Cессия 1 - запускаем
BEGIN;
-- Cессия 2 - запускаем
BEGIN;
-- Cессия 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - обновление рейтинга «Pizza Hut» до 3.6 баллов
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
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