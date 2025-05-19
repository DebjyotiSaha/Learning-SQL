USE project

-- Retrieve all customer data
SELECT *
FROM Data1

SELECT 
	District, 
	Growth, 
	Literacy
FROM Data1

SELECT *
FROM Data1
WHERE Sex_Ratio != 900

SELECT * 
FROM Data1
WHERE State = 'Maharashtra'

SELECT District, State
FROM Data1
WHERE State = 'Maharashtra'

SELECT *
FROM Data1
ORDER BY Literacy DESC

SELECT *
FROM Data1
ORDER BY Literacy ASC

SELECT *
FROM Data1
ORDER BY District DESC, Literacy ASC

SELECT 
	State, 
	SUM(Sex_Ratio) AS Total_Score,
	COUNT(State) AS Total_appearance
FROM Data1
GROUP BY State

SELECT
	State,
	SUM(Sex_Ratio) AS Total
FROM Data1
GROUP BY State
HAVING 
SUM(Sex_Ratio)>900

SELECT *
FROM Data1

SELECT 
	State,
	AVG(Sex_Ratio)
FROM Data1
WHERE Sex_Ratio != 0
GROUP BY State
HAVING AVG(Sex_Ratio) > 900

SELECT DISTINCT
State
FROM Data1

SELECT TOP 3 *
FROM Data1

SELECT TOP 3*
FROM Data1
ORDER BY Sex_Ratio DESC

CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

ALTER TABLE persons
DROP COLUMN phone

DROP TABLE persons

CREATE TABLE customers (
	id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	country VARCHAR(15),
	score INT NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

INSERT INTO customers (id, first_name, country, score)
VALUES 
	(1, 'Anna', 'USA', 24),
	(2, 'Sam', NULL, 100)

CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_customers PRIMARY KEY (id)
)

SELECT * FROM customers

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT id, first_name, NULL, 'Unknown'
FROM customers

SELECT * FROM persons

UPDATE customers
SET country = 'USA',
	score = 0
WHERE id = 1

DELETE FROM customers
WHERE id < 2
SELECT * FROM customers

SELECT * FROM Data1
WHERE State != 'Maharashtra'

SELECT * FROM Data1
WHERE Sex_Ratio > 800

SELECT * FROM Data1
WHERE NOT State = 'Gujarat'

SELECT * FROM Data1
WHERE Sex_Ratio BETWEEN 800 AND 900

SELECT * FROM Data1
WHERE Sex_Ratio >= 800 AND Sex_Ratio <= 900

SELECT * FROM Data1
WHERE State = 'Bihar' OR State = 'Gujarat'

SELECT * FROM Data1
WHERE State IN ('Bihar', 'Gujarat')

SELECT * FROM Data1
WHERE District LIKE 'M%'

SELECT * FROM Data1
WHERE District LIKE '%n'

SELECT * FROM Data1
WHERE District LIKE '%r%'

SELECT * FROM Data1
WHERE District LIKE '__r%'

SELECT * FROM Data1;

SELECT * FROM Data2;

SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data1
INNER JOIN Data2
ON Data1.District = Data2.District

SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population, Data2.Area_km2,
Data1.Literacy, Data1.Sex_Ratio
FROM Data1
LEFT JOIN Data2
ON Data1.District = Data2.District

SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data2
RIGHT JOIN Data1
ON Data1.District = Data2.District

SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data2
FULL JOIN Data1
ON Data1.District = Data2.District

SELECT * 
FROM Data1
LEFT JOIN Data2
ON Data1.District=Data2.District
WHERE Data2.District IS NULL

SELECT * 
FROM Data1
RIGHT JOIN Data2
ON Data1.District=Data2.District
WHERE Data1.District IS NULL

SELECT * 
FROM Data2
LEFT JOIN Data1
ON Data1.District=Data2.District
WHERE Data1.District IS NULL

SELECT *
FROM Data1
FULL JOIN Data2
ON Data1.District=Data2.District
WHERE Data1.District IS NULL
OR Data2.District IS NULL

SELECT *
FROM Data1 
LEFT JOIN Data2
ON Data1.District=Data2.District
WHERE Data2.District IS NOT NULL

SELECT * 
FROM Data1
CROSS JOIN Data2

USE Zomato

SELECT * FROM goldusers_signup;
SELECT * FROM product;
SELECT * FROM sales;
SELECT * FROM users;

SELECT S.userid, S.created_date, S.product_id, G.gold_signup_date
FROM sales AS S
LEFT JOIN users AS U
ON S.userid=U.userid
LEFT JOIN product as P
ON S.product_id=P.product_id
LEFT JOIN goldusers_signup AS G
ON S.userid=G.userid

SELECT * FROM goldusers_signup;
SELECT * FROM sales;

SELECT userid, gold_signup_date FROM goldusers_signup
UNION
SELECT userid, created_date FROM sales

SELECT userid, gold_signup_date FROM goldusers_signup
UNION ALL
SELECT userid, created_date FROM sales

SELECT userid, gold_signup_date FROM goldusers_signup
EXCEPT
SELECT userid, created_date FROM sales

SELECT userid, gold_signup_date FROM goldusers_signup
INTERSECT
SELECT userid, created_date FROM sales

SELECT * FROM goldusers_signup;
SELECT * FROM product;
SELECT * FROM sales;
SELECT * FROM users;

SELECT userid, gold_signup_date FROM goldusers_signup;
SELECT userid, created_date FROM sales
UNION
SELECT userid, signup_date FROM users

USE project

SELECT District FROM Data1

SELECT District,
State,
CONCAT(District, ', ', State)
FROM
Data1

SELECT District,
State,
CONCAT(District, ', ', State),
LOWER(District),
UPPER(State)
FROM
Data1

SELECT District 
FROM Data1
WHERE District != TRIM(District)

SELECT
	District,
	LEN(District),
	LEN(TRIM(District)),
	LEN(District) - LEN(TRIM(District))
FROM Data1
WHERE LEN(District) - LEN(TRIM(District)) !=0

SELECT 
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '/') AS new

SELECT District, LEFT(District, 2)
FROM Data1

SELECT District, RIGHT(District, 2)
FROM Data1

SELECT District, SUBSTRING(District, 2, LEN(District))
FROM Data1

SELECT 3.516 AS MAIN_NUMBER,
ROUND(3.516,2) AS ROUND_2,
ROUND(3.516,1) AS ROUND_1,
ROUND(3.516,0) AS ROUND_0

SELECT -10,
ABS(-10) AS NEGATIVE,
ABS(10) AS POSITIVE

USE [Pizza DB]

SELECT order_id, order_date, order_time 
FROM pizza_sales

SELECT order_id, order_time 
FROM pizza_sales

SELECT order_id, order_time, '2015-12-12' AS HardCoded 
FROM pizza_sales

SELECT order_id, order_time, '2015-12-12' AS HardCoded, GETDATE() Today 
FROM pizza_sales

SELECT order_id, order_date, YEAR(order_date) Year, MONTH(order_date) Month, DAY(order_date) Day
FROM pizza_sales

SELECT order_id, order_date, order_time, DATEPART(YEAR, order_date) Year, 
DATEPART(MONTH, order_date) Month, DATEPART(DAY, order_date) Day, DATEPART(HOUR, order_time) Hour,
DATEPART(QUARTER, order_date) Quarter, DATEPART(WEEK, order_date) Week
FROM pizza_sales

SELECT order_id, order_date, order_time, DATENAME(MONTH, order_date) Month,
DATENAME(WEEKDAY, order_date) Week, DATENAME(DAY, order_date) Day,
DATENAME(YEAR, order_date) Year
FROM pizza_sales

SELECT order_id, order_date, order_time, DATETRUNC(MINUTE, order_time),
DATETRUNC(DAY, order_date), DATETRUNC(YEAR, order_date)
FROM pizza_sales

SELECT order_id, order_date, order_time, EOMONTH(order_date)
FROM pizza_sales

-- How many orders were placed each year?
SELECT order_id, YEAR(order_date), quantity
FROM pizza_sales

-- How many orders were placed each month?
SELECT order_id, MONTH(order_date), quantity
FROM pizza_sales

SELECT order_id, DATENAME(MONTH, order_date), quantity
FROM pizza_sales

-- Show order from February?
SELECT * FROM pizza_sales
WHERE DATENAME(MONTH, order_date) = 'February'

SELECT * FROM pizza_sales
WHERE MONTH(order_date) = 2

SELECT order_id, order_date, order_time,
FORMAT(order_date, 'MM-dd-yyyy'),
FORMAT(order_date, 'dd-MM-yyyy'),
FORMAT(order_date, 'dd'),
FORMAT(order_date, 'ddd'),
FORMAT(order_date, 'dddd'),
FORMAT(order_date, 'MM'),
FORMAT(order_date, 'MMM'),
FORMAT(order_date, 'MMMM')
FROM pizza_sales

SELECT
order_id, order_date, order_time,
'Day' +  FORMAT(order_date, ' ddd MMM') +
' Q' + DATENAME(QUARTER, order_date) + ' ' +
FORMAT(order_date, 'yyyy hh:mm:ss tt')
FROM pizza_sales

SELECT 
FORMAT(order_date, 'MMM yy') Order_Date, COUNT(*)
FROM pizza_sales GROUP BY FORMAT(order_date, 'MMM yy')

SELECT
CONVERT(INT, '123'),
CONVERT(DATE, '2025-08-24'),
order_date,
CONVERT(DATE, order_date)
FROM pizza_sales

SELECT
order_date,
CONVERT(DATE, order_date),
CONVERT(VARCHAR, order_date, 32)
FROM pizza_sales

SELECT
CAST('123' AS INT),
CAST('123' AS VARCHAR),
CAST('2025-06-12' AS DATE),
CAST('2023-12-12' AS DATETIME)

SELECT * FROM pizza_sales

SELECT order_id, order_date,
DATEADD(Year, 3, order_date),
DATEADD(Month, 3, order_date),
DATEADD(Day, 3, order_date),
DATEADD(Year, -10, order_date)
FROM pizza_sales

SELECT EmployeeID, BirthDate,
DATEDIFF(Year, BirthDate, GETDATE()) 
FROM Employees

SELECT ISDATE('123')
SELECT ISDATE('2025-08-20')
SELECT ISDATE('23-09-2013')

SELECT * FROM pizza_sales

SELECT order_id, total_price,
AVG(total_price) OVER () AvgScore1,
AVG(COALESCE (total_price, 0)) OVER() AvgScore2
FROM pizza_sales

SELECT
order_id,
pizza_name_id,
pizza_category,
total_price,
COALESCE(pizza_category, '') Category,
pizza_name_id + ' ' + pizza_category AS FullN,
COALESCE(total_price, 0) + 10 AS Bonus
FROM pizza_sales
-- WHERE COALESCE(total_price, 0) = NULL

SELECT 
A.YEAR, A.TYPE, A.ORDERS, B.SALES
FROM Table1 A
JOIN Table2 B
ON A.YEAR = B.YEAR
AND ISNULL (A.TYPE, '') = ISNULL(B.TYPE, '')

WITH Orders AS(
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, ' ' 
)
SELECT 
*,
DATALENGTH(Category) CategoryLen,
DATALENGTH(TRIM(Category)) Policy1,
NULLIF(TRIM(Category), '') Policy2,
COALESCE(Category, 'unknown') Policy3,
COALESCE(NULLIF(TRIM(Category), ''), 'unknown') Policy3Again
FROM Orders

SELECT 
Category,
SUM(total_price) Total
FROM(
	SELECT 
	order_id,
	total_price,
	CASE
		WHEN total_price > 20 THEN 'HIGH'
		WHEN total_price > 10 THEN 'MEDIUM'
		ELSE 'LOW'
	END Category
	FROM pizza_sales
)t
GROUP BY Category
ORDER BY Total DESC

USE project

SELECT * FROM customers
SELECT * FROM PERSONS

SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender = 'F' THEN 'Female'
	WHEN Gender = 'M' THEN 'Male'
	ELSE 'Not Available'
END GenderFullText
FROM Sales

SELECT
CustomerID,
Scores,
CASE 
	WHEN Score IS NULL THEN 0
	ELSE Score
END ScoreClean,
AVG(Scores) OVER() AvgCust
FROM Sales

SELECT
OrderID,
CustomerID,
Sales,
CASE
	WHEN Sales > 30 THEN 1
	ELSE 0
END SalesFlag
FROM Sales
ORDER BY CustomerID

SELECT
CustomerID,
SUM(CASE
	WHEN Sales > 30 THEN 1
	ELSE 0
END) TotalOrders
FROM Sales
GROUP BY CustomerID

USE [Pizza DB]

SELECT * FROM pizza_sales
SELECT SUM(total_price) FROM pizza_sales

SELECT pizza_name_id, SUM(total_price) 
FROM pizza_sales
GROUP BY pizza_name_id

SELECT order_id, order_date, pizza_name_id, SUM(total_price) 
FROM pizza_sales
GROUP BY pizza_name_id

SELECT order_id, order_date,pizza_name_id, SUM(total_price) OVER(PARTITION BY pizza_name_id)
FROM pizza_sales

SELECT * FROM pizza_sales
SELECT order_id, order_date, pizza_name_id,
SUM(total_price) OVER() SalesWithoutPart,
SUM(total_price) OVER(PARTITION BY order_id) SalesWithPart
FROM pizza_sales

SELECT order_id, order_date, pizza_name_id, pizza_category,
SUM(total_price) OVER() SalesWithoutPart,
SUM(total_price) OVER(PARTITION BY order_id) SalesWithPart,
SUM(total_price) OVER(PARTITION BY order_id, pizza_category) AddedQuant
FROM pizza_sales

SELECT * FROM pizza_sales
SELECT order_id, order_date, total_price, pizza_name_id,
RANK() OVER(ORDER BY total_price DESC)
FROM pizza_sales

SELECT order_id, pizza_name_id, pizza_category, total_price, 
SUM(total_price) OVER (PARTITION BY pizza_category ORDER BY order_date
ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) Total
FROM pizza_sales

SELECT * FROM pizza_sales
SELECT order_id, order_date, COUNT(*) OVER() TotalOrders
FROM pizza_sales

SELECT order_id, order_date, COUNT(*) OVER() TotalOrders,
COUNT(*) OVER (PARTITION BY pizza_id) Orders
FROM pizza_sales

SELECT *,
COUNT(*) OVER () TotalCust,
COUNT(pizza_id) OVER() Total
FROM pizza_sales

SELECT order_id,
COUNT(*) OVER (PARTITION BY order_id) CheckPK
FROM pizza_sales

SELECT * FROM
(SELECT order_id,
COUNT(*) OVER (PARTITION BY order_id) CheckPK
FROM pizza_sales
)t WHERE CheckPK > 1

SELECT * FROM pizza_sales
SELECT order_id, pizza_category, total_price,
SUM(total_price) OVER () TotalSales,
ROUND(total_price / SUM(total_price) OVER () * 100, 5) 
FROM pizza_sales

SELECT order_id, order_date, total_price, pizza_category,
AVG(total_price) OVER (),
AVG (total_price) OVER(PARTITION BY pizza_category)
FROM pizza_sales

SELECT pizza_id, order_id, order_date, pizza_category,
MAX(total_price) OVER (),
MIN(total_price) OVER (),
MAX(total_price) OVER (PARTITION BY pizza_category),
MIN(total_price) OVER (PARTITION BY pizza_category)
FROM pizza_sales

SELECT * FROM (
SELECT *, MAX(unit_price) OVER () HighS
FROM pizza_sales
)t
WHERE unit_price = HighS

SELECT order_id, pizza_category, order_date, total_price,
AVG(total_price) OVER (PARTITION BY pizza_category),
AVG(total_price) OVER (PARTITION BY pizza_category ORDER BY order_date),
AVG(total_price) OVER (PARTITION BY pizza_category ORDER BY order_date ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) ROLLINGAVG
FROM pizza_sales

USE [Pizza DB]

SELECT * FROM pizza_sales

SELECT pizza_id, total_price,
ROW_NUMBER() OVER(ORDER BY total_price DESC) SalesRAG
FROM pizza_sales

SELECT pizza_id, total_price,
RANK() OVER(ORDER BY total_price DESC) SalesRAG1
FROM pizza_sales

SELECT pizza_id, total_price,
DENSE_RANK() OVER(ORDER BY total_price DESC) SalesRAG2
FROM pizza_sales

SELECT * FROM (
SELECT pizza_id, total_price, order_id,
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY total_price DESC) ByProduct
FROM pizza_sales
)t
WHERE ByProduct = 1

SELECT * FROM (
SELECT order_id, SUM(total_price) Total,
ROW_NUMBER() OVER(ORDER BY SUM(total_price) ASC) CustRank
FROM pizza_sales
GROUP BY order_id
)t
WHERE CustRank <= 2

SELECT 
ROW_NUMBER() OVER(ORDER BY order_id, order_date) UNIQUEID,
* FROM pizza_sales

SELECT * FROM (
SELECT 
ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_time DESC) rn,
* FROM pizza_sales
)t
WHERE rn > 1

SELECT pizza_id, total_price,
NTILE(1) OVER(ORDER BY total_price DESC) Bucket1,
NTILE(2) OVER(ORDER BY total_price DESC) Bucket2,
NTILE(3) OVER(ORDER BY total_price DESC) Bucket3,
NTILE(4) OVER(ORDER BY total_price DESC) Bucket4
FROM pizza_sales

SELECT *,
CASE WHEN Bucket = 1 THEN 'High'
WHEN Bucket = 2 THEN 'Medium'
WHEN Bucket = 3 THEN 'Low'
END
FROM (
SELECT pizza_id, total_price,
NTILE(3) OVER(ORDER BY total_price DESC) Bucket
FROM pizza_sales
)t

SELECT 
NTILE(2) OVER(ORDER BY pizza_id) Buckets,
* FROM pizza_sales

SELECT pizza_id, order_id, total_price,
CUME_DIST() OVER(PARTITION BY order_id ORDER BY total_price DESC)
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
PERCENT_RANK() OVER(PARTITION BY order_id ORDER BY total_price DESC) PerRank
FROM pizza_sales

USE [Pizza DB]
SELECT * FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LEAD(total_price) OVER(ORDER BY order_id) Lead1
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LEAD(total_price, 3) OVER(ORDER BY order_id) Lead3
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LAG(total_price) OVER(ORDER BY order_id) Lag1
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LAG(total_price, 3) OVER(ORDER BY order_id) Lag3
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LEAD(total_price) OVER(ORDER BY order_id) Lead1,
LAG(total_price) OVER(ORDER BY order_id) Lag1,
LEAD(total_price, 3) OVER(ORDER BY order_id) Lead3,
LAG(total_price, 3) OVER(ORDER BY order_id) Lag3
FROM pizza_sales

SELECT * FROM pizza_sales

SELECT *, CurrentM - PreviousM AS MOM,
ROUND(CAST((CurrentM - PreviousM) AS FLOAT)/PreviousM * 100, 1) AS MOMPercent
FROM (
SELECT MONTH(order_date) order_month,
SUM(total_price) CurrentM,
LAG(SUM(total_price)) OVER(ORDER BY MONTH(order_date)) PreviousM
FROM pizza_sales
GROUP BY MONTH(order_date)
)t

SELECT pizza_id, AVG(DaysUntilNext) AvgDays,
RANK() OVER(ORDER BY AVG(DaysUntilNext) ASC) RankAvg
FROM (
SELECT order_id, pizza_id, order_date AS CurrentOrder,
LEAD(order_date) OVER(PARTITION BY pizza_id ORDER BY order_date) NextOrder,
DATEDIFF(DAY, order_date, LEAD(order_date) OVER(PARTITION BY pizza_id ORDER BY order_date)) DaysUntilNext
FROM pizza_sales
--ORDER BY pizza_id, order_date
)t
GROUP BY pizza_id

SELECT * FROM pizza_sales
SELECT pizza_id, order_id, total_price,
FIRST_VALUE(total_price) OVER(ORDER BY order_id)
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
LAST_VALUE(total_price) OVER(ORDER BY order_id)
FROM pizza_sales

SELECT pizza_id, order_id, total_price,
FIRST_VALUE(total_price) OVER(ORDER BY order_id),
LAST_VALUE(total_price) OVER(ORDER BY order_id)
FROM pizza_sales

SELECT AVG(total_price)
FROM pizza_sales

SELECT total_price
FROM pizza_sales

SELECT * FROM pizza_sales

SELECT *
FROM (
SELECT order_id, total_price, 
AVG(total_price) OVER() AvgPrice
FROM pizza_sales
)t
WHERE total_price > AvgPrice

SELECT * FROM pizza_sales

SELECT *,
RANK() OVER(ORDER BY Total DESC) RankC
FROM (
SELECT order_id, SUM(total_price) Total
FROM pizza_sales
GROUP BY order_id
)t

SELECT * FROM pizza_sales

SELECT pizza_id, pizza_name_id, total_price,
(SELECT COUNT(*) TotalOrders
FROM pizza_sales)t
FROM pizza_sales

USE project
-- Main
SELECT c.*, t.TotalTerritory FROM Data2 c
LEFT JOIN (
SELECT State, COUNT(*) TotalTerritory
FROM Data1
GROUP BY State)t
ON c.State = t.State

USE [Pizza DB]
SELECT * FROM pizza_sales

SELECT pizza_id, total_price
FROM pizza_sales
WHERE total_price > (SELECT AVG(total_price) FROM pizza_sales)

USE project

SELECT State, District, Growth FROM Data1
WHERE Growth IN (SELECT Area_km2 FROM Data2
WHERE State = 'Maharashtra')

SELECT Area_km2 FROM Data2
WHERE State = 'Maharashtra'

USE Zomato
SELECT * FROM goldusers_signup;
SELECT * FROM product;
SELECT * FROM sales;
SELECT * FROM users;

SELECT userid FROM sales
WHERE product_id = 3

SELECT userid, signup_date FROM users
WHERE userid IN (SELECT userid FROM sales
WHERE product_id = 3)

USE project
SELECT * FROM Data2;

SELECT * FROM Data1;

SELECT State, Sex_Ratio, Literacy
FROM Data1
WHERE Sex_Ratio > 600
AND Sex_Ratio > ANY (SELECT Literacy
FROM Data1
WHERE Sex_Ratio < 600);

SELECT Literacy
FROM Data1
WHERE Sex_Ratio < 600;

SELECT State, Sex_Ratio, Literacy
FROM Data1
WHERE Sex_Ratio > 600
AND Sex_Ratio > ALL (SELECT Literacy
FROM Data1
WHERE Sex_Ratio < 600)

USE Zomato
SELECT * FROM goldusers_signup;
SELECT * FROM product;
SELECT * FROM sales;
SELECT * FROM users;

SELECT userid FROM sales
WHERE product_id = 3

SELECT userid, signup_date FROM users u
WHERE EXISTS (SELECT userid FROM sales s
				WHERE product_id = 3 
				AND u.userid = s.userid)

SELECT userid, signup_date FROM users u
WHERE NOT EXISTS (SELECT userid FROM sales s
				WHERE product_id = 3 
				AND u.userid = s.userid)

USE Zomato
-- Total Sales
SELECT * FROM sales;
SELECT * FROM users;
SELECT * FROM goldusers_signup;
SELECT * FROM product;
--Total Sales
WITH CTE_TotalSales AS
(
SELECT userid, SUM(product_id) AS TotalSales
FROM sales
GROUP BY userid
)

--Last Order
, CTE_LastOrder AS
(
SELECT userid, MAX(created_date) LastOrder
FROM sales
GROUP BY userid
)

--Rank Customer
, CTE_CustRank AS
(
SELECT userid, TotalSales, 
RANK() OVER(ORDER BY TotalSales DESC) AS CustRank
FROM CTE_TotalSales
)

--Segment the customer
, CTE_CustSeg AS
(
SELECT userid, 
CASE WHEN TotalSales > 12 THEN 'High'
	WHEN TotalSales > 9 THEN 'Medium'
	ELSE 'Low'
END CustomerSegments
FROM CTE_TotalSales
)

--Main Query
SELECT u.userid, u.signup_date, cts.TotalSales, cts1.LastOrder, cts2.CustRank, cts3.CustomerSegments
FROM users u
LEFT JOIN CTE_TotalSales cts
ON cts.userid = u.userid
LEFT JOIN CTE_LastOrder cts1
ON cts1.userid = u.userid
LEFT JOIN CTE_CustRank cts2
ON cts2.userid = u.userid
LEFT JOIN CTE_CustSeg cts3
ON cts3.userid = u.userid

--Sequence of number from 1 to 20
WITH CTE_Series AS
(
--Anchor
SELECT 1 AS MyNum
UNION ALL
--Recursive
SELECT MyNum+1
FROM CTE_Series
WHERE MyNum < 1000
)

--Main Query
SELECT MyNum FROM CTE_Series
OPTION (MAXRECURSION 1000)

--Employee Hierarchy
USE SharkTank
SELECT * FROM Shark
--Employee Hierarchy
WITH CTE_Employee AS
(
--Anchor Query
SELECT Sector, Location, Idea, 1 AS Level FROM Shark
WHERE Location = 'Delhi'
UNION ALL
--Recursive
SELECT S.Sector, S.Location, S.Idea, Level+1
FROM Shark S
INNER JOIN CTE_Employee cts4
ON S.Sector = cts4.Sector
)

--Main Query
SELECT * FROM CTE_Employee
OPTION (MAXRECURSION 12000)

USE Zomato
SELECT * FROM sales;
SELECT * FROM users;
SELECT * FROM goldusers_signup;
SELECT * FROM product;

WITH CTE_Monthly AS
(
SELECT DATETRUNC(MONTH, created_date) OrderMonth,
SUM(product_id) TotalSales,
COUNT(userid) TotalOrders
FROM sales
GROUP BY DATETRUNC(MONTH, created_date)
)
SELECT OrderMonth, SUM(TotalSales) OVER(ORDER BY OrderMonth) AS RunningTotal
FROM CTE_Monthly

CREATE VIEW VMonthlySumm AS
(
SELECT DATETRUNC(MONTH, created_date) OrderMonth,
SUM(product_id) TotalSales,
COUNT(userid) TotalOrders
FROM sales
GROUP BY DATETRUNC(MONTH, created_date)
)

SELECT * FROM VMonthlySumm

SELECT OrderMonth, SUM(TotalSales) OVER(ORDER BY OrderMonth) AS RunningTotal
FROM VMonthlySumm

DROP VIEW VMonthlySumm

IF OBJECT_ID('VMonthlySumm', 'V') IS NOT NULL
DROP VIEW VMonthlySumm;

GO

CREATE VIEW VMonthlySumm AS
(
SELECT DATETRUNC(MONTH, created_date) OrderMonth,
SUM(product_id) TotalSales,
COUNT(userid) TotalOrders
FROM sales
GROUP BY DATETRUNC(MONTH, created_date)
)

SELECT * FROM sales;
SELECT * FROM users;
SELECT * FROM goldusers_signup;
SELECT * FROM product;

CREATE VIEW V_OrderDetails AS
(
SELECT s.userid, s.created_date, p.product_id, p.product_name, p.price, u.userid, g.gold_signup_date
FROM sales s
LEFT JOIN product p
ON s.product_id = p.product_id
LEFT JOIN users u
ON  s.userid = u.userid
LEFT JOIN goldusers_signup g
ON u.userid = g.userid
)

USE Zomato
SELECT * FROM sales;
SELECT * FROM users;
SELECT * FROM goldusers_signup;
SELECT * FROM product;

IF OBJECT_ID('dbo.MonthlyOrders', 'U') IS NOT NULL
DROP TABLE dbo.MonthlyOrders;

GO

SELECT DATENAME(MONTH, created_date) OrderMonth,
COUNT(userid) TotalOrders
INTO dbo.MonthlyOrders
FROM sales
GROUP BY DATENAME(MONTH, created_date)

SELECT * FROM MonthlyOrders

USE SharkTank
SELECT * FROM Shark

SELECT COUNT(Brand) TotalCompany,
AVG(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = 'Health'

CREATE PROCEDURE GetAmount AS
BEGIN
SELECT COUNT(Brand) TotalCompany,
AVG(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = 'Health'
END
EXEC GetAmount

CREATE PROCEDURE GetFoodAmount AS
BEGIN
SELECT COUNT(Brand) TotalCompany,
AVG(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = 'Food'
END
EXEC GetFoodAmount

ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
SELECT COUNT(Brand) TotalCompany,
AVG(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = @Sector
END
EXEC GetFoodAmount @Sector = 'Food'

DROP PROCEDURE GetAmount

SELECT * FROM Shark

SELECT COUNT(Brand) TotalBrand, 
SUM(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = 'Food'

ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
SELECT COUNT(Brand) TotalCompany,
AVG(AmountInvestedlakhs) TotalAmount
FROM Shark
WHERE Sector = @Sector;

SELECT COUNT(Brand) TotalBrand, 
SUM(AmoutAsked) TotalAmount
FROM Shark
WHERE Sector = @Sector;

END

EXEC GetFoodAmount @Sector = 'Food'

ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN

DECLARE @TotalBrands INT, @AvgAmount FLOAT;

SELECT @TotalBrands = COUNT(Brand),
@AvgAmount = AVG(AmountInvestedlakhs)
FROM Shark
WHERE Sector = @Sector;

PRINT 'Total Brand came from ' + @Sector + ':' + CAST(@TotalBrands AS NVARCHAR);
PRINT 'Average Score from ' + @Sector + ':' + CAST(@AvgAmount AS NVARCHAR);

SELECT COUNT(Brand) TotalBrand, 
SUM(AmoutAsked) TotalAmount
FROM Shark
WHERE Sector = @Sector;

END
GO

EXEC GetFoodAmount @Sector ='Health'


ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN

DECLARE @TotalBrands INT, @AvgAmount FLOAT;

--Cleaning up
IF EXISTS(SELECT 1 FROM Shark WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector)
BEGIN
PRINT 'Updateing null to zero';
UPDATE Shark
SET AmountInvestedlakhs = 0
WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector;
END

ELSE
BEGIN
PRINT 'No nulls'
END;

--Prepare Reports
SELECT @TotalBrands = COUNT(Brand),
@AvgAmount = AVG(AmountInvestedlakhs)
FROM Shark
WHERE Sector = @Sector;

PRINT 'Total Brand came from ' + @Sector + ':' + CAST(@TotalBrands AS NVARCHAR);
PRINT 'Average Score from ' + @Sector + ':' + CAST(@AvgAmount AS NVARCHAR);

SELECT COUNT(Brand) TotalBrand, 
SUM(AmoutAsked) TotalAmount
FROM Shark
WHERE Sector = @Sector;

END
GO

EXEC GetFoodAmount @Sector ='Automobile'


ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
	AS
	BEGIN
		BEGIN TRY

			DECLARE @TotalBrands INT, @AvgAmount FLOAT;

			--Cleaning up
			IF EXISTS(SELECT 1 FROM Shark WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector)
			BEGIN
				PRINT 'Updateing null to zero';
				UPDATE Shark
				SET AmountInvestedlakhs = 0
				WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector;
			END

			ELSE
			BEGIN
				PRINT 'No nulls'
			END;

			--Prepare Reports
			SELECT @TotalBrands = COUNT(Brand),
			@AvgAmount = AVG(AmountInvestedlakhs)
			FROM Shark
			WHERE Sector = @Sector;

			PRINT 'Total Brand came from ' + @Sector + ':' + CAST(@TotalBrands AS NVARCHAR);
			PRINT 'Average Score from ' + @Sector + ':' + CAST(@AvgAmount AS NVARCHAR);

			SELECT COUNT(Brand) TotalBrand, 
			SUM(AmoutAsked) TotalAmount,
			1/0
			FROM Shark
			WHERE Sector = @Sector;

		END TRY

		BEGIN CATCH
		PRINT 'An error occurred';
		PRINT 'Error message ' + ERROR_MESSAGE();
		PRINT 'Error number ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error line ' + CAST(ERROR_LINE() AS NVARCHAR);
		PRINT 'Error Procedure ' + ERROR_PROCEDURE();
		END CATCH
	END
GO

EXEC GetFoodAmount @Sector ='Automobile'