SELECT GETDATE() AS CurrentDate,
DATEADD(DAY, 10, GETDATE()) AS FutureDate;

SELECT DATEADD(YEAR, -1, GETDATE()) AS DateMinus1Year;

SELECT DATEDIFF(DAY, '2024-01-01', GETDATE()) AS DaysDifference;

SELECT FORMAT(GETDATE(), 'MMMM dd, yyyy') AS FormattedDate;

SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS FormattedDate;

SELECT YEAR(GETDATE()) AS CurrentYear;

SELECT MONTH('2024-05-15') AS MonthExtracted;

SELECT DAY('2024-05-15') AS DayExtracted;

SELECT DATEDIFF(MONTH, '2002-10-22', GETDATE()) AS months_since_birthday;