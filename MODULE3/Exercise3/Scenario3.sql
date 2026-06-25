#Transfer fund

CREATE TABLE Accounts (

    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER

);
INSERT INTO Accounts VALUES (1001,'Rahul',50000);
INSERT INTO Accounts VALUES (1002,'Priya',30000);

COMMIT;

CREATE OR REPLACE PROCEDURE TransferFunds(

    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER

)

AS

    v_balance NUMBER;

BEGIN

    SELECT Balance

    INTO v_balance

    FROM Accounts

    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts

        SET Balance = Balance - p_amount

        WHERE AccountID = p_fromAccount;

        UPDATE Accounts

        SET Balance = Balance + p_amount

        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

SET SERVEROUTPUT ON;

BEGIN

    TransferFunds(1001,1002,5000);

END;
/

SELECT * FROM Accounts;
