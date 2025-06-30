CREATE DATABASE IF NOT EXISTS BANK;

USE BANK;

-- customer table
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    DATE_OF_BIRTH DATE,
    AGE INT,
    STATE VARCHAR(50),
    PINCODE VARCHAR(10),
    STREET_NUMBER VARCHAR(10),
    STREET_NAME VARCHAR(100),
    CITY VARCHAR(50)
);

-- customer_contact_number table
CREATE TABLE CUSTOMER_CONTACT_NUMBER (
    CUSTOMER_ID INT,
    NUMBER VARCHAR(15),
    PRIMARY KEY (CUSTOMER_ID, NUMBER),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- review table
CREATE TABLE REVIEW (
    REVIEWNO INT PRIMARY KEY,
    RATING INT,
    COMMENTS TEXT,
    CUSTOMER_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- branch table
CREATE TABLE BRANCH (
    BRANCHNAME VARCHAR(100) PRIMARY KEY,
    CITY VARCHAR(50),
    LIABILITIES DECIMAL(15, 2),
    ASSETS DECIMAL(15, 2)
);

-- loan table
CREATE TABLE LOAN (
    LOAN_NUMBER INT PRIMARY KEY,
    AMOUNT DECIMAL(15, 2),
    BRANCHNAME VARCHAR(100),
    CUSTOMER_ID INT,
    FOREIGN KEY (BRANCHNAME) REFERENCES BRANCH(BRANCHNAME),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- payment table
CREATE TABLE PAYMENT (
    VOUCHER_NO INT PRIMARY KEY,
    PAYMENT_AMOUNT DECIMAL(15, 2),
    PAYMENT_DATE DATE,
    LOAN_NUMBER INT,
    FOREIGN KEY (LOAN_NUMBER) REFERENCES LOAN(LOAN_NUMBER)
);

-- employee table
CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR(100),
    START_DATE DATE,
    YEAR_OF_SERVICE INT
);

-- employee_contact_number table
CREATE TABLE EMPLOYEE_CONTACT_NUMBER (
    EMP_ID INT,
    NUMBER VARCHAR(15),
    PRIMARY KEY (EMP_ID, NUMBER),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID)
);

-- account table
CREATE TABLE ACCOUNT (
    ACCOUNT_NUMBER INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ACCOUNT_TYPE VARCHAR(50),
    BALANCE DECIMAL(15, 2),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- saving_account table
CREATE TABLE SAVING_ACCOUNT (
    ACCOUNT_NUMBER INT PRIMARY KEY,
    DAILY_WITHDRAWAL_LIMIT DECIMAL(15, 2),
    INTEREST_RATE DECIMAL(5, 2),
    FOREIGN KEY (ACCOUNT_NUMBER) REFERENCES ACCOUNT(ACCOUNT_NUMBER)
);

-- current_account table
CREATE TABLE CURRENT_ACCOUNT (
    ACCOUNT_NUMBER INT PRIMARY KEY,
    OVERDRAFT_AMOUNT DECIMAL(15, 2),
    PER_TRANSACTION_CHARGES DECIMAL(5, 2),
    FOREIGN KEY (ACCOUNT_NUMBER) REFERENCES ACCOUNT(ACCOUNT_NUMBER)
);

-- serve table
CREATE TABLE SERVE (
    CUSTOMER_ID INT,
    EMP_ID INT,
    DATE DATE,
    PRIMARY KEY (CUSTOMER_ID, EMP_ID, DATE),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID)
);

-- insert into customer table
INSERT INTO CUSTOMER (
    CUSTOMER_ID,
    NAME,
    DATE_OF_BIRTH,
    AGE,
    STATE,
    PINCODE,
    STREET_NUMBER,
    STREET_NAME,
    CITY
) VALUES (
    1,
    'ahmed khan',
    '1985-06-15',
    39,
    'punjab',
    '54000',
    '101',
    'iqbal rd',
    'lahore'
),
(
    2,
    'fatima bibi',
    '1990-09-20',
    33,
    'sindh',
    '75500',
    '202',
    'jinnah ave',
    'karachi'
),
(
    3,
    'ayesha malik',
    '1975-12-05',
    48,
    'punjab',
    '46000',
    '303',
    'mall rd',
    'rawalpindi'
),
(
    4,
    'ali raza',
    '1980-01-25',
    44,
    'sindh',
    '71000',
    '404',
    'shahrah-e-faisal',
    'hyderabad'
),
(
    5,
    'hassan ahmed',
    '1995-04-10',
    29,
    'balochistan',
    '87300',
    '505',
    'sariab rd',
    'quetta'
),
(
    6,
    'zara sheikh',
    '1988-07-30',
    35,
    'khyber pakhtunkhwa',
    '25000',
    '606',
    'university rd',
    'peshawar'
);

-- insert into customer_contact_number table
INSERT INTO CUSTOMER_CONTACT_NUMBER (
    CUSTOMER_ID,
    NUMBER
) VALUES (
    1,
    '1234567890'
),
(
    2,
    '2345678901'
),
(
    2,
    '6247435636'
),
(
    3,
    '3456789012'
),
(
    4,
    '4567890123'
),
(
    4,
    '4347325858'
),
(
    5,
    '5678901234'
),
(
    5,
    '7453574756'
),
(
    6,
    '6789012345'
);

-- insert into review table
INSERT INTO REVIEW (
    REVIEWNO,
    RATING,
    COMMENTS,
    CUSTOMER_ID
) VALUES (
    1,
    5,
    'excellent service',
    1
),
(
    2,
    4,
    'very good',
    2
),
(
    3,
    3,
    'average experience',
    3
),
(
    4,
    2,
    'below expectations',
    4
),
(
    5,
    1,
    'poor service',
    5
),
(
    6,
    4,
    'good overall',
    6
);

-- insert into branch table
INSERT INTO BRANCH (
    BRANCHNAME,
    CITY,
    LIABILITIES,
    ASSETS
) VALUES (
    'anarkali branch',
    'lahore',
    500000.00,
    1000000.00
),
(
    'clifton branch',
    'karachi',
    300000.00,
    800000.00
),
(
    'saddar branch',
    'rawalpindi',
    700000.00,
    1500000.00
),
(
    'umt rd branch',
    'hyderabad',
    200000.00,
    600000.00
),
(
    'PIA branch',
    'quetta',
    100000.00,
    400000.00
),
(
    'township branch',
    'peshawar',
    400000.00,
    900000.00
);

-- insert into loan table
INSERT INTO LOAN (
    LOAN_NUMBER,
    AMOUNT,
    BRANCHNAME,
    CUSTOMER_ID
) VALUES (
    101,
    50000.00,
    'anarkali branch',
    1
),
(
    102,
    75000.00,
    'clifton branch',
    2
),
(
    103,
    30000.00,
    'saddar branch',
    3
),
(
    104,
    45000.00,
    'umt rd branch',
    4
),
(
    105,
    60000.00,
    'PIA branch',
    5
),
(
    106,
    80000.00,
    'township branch',
    6
);

-- insert into payment table
INSERT INTO PAYMENT (
    VOUCHER_NO,
    PAYMENT_AMOUNT,
    PAYMENT_DATE,
    LOAN_NUMBER
) VALUES (
    1,
    1000.00,
    '2023-01-15',
    101
),
(
    2,
    2000.00,
    '2023-02-20',
    102
),
(
    3,
    1500.00,
    '2023-03-25',
    103
),
(
    4,
    1200.00,
    '2023-04-30',
    104
),
(
    5,
    1800.00,
    '2023-05-10',
    105
),
(
    6,
    1600.00,
    '2023-06-15',
    106
);

-- insert into employee table
INSERT INTO EMPLOYEE (
    EMP_ID,
    EMPLOYEE_NAME,
    START_DATE,
    YEAR_OF_SERVICE
) VALUES (
    1,
    'ayesha naeem',
    '2010-01-01',
    14
),
(
    2,
    'bilal hassan',
    '2012-05-15',
    12
),
(
    3,
    'fatima shah',
    '2015-08-20',
    9
),
(
    4,
    'danish ali',
    '2018-11-10',
    6
),
(
    5,
    'zainab farooq',
    '2020-03-25',
    4
),
(
    6,
    'hamza qureshi',
    '2022-07-05',
    2
);

-- insert into employee_contact_number table
INSERT INTO EMPLOYEE_CONTACT_NUMBER (
    EMP_ID,
    NUMBER
) VALUES (
    1,
    '7890123456'
),
(
    1,
    '2536266657'
),
(
    2,
    '8901234567'
),
(
    3,
    '9012345678'
),
(
    3,
    '2357274646'
),
(
    4,
    '0123456789'
),
(
    5,
    '1234567890'
),
(
    5,
    '4646474754'
),
(
    6,
    '2345678901'
);

-- insert into account table
INSERT INTO ACCOUNT (
    ACCOUNT_NUMBER,
    CUSTOMER_ID,
    ACCOUNT_TYPE,
    BALANCE
) VALUES (
    1,
    1,
    'saving',
    5000.00
),
(
    2,
    2,
    'current',
    3000.00
),
(
    3,
    3,
    'saving',
    7000.00
),
(
    4,
    4,
    'current',
    2000.00
),
(
    5,
    5,
    'saving',
    10000.00
),
(
    6,
    6,
    'current',
    4000.00
),
(
    7,
    1,
    'saving',
    8000.00
),
(
    9,
    2,
    'saving',
    9000.00
),
(
    11,
    3,
    'saving',
    6000.00
),
(
    8,
    4,
    'current',
    5000.00
),
(
    10,
    5,
    'current',
    7000.00
),
(
    12,
    6,
    'current',
    6000.00
);

-- insert into saving_account table
INSERT INTO SAVING_ACCOUNT (
    ACCOUNT_NUMBER,
    DAILY_WITHDRAWAL_LIMIT,
    INTEREST_RATE
) VALUES (
    1,
    1000.00,
    2.5
),
(
    3,
    2000.00,
    2.0
),
(
    5,
    1500.00,
    2.7
),
(
    7,
    1000.00,
    2.3
),
(
    9,
    1800.00,
    2.6
),
(
    11,
    1200.00,
    2.4
);

-- insert into current_account table
INSERT INTO CURRENT_ACCOUNT (
    ACCOUNT_NUMBER,
    OVERDRAFT_AMOUNT,
    PER_TRANSACTION_CHARGES
) VALUES (
    2,
    5000.00,
    1.0
),
(
    4,
    3000.00,
    1.5
),
(
    6,
    7000.00,
    0.8
),
(
    8,
    4000.00,
    1.2
),
(
    10,
    6000.00,
    1.3
),
(
    12,
    3500.00,
    1.1
);

-- insert into serve table
INSERT INTO SERVE (
    CUSTOMER_ID,
    EMP_ID,
    DATE
) VALUES (
    1,
    1,
    '2023-01-15'
),
(
    2,
    2,
    '2023-02-20'
),
(
    3,
    3,
    '2023-03-25'
),
(
    4,
    4,
    '2023-04-30'
),
(
    5,
    5,
    '2023-05-10'
),
(
    6,
    6,
    '2023-06-15'
);

-- select queries to retrive all data from each table
SELECT
    *
FROM
    CUSTOMER;

SELECT
    *
FROM
    CUSTOMER_CONTACT_NUMBER;

SELECT
    *
FROM
    REVIEW;

SELECT
    *
FROM
    BRANCH;

SELECT
    *
FROM
    LOAN;

SELECT
    *
FROM
    PAYMENT;

SELECT
    *
FROM
    EMPLOYEE;

SELECT
    *
FROM
    EMPLOYEE_CONTACT_NUMBER;

SELECT
    *
FROM
    SERVE;

SELECT
    *
FROM
    ACCOUNT;

SELECT
    *
FROM
    CURRENT_ACCOUNT;

SELECT
    *
FROM
    SAVING_ACCOUNT;

-- truncate queries to retrive all data from each table
TRUNCATE CUSTOMER;

TRUNCATE CUSTOMER_CONTACT_NUMBER;

TRUNCATE REVIEW;

TRUNCATE BRANCH;

TRUNCATE LOAN;

TRUNCATE PAYMENT;

TRUNCATE EMPLOYEE;

TRUNCATE EMPLOYEE_CONTACT_NUMBER;

TRUNCATE SERVES;

TRUNCATE ACCOUNT;

TRUNCATE CURRENT_ACCOUNT;

TRUNCATE SAVING_ACCOUNT;

SELECT
    C.CUSTOMER_ID,
    N.NUMBER,
    C.NAME,
    C.DATE_OF_BIRTH,
    C.AGE,
    C.STATE,
    C.PINCODE,
    C.STREET_NUMBER,
    C.STREET_NAME,
    C.CITY
FROM
    CUSTOMER_CONTACT_NUMBER N
    NATURAL JOIN CUSTOMER C;

SELECT
    E.EMP_ID,
    N.NUMBER,
    E.EMPLOYEE_NAME,
    E.START_DATE,
    E.YEAR_OF_SERVICE
FROM
    EMPLOYEE_CONTACT_NUMBER N
    NATURAL JOIN EMPLOYEE E;

SELECT
    *
FROM
    LOAN
    NATURAL JOIN PAYMENT;

SELECT
    *
FROM
    ACCOUNT A
    INNER JOIN CURRENT_ACCOUNT C
    INNER JOIN SAVING_ACCOUNT S
    ON A.ACCOUNT_NUMBER = C.ACCOUNT_NUMBER = S.ACCOUNT_NUMBER;

-- Alter Query: alter a few things in your project tables

-- add a new column for email
ALTER TABLE CUSTOMER ADD EMAIL VARCHAR(100);

-- change the datatype of amount
ALTER TABLE LOAN MODIFY AMOUNT DECIMAL(20, 2);

-- Drop a column in customer table
ALTER TABLE CUSTOMER DROP COLUMN EMAIL;

-- Rename a column in the customer table
ALTER TABLE CUSTOMER CHANGE COLUMN STREET_NUMBER STREET_NO VARCHAR(10);

-- Rename the customer table
ALTER TABLE CUSTOMER RENAME TO CLIENTS;

ALTER TABLE CLIENTS RENAME TO CUSTOMER;

-- Select Query: Retrieve data from single table or multiple tables

-- all columns from customer table
SELECT
    *
FROM
    CLIENTS;

-- where clause
SELECT
    *
FROM
    CLIENTS
WHERE
    CITY = 'lahore';

SELECT
    C.CUSTOMER_ID,
    N.NUMBER,
    C.NAME,
    C.DATE_OF_BIRTH
FROM
    CUSTOMER_CONTACT_NUMBER N
    NATURAL JOIN CUSTOMER C;

SELECT
    E.EMP_ID,
    N.NUMBER,
    E.EMPLOYEE_NAME,
    E.START_DATE
FROM
    EMPLOYEE_CONTACT_NUMBER N
    NATURAL JOIN EMPLOYEE E;

SELECT
    *
FROM
    LOAN
    NATURAL JOIN PAYMENT;

SELECT
    A.ACCOUNT_NUMBER,
    C.PER_TRANSACTION_CHARGES,
    S.INTEREST_RATE
FROM
    ACCOUNT A
    INNER JOIN CURRENT_ACCOUNT C
    INNER JOIN SAVING_ACCOUNT S
    ON A.ACCOUNT_NUMBER = C.ACCOUNT_NUMBER = S.ACCOUNT_NUMBER;

-- specific columns from customer table
SELECT
    NAME,
    DATE_OF_BIRTH,
    CITY
FROM
    CLIENTS;

-- data from multiple tables using join
SELECT
    C.NAME,
    R.RATING,
    R.COMMENTS
FROM
    CLIENTS C
    INNER JOIN REVIEW R
    ON C.CUSTOMER_ID = R.CUSTOMER_ID;

-- query of each clause (i.e. orderby, having, like, limit etc…)



-- like clause
SELECT
    *
FROM
    CLIENTS
WHERE
    NAME LIKE 'a%';

-- order by to sort results
SELECT
    *
FROM
    CLIENTS
ORDER BY
    AGE DESC;

-- limit clause
SELECT
    *
FROM
    CLIENTS LIMIT 5;

-- Select customers with ages between 25 and 35
SELECT
    *
FROM
    CLIENTS
WHERE
    AGE BETWEEN 25 AND 35;

-- Select customers who live in specific cities
SELECT
    *
FROM
    CLIENTS
WHERE
    CITY IN ('lahore', 'karachi', 'peshawar');

-- Select customers who live in Los Angeles and are older than 30
SELECT
    *
FROM
    CLIENTS
WHERE
    CITY = 'lahore'
    AND AGE > 30;

-- Select customers who live in Los Angeles or are older than 30
SELECT
    *
FROM
    CLIENTS
WHERE
    CITY = 'lahore'
    OR AGE > 30;

-- Select distinct cities from the clients table
SELECT
    DISTINCT CITY
FROM
    CLIENTS;

-- Select the maximum balance from the account table
SELECT
    MAX(BALANCE)
FROM
    ACCOUNT;

-- total balance across all accounts
SELECT
    SUM(BALANCE)
FROM
    ACCOUNT;

-- Apply Joins between tables (ALL TYPES)

-- Inner join
SELECT
    C.NAME,
    A.ACCOUNT_TYPE,
    A.BALANCE
FROM
    CLIENTS C
    INNER JOIN ACCOUNT A
    ON C.CUSTOMER_ID = A.CUSTOMER_ID;

-- Left join
SELECT
    C.NAME,
    A.ACCOUNT_TYPE,
    A.BALANCE
FROM
    CLIENTS C
    LEFT JOIN ACCOUNT A
    ON C.CUSTOMER_ID = A.CUSTOMER_ID;

-- Right join
SELECT
    C.NAME,
    A.ACCOUNT_TYPE,
    A.BALANCE
FROM
    CLIENTS C
    RIGHT JOIN ACCOUNT A
    ON C.CUSTOMER_ID = A.CUSTOMER_ID;

-- Full outer join (note: full outer join is not directly supported in mysql, use union)
SELECT
    C.NAME,
    A.ACCOUNT_TYPE,
    A.BALANCE
FROM
    CLIENTS C
    LEFT JOIN ACCOUNT A
    ON C.CUSTOMER_ID = A.CUSTOMER_ID
UNION
SELECT
    C.NAME,
    A.ACCOUNT_TYPE,
    A.BALANCE
FROM
    CLIENTS C
    RIGHT JOIN ACCOUNT A
    ON C.CUSTOMER_ID = A.CUSTOMER_ID;

-- Referential Integrity Constraint
ALTER TABLE LOAN ADD CONSTRAINT FK_VOUCHER FOREIGN KEY (VOUCHER_NO) REFERENCES PAYMENT(VOUCHER_NO);

ALTER TABLE SAVING_ACCOUNT ADD CONSTRAINT FK_ACCOUNT_SAVING FOREIGN KEY (ACCOUNT_NUMBER) REFERENCES ACCOUNT(ACCOUNT_NUMBER);

ALTER TABLE CURRENT_ACCOUNT ADD CONSTRAINT FK_ACCOUNT_CURRENT FOREIGN KEY (ACCOUNT_NUMBER) REFERENCES ACCOUNT(ACCOUNT_NUMBER);

DROP TABLE PAYMENT;

DROP TABLE LOAN;

DROP TABLE BRANCH;

DROP DATABASE IF EXISTS BANK;