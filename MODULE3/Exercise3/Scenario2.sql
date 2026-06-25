##Update Employee Bonus

SELECT * FROM Employees;
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_department IN VARCHAR2,
    p_bonusPercent IN NUMBER

)

AS
BEGIN

    UPDATE Employees

    SET Salary = Salary + (Salary * p_bonusPercent / 100)

    WHERE Department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Employee bonus updated successfully.');

END;
/

SET SERVEROUTPUT ON;

BEGIN

    UpdateEmployeeBonus('IT',10);

END;
/

SELECT * FROM Employees;
