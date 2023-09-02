CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci_number INTEGER)
AS $$
WITH RECURSIVE fibonacci(a, b) AS (
  VALUES (0, 1)
  UNION ALL
  SELECT b, a + b FROM fibonacci WHERE b < pstop
)
SELECT a FROM fibonacci;
$$ LANGUAGE SQL;


SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
