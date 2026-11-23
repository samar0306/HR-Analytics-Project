-- Departments where avg salary of TERMINATED employees is more than 70000
SELECT Department, round(avg(Salary),1) as salary
FROM hrdataset
WHERE Termd = 1
GROUP BY Department
HAVING salary > 70000
ORDER BY salary DESC;

-- Departments with more than 30 employees
SELECT count(*) as numberofemployees, Department
FROM hrdataset
GROUP BY Department
HAVING numberofemployees > 30
ORDER BY numberofemployees DESC;

-- Average EmpSatisfaction per Department for ACTIVE employees only
SELECT round(avg(EmpSatisfaction),1) as lol, Department
FROM hrdataset
WHERE Termd = 0
GROUP BY Department
ORDER BY lol DESC;

-- List all unique RecruitmentSource with count
SELECT RecruitmentSource, count(RecruitmentSource) as count_source
FROM hrdataset
GROUP BY RecruitmentSource
ORDER BY count_source DESC;

-- Average Salary per Department
SELECT round(avg(Salary),1) as Average_salary, Department
FROM hrdataset
GROUP BY Department;

-- Count employees per Department
SELECT count(*) as total_employees, Department
FROM hrdataset
GROUP BY Department
ORDER BY total_employees DESC;

-- Employees whose Position contains 'Manager'
SELECT Employee_Name, Department, Position
FROM hrdataset
WHERE Position LIKE '%Manager%';

-- Employees with Salary between 60000 and 80000
SELECT Employee_Name, Department, Salary
FROM hrdataset
WHERE Salary BETWEEN 60000 AND 80000
ORDER BY Salary DESC;

-- Find all employees with Absences more than 5
SELECT EmpID, Employee_Name, Absences
FROM hrdataset
WHERE Absences > 5
ORDER BY Absences;

-- Top 5 highest Salary employees
SELECT EmpID, Employee_Name, Department, Salary
FROM hrdataset
ORDER BY Salary DESC
LIMIT 5;

-- List Employee_Name, Department, Salary for all active employees
SELECT EmpID, Employee_Name, Department, Salary
FROM hrdataset
WHERE Termd = 0
ORDER BY Salary DESC;

-- Find employees with more than 5 Absences
SELECT EmpID, Employee_Name, Absences
FROM hrdataset
WHERE Absences > 5;

-- Count per TermReason only for terminated employees
SELECT TermReason, count(*) as Number
FROM hrdataset
WHERE Termd = 1
GROUP BY TermReason
ORDER BY Number DESC;

-- Find average EmpSatisfaction per Department
SELECT Department, round(avg(EmpSatisfaction),1) as Satisfaction_score
FROM hrdataset
GROUP BY Department
ORDER BY Satisfaction_score DESC;

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
