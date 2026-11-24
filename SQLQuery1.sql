SELECT * 
FROM Employees;

SELECT Name, Salary 
FROM Employees;

SELECT DISTINCT DeptName 
FROM Employees;

SELECT TOP 5 * 
FROM Employees;

SELECT * 
FROM Employees
ORDER BY Salary DESC;

SELECT * 
FROM Employees
ORDER BY (SELECT NULL)   
OFFSET 2 ROWS 
FETCH NEXT 10 ROWS ONLY;

SELECT AVG(Salary) AS AverageSalary 
FROM Employees;

SELECT MAX(Salary) AS MaxSalary, 
       MIN(Salary) AS MinSalary 
FROM Employees;

SELECT TOP 3 Salary 
FROM Employees
ORDER BY Salary DESC;

SELECT * 
FROM Employees
ORDER BY Name ASC;

SELECT * 
FROM Employees
ORDER BY Salary DESC
OFFSET 1 ROWS 
FETCH NEXT 5 ROWS ONLY;

SELECT SUM(Salary) AS TotalSalaries 
FROM Employees;

SELECT * 
FROM Employees
WHERE Salary BETWEEN 40000 AND 60000
ORDER BY Salary ASC;
