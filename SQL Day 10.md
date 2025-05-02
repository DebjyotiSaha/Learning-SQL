
## 🔧 SQL Functions

**Definition:**
A SQL function is a built-in method that **takes input**, **processes it**, and **returns an output**.

---

### 📂 Categories of SQL Functions

#### 1. **Single Row Functions** (aka Scalar Functions)

* Operate **on each row individually**.
* Often used for **data preparation**.
* Types:

  * **String functions** (e.g., `UPPER()`, `LOWER()`, `SUBSTRING()`)
  * **Numeric functions** (e.g., `ROUND()`, `ABS()`, `CEILING()`)
  * **Date & Time functions** (e.g., `GETDATE()`, `DATEADD()`, `DATEDIFF()`)
  * **NULL-related functions** (e.g., `ISNULL()`, `COALESCE()`)

#### 2. **Multi Row Functions**

Used to **analyze** or **summarize data** across multiple rows.

* **Aggregate Functions**: `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()`
* **Window Functions**: `ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`, `OVER(PARTITION BY ...)`

---

### 🔁 Nested Functions

* You can nest one function **inside another**.
* **Execution order**: Innermost function first.

Example:

```sql
-- Start with 'Maria'
SELECT LEN(LOWER(LEFT('Maria', 2))) AS result;
-- LEFT('Maria', 2) = 'Ma'
-- LOWER('Ma') = 'ma'
-- LEN('ma') = 2
```

---
