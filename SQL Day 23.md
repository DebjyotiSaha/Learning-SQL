
## ✅ **5 Smart SQL Techniques to Include in Any Project**

### 1️⃣ **CTEs (Common Table Expressions)**

> Solve: Readability, Reusability, Maintainability

**What:** A temporary result set you can reference in a query.
**Why:** Makes complex queries modular, readable, and debuggable.

```sql
WITH Sales_CTE AS (
  SELECT pizza_id, SUM(total_price) AS total_sales
  FROM pizza_sales
  GROUP BY pizza_id
)
SELECT * FROM Sales_CTE WHERE total_sales > 500;
```

📌 Use it when:

* You have **step-wise transformations**
* You want to **break down a large query into blocks**
* Writing **recursive queries**

---

### 2️⃣ **Views**

> Solve: Code Redundancy, Security, Central Logic Management

**What:** A virtual table representing a saved SQL query.
**Why:** Keeps logic centralized so changes don’t need to be made in multiple scripts.

```sql
CREATE VIEW high_value_orders AS
SELECT order_id, customer_id, total_price
FROM orders
WHERE total_price > 1000;
```

📌 Use it when:

* Multiple teams need the same data logic
* You want to **limit exposure** to raw tables
* Applying **row-level security** on top of views

---

### 3️⃣ **CTAS (Create Table As Select)**

> Solve: Performance, Snapshots, Feature Engineering

**What:** Creates a new table from the result of a query.
**Why:** Materializes the result for reuse in complex pipelines or ETL workflows.

```sql
CREATE TABLE sales_snapshot AS
SELECT customer_id, SUM(total_price) AS total_spent
FROM pizza_sales
GROUP BY customer_id;
```

📌 Use it when:

* You want to **save intermediate results**
* Building **ETL pipelines**
* Need **performance optimization** in reporting

---

### 4️⃣ **Temp Tables**

> Solve: Heavy Joins, Large Intermediates, ETL Staging

**What:** Temporary table created during the session.
**Why:** Helps organize data across multiple steps, especially in staging or multi-step logic.

```sql
CREATE TEMP TABLE temp_orders AS
SELECT * FROM orders WHERE order_date >= '2024-01-01';
```

📌 Use it when:

* You have **step-wise processing** of large data
* You want to **decouple** logic
* Running **multi-step transformations in ETL**

---

### 5️⃣ **Subqueries (Especially Correlated)**

> Solve: Inline Logic, Filtering, Row-by-row Comparison

**What:** A query inside another query, usually in `SELECT`, `FROM`, or `WHERE`.

```sql
SELECT customer_id, total_price
FROM orders
WHERE total_price > (
  SELECT AVG(total_price) FROM orders
);
```

📌 Use it when:

* You need **comparisons relative to aggregate values**
* Creating **derived columns inline**
* Writing **dynamic filters**

---

## 🔁 Summary Table

| Technique   | Benefit                            | Best For                                |
| ----------- | ---------------------------------- | --------------------------------------- |
| CTE         | Modular code, recursion            | Complex queries, step-by-step analysis  |
| Views       | Reusability, abstraction, security | Shared logic, limited access            |
| CTAS        | Materialization, performance       | ETL staging, snapshots, feature tables  |
| Temp Tables | Intermediate storage, performance  | Large workflows, debugging, batch logic |
| Subqueries  | Inline computation                 | Filtering, conditional logic            |

---

## 💡 Pro Tip: Combine These!

* Use **CTEs** inside **CTAS**
* Use **Temp tables** as part of **multi-stage transformations**
* Use **Views** to encapsulate logic you build with **CTEs**

---
