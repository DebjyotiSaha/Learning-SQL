
## 🔍 SQL Advanced Joins

Advanced joins help extract non-obvious insights, especially for **existence checks** and **relationship analysis** between tables. These include anti joins and cross joins.

---

### 1. ❌ **LEFT Anti Join**

Returns rows from the **left table** that **do not have matching rows** in the right table. Often used to find **unmatched or orphan records**.

**Simulated Syntax (No direct keyword in SQL):**
```sql
SELECT *
FROM A
LEFT JOIN B ON A.Key = B.Key
WHERE B.Key IS NULL;
```

**Example:**
```sql
SELECT *
FROM Data1
LEFT JOIN Data2 ON Data1.District = Data2.District
WHERE Data2.District IS NULL;
```

🧠 **Use Case:** Check which districts in `Data1` are **not present** in `Data2`.

---

### 2. ❌ **RIGHT Anti Join**

Returns rows from the **right table** that **do not have matching rows** in the left table.

**Simulated Syntax:**
```sql
SELECT *
FROM A
RIGHT JOIN B ON A.Key = B.Key
WHERE A.Key IS NULL;
```

**Example:**
```sql
SELECT *
FROM Data1
RIGHT JOIN Data2 ON Data1.District = Data2.District
WHERE Data1.District IS NULL;
```

🧠 **Use Case:** Find which districts in `Data2` are **not listed** in `Data1`.

---

### 3. ❌ **FULL Anti Join**

Returns only the rows that **do not match** in **either table**. Combines the results of both left and right anti joins.

**Simulated Syntax:**
```sql
SELECT *
FROM A
FULL JOIN B ON A.Key = B.Key
WHERE A.Key IS NULL OR B.Key IS NULL;
```

**Example:**
```sql
SELECT *
FROM Data1
FULL JOIN Data2 ON Data1.District = Data2.District
WHERE Data1.District IS NULL
   OR Data2.District IS NULL;
```

🧠 **Use Case:** Identify **non-overlapping** records in both tables.

---

### 4. 🔄 **INNER JOIN Using LEFT JOIN + Filter**

An **INNER JOIN** can be simulated using a `LEFT JOIN` followed by a `WHERE` clause to filter only matching rows.

**Example:**
```sql
SELECT *
FROM Data1
LEFT JOIN Data2 ON Data1.District = Data2.District
WHERE Data2.District IS NOT NULL;
```

🧠 **Why use this?** It can be useful in **conditional joins** when combining logic dynamically.

---

### 5. 🔁 **CROSS JOIN**

A **CROSS JOIN** returns the **Cartesian product** of two tables. Every row from the first table is combined with **every row** from the second table.

**Syntax:**
```sql
SELECT * FROM A CROSS JOIN B;
```

**Example:**
```sql
SELECT *
FROM Data1
CROSS JOIN Data2;
```

🧠 **Use Case:** Generating combinations (e.g., all possible product-user or date-region pairings).

⚠️ **Note:** If `Data1` has 10 rows and `Data2` has 5, the result will have **10 × 5 = 50 rows**.

---

## Summary Table:

| Join Type         | Returns                                               | Use Case                              |
|------------------|--------------------------------------------------------|----------------------------------------|
| Inner Join        | Only matching rows from both tables                   | Combine related data                   |
| Left Anti Join    | Rows in left **not** matched in right                 | Orphan data in left                    |
| Right Anti Join   | Rows in right **not** matched in left                 | Orphan data in right                   |
| Full Anti Join    | Non-matching rows from both tables                    | Find discrepancies                     |
| Cross Join        | Every combination of rows from both tables            | All possible pairings                  |

---
