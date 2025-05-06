
## 🎯 **SQL `CASE` Statement**

The `CASE` statement allows conditional logic inside SQL queries, similar to `IF...ELSE` in other languages.

### ✅ **Syntax:**

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END
```

---

## 📌 **Use Cases**

### 1️⃣ **Categorising Data**

**Purpose**: Group numeric data into categories like "HIGH", "MEDIUM", "LOW".

```sql
SELECT 
  Category,
  SUM(total_price) AS Total
FROM (
  SELECT 
    order_id,
    total_price,
    CASE
      WHEN total_price > 20 THEN 'HIGH'
      WHEN total_price > 10 THEN 'MEDIUM'
      ELSE 'LOW'
    END AS Category
  FROM pizza_sales
) t
GROUP BY Category
ORDER BY Total DESC;
```

> ⚠️ *All results returned from `CASE` must be of the same or compatible data type.*

---

### 2️⃣ **Mapping Values**

**Purpose**: Convert codes or short values into more meaningful descriptions.

```sql
SELECT
  EmployeeID,
  FirstName,
  LastName,
  Gender,
  CASE
    WHEN Gender = 'F' THEN 'Female'
    WHEN Gender = 'M' THEN 'Male'
    ELSE 'Not Available'
  END AS GenderFullText
FROM Sales;
```

---

### 3️⃣ **Handling NULLs**

**Purpose**: Substitute NULLs with a default value (like 0).

```sql
SELECT
  CustomerID,
  Scores,
  CASE 
    WHEN Scores IS NULL THEN 0
    ELSE Scores
  END AS ScoreClean,
  AVG(Scores) OVER() AS AvgCust
FROM Sales;
```

---

### 4️⃣ **Conditional Aggregation**

**Purpose**: Apply aggregation (like `SUM`, `COUNT`) only for rows meeting a condition.

#### a) Flagging:

```sql
SELECT
  OrderID,
  CustomerID,
  Sales,
  CASE
    WHEN Sales > 30 THEN 1
    ELSE 0
  END AS SalesFlag
FROM Sales
ORDER BY CustomerID;
```

#### b) Grouping and Summing:

```sql
SELECT
  CustomerID,
  SUM(CASE
    WHEN Sales > 30 THEN 1
    ELSE 0
  END) AS TotalOrders
FROM Sales
GROUP BY CustomerID;
```

---
