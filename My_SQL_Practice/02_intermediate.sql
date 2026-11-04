-- Find employees hired after 2015
SELECT Employee_Name, DateofHire
FROM hrdataset
WHERE CAST(substr(DateofHire, -4) AS INTEGER) > 2015;
