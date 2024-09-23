create database Day2;

create table Details(
EmployeeID int primary key,
FirstName varchar(50),
LastName varchar(50),
Position varchar(50),
Department varchar(50),
HireDate Date);

INSERT INTO Details( EmployeeID, FirstName, LastName, Position, Department, HireDate)
VALUES
(1, 'Amit', 'Sharma', 'Software Engineer', 'IT' , '2022-01-15'),
(2, 'Priya', 'Mehta', 'Project Manager', 'Operations' , '2023-02-20'),
(3, 'Raj', 'Patel', 'Business Analyst', 'Finance' , '2021-06-30'),
(4, 'Sunita', 'Verma', 'HR Specialist', 'HR' , '2019-08-12'),
(5, 'Vikram', 'Rao', 'Software Engineer', 'IT' , '2021-03-18'),
(6, 'Anjali', 'Nair', 'HR Manager', 'HR' , '2020-05-14'),
(7, 'Rohan', 'Desai', 'Finance Manager', 'Finance' , '2022-11-25'),
(8, 'Sneha', 'Kumar', 'Operations Coordinator', 'Operations' , '2023-07-02'),
(9, 'Deepak', 'Singh', 'Data Scientist', 'IT' , '2022-08-05'),
(10, 'Neha', 'Gupta', 'Business Analyst', 'Finance' , '2020-10-10');

1.) Retrieve Employees who work in the IT Department

select * from Details
Where Department = 'IT';

2.)Retrieve Employees whose Hiredate is after January 1, 2022

select * from Details
Where HireDate > '2022-01-01';

3.)Retrieve Employees who work in either the HR or Finance Departments

select * from Details
Where Department = 'HR' OR Department = 'Finance';

4.)Retrieve employees whose position is software engineer and were hired after january 1, 2021.

select * from Details
Where Position = 'Software Engineer' AND HireDate > '2021-01-01';

5.)Retrieve Employees whose lastname starts with 'S'

select * from Details
Where LastName LIKE 'S%';

6.)Retrieve Employees whose firstname starts with 'N'

select * from Details
Where FirstName LIKE 'N%';

7.)Count the number of employees in the employee table

select Count(EmployeeId) from Details;

8.)Find the earliest HireDate in the Employees Table

SELECT *
FROM Details
WHERE hiredate = (SELECT MIN(hiredate) FROM Details);