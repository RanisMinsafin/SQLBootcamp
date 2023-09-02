-- Создаем таблицу
CREATE TABLE nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost   INTEGER
);

-- Наполняем таблицу данными
INSERT INTO nodes (point1, point2, cost)
         VALUES
             ('a', 'b', 10),
             ('b', 'a', 10),
             ('a', 'c', 15),
             ('c', 'a', 15),
             ('a', 'd', 20),
             ('d', 'a', 20),
             ('b', 'd', 25),
             ('d', 'b', 25),
             ('b', 'c', 35),
             ('c', 'b', 35),
             ('d', 'c', 30),
             ('c', 'd', 30);

-- Создаем рекурсивный вызов
WITH RECURSIVE temp AS (
    -- Здесь запрос, который формирует базу рекурсии
    (SELECT point1 AS tour,
            point1,
            point2,
            cost,
            cost   AS total_cost
     FROM nodes
     WHERE point1 = 'a')

    UNION ALL

    -- Здесь запрос, который рекурсивно вызывается
    (SELECT parrent.tour || ',' || child.point1 as tour,
            child.point1,
            child.point2,
            child.cost,
            (parrent.total_cost + child.cost) AS total_cost
     FROM nodes AS child
        JOIN temp AS parrent on child.point1 = parrent.point2
     WHERE tour NOT LIKE '%' || child.point1 || '%')
)

-- Запрос, который сформирует конечную выборку
SELECT total_cost, '{' || tour || ',a}' AS tour
FROM temp
WHERE
    length(tour) = 7
    AND
    point2 = 'a'
    AND total_cost =
        -- Находим минимальную стоимость пути
        (SELECT MIN(total_cost)
        FROM temp
        WHERE
            length(tour) = 7
            AND
            point2 = 'a')
ORDER BY total_cost, tour;