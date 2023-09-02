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
ORDER BY total_cost, tour;