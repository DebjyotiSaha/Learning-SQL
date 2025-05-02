## 🧩 SQL SET Operators

SET operators are used to **combine results from multiple SELECT queries** into one result set. While **JOINS combine columns**, **SET operators combine rows**.

---

### 🧱 Types of SET Operators

| Operator    | Description                                                     |
| ----------- | --------------------------------------------------------------- |
| `UNION`     | Combines results, removes duplicates                            |
| `UNION ALL` | Combines results, **retains duplicates**                        |
| `EXCEPT`    | Returns rows from the first query **not present** in the second |
| `INTERSECT` | Returns rows that are **common to both** queries                |

---

### 📜 Syntax Example

```sql
SELECT column1, column2 FROM table1
UNION
SELECT column1, column2 FROM table2;
```

---

### ✅ Rules for Using SET Operators

1. **Same number of columns** in both SELECT queries.
2. **Same data types** in corresponding columns.
3. **Same column order**.
4. **Column names in final output are taken from the first SELECT**.
5. **`ORDER BY`** can only appear **once**, at the end of the final query.

---

### ⚠️ Common Mistakes

❌ Incorrect order:

```sql
SELECT FirstName, LastName FROM customers
UNION
SELECT LastName, FirstName FROM orders;  -- Incorrect ordering
```

✅ Corrected:

```sql
SELECT FirstName, LastName FROM customers
UNION
SELECT FirstName, LastName FROM orders;
```

---

### 🔄 `UNION` vs `UNION ALL`

```sql
-- Removes duplicates
SELECT userid, gold_signup_date FROM goldusers_signup
UNION
SELECT userid, created_date FROM sales;

-- Keeps duplicates (faster)
SELECT userid, gold_signup_date FROM goldusers_signup
UNION ALL
SELECT userid, created_date FROM sales;
```

---

### 🚫 `EXCEPT` Operator

```sql
-- Rows in goldusers_signup not in sales
SELECT userid, gold_signup_date FROM goldusers_signup
EXCEPT
SELECT userid, created_date FROM sales;
```

Use Case: **Delta Detection** (to avoid re-inserting duplicate data in data warehouse).

---

### 🔁 `INTERSECT` Operator

```sql
-- Common records in both tables
SELECT userid, gold_signup_date FROM goldusers_signup
INTERSECT
SELECT userid, created_date FROM sales;
```

---

### 📊 Combine Info From Multiple Tables

```sql
-- DO NOT use * (SELECT *) in SET operations
SELECT userid, created_date FROM sales
UNION
SELECT userid, signup_date FROM users;
```

💡 Always **explicitly name columns** to prevent schema mismatch issues.

---

### ✅ Best Practices

* Use **column aliases** for clarity.
* Track **source tables** when combining.
* Avoid `SELECT *` – schema changes might break or mislead results.
* Use `EXCEPT` in **data completeness** or **migration validation**.

---

### 🧪 Example Use Case: Data Completeness Check

To validate two databases after migration:

```sql
-- Check if all rows from DB_A exist in DB_B
SELECT * FROM DB_A.table
EXCEPT
SELECT * FROM DB_B.table;

-- Check in the reverse direction
SELECT * FROM DB_B.table
EXCEPT
SELECT * FROM DB_A.table;
```

If both return **no results**, the data sets are complete and matched.

---
