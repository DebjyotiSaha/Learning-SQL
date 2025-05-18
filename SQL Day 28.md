## 🧪 **Temporary Tables (Temp Tables)**

### 🔍 **What are Temp Tables?**

Temporary tables are **intermediate storage tables** used to **hold data temporarily** during session-level operations like data transformation, debugging, or performance tuning.

* Stored in **tempdb** (temporary database)
* Automatically **deleted** when the session ends or when explicitly dropped
* Useful in **ETL**, **complex joins**, or **staging logic**

---

### 🛠️ **Syntax**

```sql
-- Create and insert in one step
SELECT column1, column2, ...
INTO #TempTable
FROM original_table
WHERE condition;
```

```sql
-- Or explicitly define and then insert
CREATE TABLE #TempTable (
    id INT,
    name VARCHAR(100)
);

INSERT INTO #TempTable
SELECT id, name FROM users WHERE signup_date > '2024-01-01';
```

---

### 🧾 **Types of Temp Tables**

| Type       | Scope        | Symbol | Behavior                                    |
| ---------- | ------------ | ------ | ------------------------------------------- |
| **Local**  | Session only | `#`    | Only visible to the session that created it |
| **Global** | All sessions | `##`   | Visible to all users until the session ends |

---

### ✅ **Use Cases**

* **Break down complex queries** into manageable chunks
* **Improve performance** by reusing intermediate results
* **Staging layer** during ETL workflows
* Store **filtered or transformed** data temporarily for downstream queries
* Handle **looping logic** or conditional processing in stored procedures

---

### 💡 **Example**

```sql
-- Step 1: Create temp table
SELECT userid, product_id, created_date
INTO #RecentSales
FROM sales
WHERE created_date >= DATEADD(DAY, -30, GETDATE());

-- Step 2: Use it in further logic
SELECT userid, COUNT(product_id) AS PurchaseCount
FROM #RecentSales
GROUP BY userid;

-- Optional: Drop it manually (optional as SQL auto-cleans)
DROP TABLE #RecentSales;
```

---

### ⚠️ **Notes**

* Use indexes on temp tables for large data sets (if performance drops)
* Avoid overusing temp tables unnecessarily — may increase tempdb I/O
* You can reference them multiple times within the same batch or session

---
