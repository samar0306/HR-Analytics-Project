-- Find employees who are Terminated and from Production Department
SELECT Employee_Name
FROM hrdataset
WHERE Termd = 1 
AND Department = 'Production';

-- Find top 5 highest Salary employees
SELECT Employee_Name, Salary
FROM hrdataset
ORDER BY Salary DESC
LIMIT 5;

-- Find max Salary and min Salary in whole table
SELECT max(Salary) as Max_salary,
min(Salary) as Min_salary
FROM hrdataset;

-- Find employees with Salary more than 100000
SELECT Employee_Name, Salary
FROM hrdataset
WHERE Salary > 100000;

-- Find distinct ManagerName
SELECT DISTINCT ManagerName
FROM hrdataset;

-- Departments with more than 50 employees (CTE + filter)
WITH Dept AS (
  SELECT Department, COUNT(Employee_Name) as total_employees
  FROM HRDataset
  GROUP BY Department)
SELECT Department, total_employees
FROM Dept
WHERE total_employees > 50;

-- Average Salary per Department
SELECT Department, ROUND(AVG(Salary),1) as Avg_salary 
FROM HRDataset
GROUP BY Department
ORDER BY Avg_salary DESC;

-- Count per EmploymentStatus (Active vs Terminated)
SELECT EmploymentStatus, COUNT(Employee_Name) as Status_of_employment
FROM HRDataset
GROUP BY EmploymentStatus;

-- Count per Department
SELECT Department, COUNT(Employee_Name) as Number_of_employees
FROM HRDataset
GROUP BY Department
ORDER BY Number_of_employees DESC;

-- Count per sex
SELECT Sex, COUNT(Employee_Name) as Sex_of_employee
FROM HRDataset
GROUP BY Sex;

-- Find total employees
SELECT COUNT(Employee_Name) as Total_employees
FROM HRDataset;
