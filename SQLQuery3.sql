USE CompanyDB;
GO
SELECT * 
FROM Sales.employees;

-- Q2: Retrieve only the "first_name" and "last_name" columns
SELECT first_name, last_name 
FROM Sales.employees;

-- Q3: Retrieve "full name" as one column from first_name and last_name
SELECT first_name + ' ' + last_name AS full_name 
FROM Sales.employees;

-- Q4: Show the average salary of all employees (using AVG())
SELECT AVG(salary) AS average_salary 
FROM Sales.employees;

-- Q5: Select employees whose salary is greater than 50000
SELECT * 
FROM Sales.employees
WHERE salary > 50000;

-- Q6: Retrieve employees hired in the year 2020
SELECT * 
FROM Sales.employees
WHERE YEAR(hire_date) = 2020;

-- Q7: List employees whose last names start with 'S'
SELECT * 
FROM Sales.employees
WHERE last_name LIKE 'S%';

-- Q8: Display the top 10 highest-paid employees
SELECT TOP 10 * 
FROM Sales.employees
ORDER BY salary DESC;

-- Q9: Find employees with salaries between 40000 and 60000
SELECT * 
FROM Sales.employees
WHERE salary BETWEEN 40000 AND 60000;

-- Q10: Show employees with names containing the substring 'man'
SELECT * 
FROM Sales.employees
WHERE first_name LIKE '%man%' 
   OR last_name  LIKE '%man%';

   -- Q11: Display employees with a NULL value in "hire_date"
SELECT * 
FROM Sales.employees
WHERE hire_date IS NULL;


-- Q12: Select employees with a salary in the set (40000, 45000, 50000)
SELECT * 
FROM Sales.employees
WHERE salary IN (40000, 45000, 50000);

-- Q13: Retrieve employees hired between '2020-01-01' and '2021-01-01'
SELECT * 
FROM Sales.employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01';

-- Q14: List employees with salaries in descending order
SELECT * 
FROM Sales.employees
ORDER BY salary DESC;

-- Q15: Show the first 5 employees ordered by "last_name" in ascending order
SELECT TOP 5 * 
FROM Sales.employees
ORDER BY last_name ASC;

-- Q16: Display employees with a salary greater than 55000 and hired in 2020
SELECT * 
FROM Sales.employees
WHERE salary > 55000 
  AND YEAR(hire_date) = 2020;

-- Q17: Select employees whose first name is 'John' or 'Jane'
SELECT * 
FROM Sales.employees
WHERE first_name IN ('John', 'Jane');

-- Q18: List employees with a salary <= 55000 and a hire date after '2022-01-01'
SELECT * 
FROM Sales.employees
WHERE salary <= 55000 
  AND hire_date > '2022-01-01';

-- Q19: Retrieve employees with a salary greater than the average salary
SELECT * 
FROM Sales.employees
WHERE salary > (SELECT AVG(salary) FROM Sales.employees);

-- Q20: Display the 3rd to 7th highest-paid employees (using OFFSET and FETCH)
SELECT * 
FROM Sales.employees
ORDER BY salary DESC
OFFSET 2 ROWS 
FETCH NEXT 5 ROWS ONLY;

-- Q21: List employees hired after '2021-01-01' in alphabetical order
SELECT * 
FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name ASC, last_name ASC;

-- Q22: Retrieve employees with a salary > 50000 and last name not starting with 'A'
SELECT * 
FROM Sales.employees
WHERE salary > 50000 
  AND last_name NOT LIKE 'A%';

-- Q23: Display employees with a salary that is not NULL
SELECT * 
FROM Sales.employees
WHERE salary IS NOT NULL;

-- Q24: Show employees with names containing 'e' or 'i' and a salary > 45000
SELECT * 
FROM Sales.employees
WHERE (first_name LIKE '%e%' OR first_name LIKE '%i%' 
    OR last_name  LIKE '%e%' OR last_name  LIKE '%i%')
  AND salary > 45000;

-- Q25: Create a new table named "departments"
CREATE TABLE Sales.departments (
    department_id    INT          NOT NULL,
    department_name  VARCHAR(100) NOT NULL,
    manager_id       INT          NULL,
    CONSTRAINT PK_departments PRIMARY KEY (department_id),
    CONSTRAINT FK_departments_manager 
        FOREIGN KEY (manager_id) REFERENCES Sales.employees(employee_id)
);
GO

-- Sample data for departments (manager_id is set to NULL for now)
INSERT INTO Sales.departments (department_id, department_name, manager_id)
VALUES (1, 'HR',        NULL),
       (2, 'IT',        NULL),
       (3, 'Finance',   NULL),
       (4, 'Marketing', NULL),
       (5, 'Legal',     NULL);   -- no employees on purpose (for Q29 testing)
GO

-- Assign managers (the first 4 employees, picked by employee_id)
UPDATE d
SET d.manager_id = m.employee_id
FROM Sales.departments d
JOIN (
    SELECT TOP 4 employee_id, ROW_NUMBER() OVER (ORDER BY employee_id) AS rn
    FROM Sales.employees
    ORDER BY employee_id
) m ON m.rn = d.department_id;
GO


-- Q26: Add "department_id" to employees as a foreign key
ALTER TABLE Sales.employees
ADD department_id INT NULL;
GO

ALTER TABLE Sales.employees
ADD CONSTRAINT FK_employees_department
    FOREIGN KEY (department_id) REFERENCES Sales.departments(department_id);
GO

-- Assign employees to departments 1-4 (every 5th employee stays NULL, for Q28)
UPDATE Sales.employees
SET department_id = CASE 
                        WHEN employee_id % 5 = 0 THEN NULL
                        ELSE (employee_id % 4) + 1
                    END;
GO


-- Q27: Retrieve all employees with their department names (INNER JOIN)
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_name
FROM Sales.employees e
INNER JOIN Sales.departments d
        ON e.department_id = d.department_id;


-- Q28: Retrieve employees who don't belong to any department (LEFT JOIN + NULL check)
SELECT e.employee_id,
       e.first_name,
       e.last_name
FROM Sales.employees e
LEFT JOIN Sales.departments d
       ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- Q29: Show all departments and their employee count (JOIN + GROUP BY)
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM Sales.departments d
LEFT JOIN Sales.employees e
       ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY employee_count DESC;


-- Q30: Retrieve the highest-paid employee in each department (JOIN + MAX(salary))
SELECT d.department_name,
       e.first_name,
       e.last_name,
       e.salary
FROM Sales.employees e
INNER JOIN Sales.departments d
        ON e.department_id = d.department_id
INNER JOIN (
        SELECT department_id, MAX(salary) AS max_salary
        FROM Sales.employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id
) m ON e.department_id = m.department_id
   AND e.salary        = m.max_salary
ORDER BY d.department_name;

