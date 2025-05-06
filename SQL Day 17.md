
## 🧩 **NULL vs Empty String vs Blank Space**

| Property           | **NULL**                | **Empty String (`''`)**       | **Blank Space (`' '` or `'   '`)** |
| ------------------ | ----------------------- | ----------------------------- | ---------------------------------- |
| **Meaning**        | Unknown / Missing value | Known but intentionally empty | Known value with space(s)          |
| **Representation** | `NULL`                  | `''`                          | `' '` (1+ spaces)                  |
| **Data Type**      | Special Marker          | String (length = 0)           | String (length ≥ 1)                |
| **Storage**        | Minimal / Efficient     | Takes memory                  | Takes memory for each space        |
| **Performance**    | Best                    | Fast                          | Slowest                            |
| **Comparison**     | `IS NULL`               | `= ''`                        | `= ' '`                            |

---

## 🛡️ **SQL Data Cleaning & Policies**

### ✅ **Best Practices**

| Policy # | Strategy                                                   | SQL Function             |
| -------- | ---------------------------------------------------------- | ------------------------ |
| 1️⃣      | Allow `NULL` and `''`, but avoid `' '` (blank spaces)      | Use `TRIM()`             |
| 2️⃣      | Use only `NULL` — treat `''` and `' '` as NULL             | Use `NULLIF(TRIM(), '')` |
| 3️⃣      | Replace all with a default value like `'unknown'`          | Use `COALESCE()`         |
| 4️⃣      | Combine `NULLIF` + `TRIM` + `COALESCE` for robust cleaning | See example below        |

---

### 🔍 **Example Query:**

```sql
WITH Orders AS (
  SELECT 1 AS Id, 'A' AS Category UNION
  SELECT 2, NULL UNION
  SELECT 3, '' UNION
  SELECT 4, ' ' 
)
SELECT 
  *,
  DATALENGTH(Category) AS CategoryLen,
  DATALENGTH(TRIM(Category)) AS Policy1,                         -- TRIM blank spaces
  NULLIF(TRIM(Category), '') AS Policy2,                         -- Convert '' and ' ' to NULL
  COALESCE(Category, 'unknown') AS Policy3,                      -- Replace NULL with 'unknown'
  COALESCE(NULLIF(TRIM(Category), ''), 'unknown') AS Policy3Again -- Cleanest result
FROM Orders;
```

---

### 🧼 **Conclusion**

* Use **`TRIM()`** to remove unwanted spaces.
* Use **`NULLIF(..., '')`** to normalize empty strings/blanks as NULL.
* Use **`COALESCE(..., 'unknown')`** to set safe default values.
