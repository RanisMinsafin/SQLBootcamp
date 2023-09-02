 WITH dates AS (
  SELECT DATE '2022-01-01' + generate_series(0, 9) AS missed_date
), visite_dates AS (
  SELECT DISTINCT visit_date
  FROM person_visits
  WHERE person_id = 1 OR person_id = 2
)
SELECT dates.missed_date AS missed_date
FROM dates
LEFT JOIN visite_dates ON dates.missed_date = visite_dates.visit_date
WHERE visite_dates.visit_date IS NULL
ORDER BY missed_date ASC;

