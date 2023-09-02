-- Cессия 1 - запускаем
BEGIN;
-- Cессия 2 - запускаем
BEGIN;
-- Cессия 1  - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 2 - проверяем
SHOW TRANSACTION ISOLATION LEVEL;
-- Cессия 1 - обновление рейтинга
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
-- Cессия 2 - обновление рейтинга
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;
-- Cессия 1 - обновление рейтинга
UPDATE pizzeria SET rating = 3.0 WHERE id = 2;
-- Cессия 2 - обновление рейтинга
UPDATE pizzeria SET rating = 4.0 WHERE id = 1;
-- Cессия 1 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Cессия 2 - опубликуем свои изменения для всех параллельных сессий.
COMMIT;