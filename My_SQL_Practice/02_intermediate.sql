-- Department with highest % terminated using CTE + RANK
WITH pct AS (
  SELECT Department, round(count(CASE WHEN Termd=1 THEN 1 END)*100.0/count(*),1) as trm
  FROM hrdataset
  GROUP BY Department
),
ranked AS (
  SELECT Department, trm, rank() OVER (ORDER BY trm DESC) as rnk
  FROM pct
)
SELECT Department, trm as percent_terminated
FROM ranked
WHERE rnk = 1;

-- Managers with highest number of terminations
SELECT ManagerName, ManagerID, count(*) as terminated_count
FROM hrdataset
WHERE Termd = 1
GROUP BY ManagerName, ManagerID
ORDER BY terminated_count DESC
LIMIT 5;

-- Departments where average EmpSatisfaction less than 3
SELECT Department, round(avg(EmpSatisfaction),1) as Average
FROM hrdataset
GROUP BY Department
HAVING Average < 3.0
ORDER BY Average ASC;

-- % Hispanic Latino per Department
SELECT Department, round(count(CASE WHEN HispanicLatino='Yes' THEN 1 END)*100.0/count(*),1) as HispanicLatino
FROM hrdataset
GROUP BY Department
ORDER BY HispanicLatino DESC;

-- % Terminated per Department
SELECT Department, round(count(CASE WHEN Termd=1 THEN 1 END)*100.0/count(*),1) as percent_terminated
FROM hrdataset
GROUP BY Department
ORDER BY percent_terminated DESC;

-- Average salary terminated vs active per Department
SELECT Department, 
round(avg(CASE WHEN Termd=1 THEN Salary END),1) as terminated_avg_salary, 
round(avg(CASE WHEN Termd=0 THEN Salary END),1) as active_avg_salary
FROM hrdataset
GROUP BY Department;

-- Find employees hired after 2015
SELECT Employee_Name, DateofHire
FROM hrdataset
WHERE CAST(substr(DateofHire, -4) AS INTEGER) > 2015;
