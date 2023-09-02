SELECT p.address,
       ROUND(MAX(p.age) - (CAST(MIN(p.age) AS decimal) / MAX(p.age)), 2) AS formula,
       ROUND(AVG(p.age), 2) AS average,
       CASE WHEN (MAX(p.age) - ((MAX(p.age) - MIN(p.age)) / MAX(p.age))) > AVG(p.age) THEN true ELSE false END AS comparison
FROM person p
GROUP BY p.address
ORDER BY 1;
