SELECT missed_date
FROM (
  SELECT date '2022-01-01' + generate_series(0, 9) AS missed_date
) AS dates
LEFT JOIN (
  SELECT visit_date
  FROM person_visits
  WHERE person_id = 1 OR person_id = 2
) AS visit_date ON dates.missed_date = visit_date
WHERE visit_date IS NULL
ORDER BY missed_date;
