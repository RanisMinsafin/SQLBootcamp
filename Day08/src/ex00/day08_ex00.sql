-- Cессия 1 - запускаем
BEGIN;
-- Cессия 2 - запускаем
BEGIN;
-- Cессия 1 - обновление рейтинга «Pizza Hut» до 5 баллов в режиме сделки
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
-- Cессия 1 - убеждаемся, что мы видим изменения в сеансе № 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 2 - убеждаемся, что мы не видим изменения в сеансе № 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Cессия 1 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 2 - убеждаемся, что вы видим изменения в сеансе № 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';