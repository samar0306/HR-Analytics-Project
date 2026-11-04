-- Youngest employees by DOB - RANK gives 3 ties for 1992
WITH dob AS (
  SELECT Employee_Name, DOB, CAST(substr(DOB, -4) AS INTEGER) as year,
  rank() OVER (ORDER BY CAST(substr(DOB, -4) AS INTEGER) DESC) as rnk
  FROM hrdataset
)
SELECT * FROM dob WHERE rnk = 1;

-- Youngest single employee - ROW_NUMBER breaks ties
WITH dob AS (
  SELECT Employee_Name, DOB, CAST(substr(DOB, -4) AS INTEGER) as year
  FROM hrdataset
)
SELECT Employee_Name, DOB
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY year DESC, DOB DESC) as rn
  FROM dob
)
WHERE rn = 1;
