##Update Employee Bonus

CREATE TABLE Employees (

    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER

);

INSERT INTO Employees VALUES (1,'John','IT',50000);
INSERT INTO Employees VALUES (2,'Alice','HR',40000);
INSERT INTO Employees VALUES (3,'David','IT',60000);
INSERT INTO Employees VALUES (4,'Emma','Finance',55000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_department IN VARCHAR2,
    p_bonus IN NUMBER

)

AS

BEGIN

    UPDATE Employees

    SET Salary = Salary + (Salary * p_bonus / 100)

    WHERE Department = p_department;

    COMMIT;

END;
/


SELECT * FROM Employees;
