
## 🧾 **CTEs (Common Table Expressions) in SQL**

### 🧠 **What is a CTE?**

A **CTE** is a temporary, named result set defined using the `WITH` clause, used to **organize complex queries**, **improve readability**, and **enable modular development**.

---

## ✅ **Why Use a CTE?**

| Benefit         | Description                                       |
| --------------- | ------------------------------------------------- |
| **Efficiency**  | Reduces redundant calculations in complex queries |
| **Readability** | Makes long queries easier to understand           |
| **Modularity**  | Breaks down logic into smaller, logical chunks    |
| **Reusability** | Refer the same intermediate result multiple times |

---

## 🔧 **CTE Syntax**

```sql
WITH CTE_Name AS (
  SELECT column1, column2
  FROM table
  WHERE condition
)
SELECT * FROM CTE_Name;
```

---

## 🔄 **Types of CTEs**

### 1️⃣ **Standalone / Simple CTE**

Used to prepare one result set for main query.

```sql
WITH CTE_TotalSales AS (
  SELECT userid, SUM(product_id) AS TotalSales
  FROM sales
  GROUP BY userid
)
SELECT u.userid, u.signup_date, cts.TotalSales
FROM users u
LEFT JOIN CTE_TotalSales cts ON cts.userid = u.userid;
```

---

### 2️⃣ **Multiple CTEs**

Chain multiple logical stages using commas.

```sql
WITH CTE_TotalSales AS (
  SELECT userid, SUM(product_id) AS TotalSales
  FROM sales
  GROUP BY userid
),
CTE_LastOrder AS (
  SELECT userid, MAX(created_date) AS LastOrder
  FROM sales
  GROUP BY userid
)
SELECT u.userid, u.signup_date, cts.TotalSales, clo.LastOrder
FROM users u
LEFT JOIN CTE_TotalSales cts ON cts.userid = u.userid
LEFT JOIN CTE_LastOrder clo ON clo.userid = u.userid;
```

---

### 3️⃣ **Nested CTEs (Building on Previous CTEs)**

Break complex logic into sequential steps.

```sql
WITH
CTE_TotalSales AS (
  SELECT userid, SUM(product_id) AS TotalSales
  FROM sales
  GROUP BY userid
),
CTE_CustRank AS (
  SELECT userid, TotalSales,
         RANK() OVER(ORDER BY TotalSales DESC) AS CustRank
  FROM CTE_TotalSales
),
CTE_CustSeg AS (
  SELECT userid,
         CASE
           WHEN TotalSales > 12 THEN 'High'
           WHEN TotalSales > 9 THEN 'Medium'
           ELSE 'Low'
         END AS CustomerSegment
  FROM CTE_TotalSales
)
SELECT u.userid, u.signup_date, t.TotalSales, r.CustRank, s.CustomerSegment
FROM users u
LEFT JOIN CTE_TotalSales t ON u.userid = t.userid
LEFT JOIN CTE_CustRank r ON u.userid = r.userid
LEFT JOIN CTE_CustSeg s ON u.userid = s.userid;
```

---

### 4️⃣ **Recursive CTE**

Used for hierarchical or sequential data, like org charts or number sequences.

#### 🔹 **Generate Numbers from 1 to 1000**

```sql
WITH CTE_Series AS (
  SELECT 1 AS MyNum
  UNION ALL
  SELECT MyNum + 1
  FROM CTE_Series
  WHERE MyNum < 1000
)
SELECT MyNum FROM CTE_Series
OPTION (MAXRECURSION 1000);
```

#### 🔹 **Example: Hierarchical Query**

```sql
WITH CTE_Employee AS (
  SELECT Brand, Location, Idea, 1 AS Level
  FROM Shark
  WHERE Location = 'Delhi'

  UNION ALL

  SELECT s.Brand, s.Location, s.Idea, e.Level + 1
  FROM Shark s
  INNER JOIN CTE_Employee e ON s.Location = e.Location
)
SELECT * FROM CTE_Employee
OPTION (MAXRECURSION 12000);
```

---

## 🛡️ **Best Practices**

* Always **name** CTEs clearly based on their purpose.
* Use **CTEs instead of subqueries** when the logic is reused or gets complex.
* Avoid **excessive nesting** — consider breaking logic into fewer steps if possible.
* Use `OPTION (MAXRECURSION n)` for **recursive CTEs** to avoid infinite loops.
* In performance-critical environments, benchmark **CTE vs Temp Tables** or **Indexes**.

---
