#Process Monthly Interest

CREATE TABLE SavingsAccounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER
);

INSERT INTO SavingsAccounts VALUES (101,'Rahul',10000);
INSERT INTO SavingsAccounts VALUES (102,'Priya',15000);
INSERT INTO SavingsAccounts VALUES (103,'Amit',25000);
INSERT INTO SavingsAccounts VALUES (104,'Sneha',12000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE SavingsAccounts
    SET Balance = Balance + (Balance * 0.01);

    COMMIT;

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/
SELECT * FROM SavingsAccounts;
