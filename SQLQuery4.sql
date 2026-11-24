
USE CompanyDB;
GO

CREATE TABLE dbo.Employees (
    Id         INT IDENTITY(1,1) NOT NULL,
    FirstName  VARCHAR(50)       NOT NULL,
    LastName   VARCHAR(50)       NOT NULL,
    Salary     DECIMAL(10,2)     NULL,
    CONSTRAINT PK_dbo_Employees PRIMARY KEY (Id)
);
GO

CREATE PROCEDURE dbo.GetAllEmployees
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, FirstName, LastName, Salary
    FROM dbo.Employees;
END;
GO

CREATE PROCEDURE dbo.GetHighSalaryEmployees
    @MinSalary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, FirstName, LastName, Salary
    FROM dbo.Employees
    WHERE Salary > @MinSalary;
END;
GO

CREATE PROCEDURE dbo.AddEmployee
    @FirstName VARCHAR(50),
    @LastName  VARCHAR(50),
    @Salary    DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Employees (FirstName, LastName, Salary)
    VALUES (@FirstName, @LastName, @Salary);
END;
GO



CREATE TABLE dbo.EmployeeLog (
    Id          INT IDENTITY(1,1) NOT NULL,
    EmployeeId  INT               NOT NULL,
    Action      VARCHAR(50)       NOT NULL,
    ActionDate  DATETIME          NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_EmployeeLog PRIMARY KEY (Id)
);
GO



CREATE TRIGGER dbo.trg_Employees_AfterInsert
ON dbo.Employees
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.EmployeeLog (EmployeeId, Action, ActionDate)
    SELECT i.Id, 'INSERT', GETDATE()
    FROM inserted i;
END;
GO



EXEC dbo.AddEmployee @FirstName = 'Ahmed', @LastName = 'Ali',   @Salary = 45000;
EXEC dbo.AddEmployee @FirstName = 'Sara',  @LastName = 'Hassan', @Salary = 60000;
EXEC dbo.AddEmployee @FirstName = 'Omar',  @LastName = 'Samir',  @Salary = 75000;


EXEC dbo.GetAllEmployees;


EXEC dbo.GetHighSalaryEmployees @MinSalary = 50000;


SELECT * FROM dbo.EmployeeLog;