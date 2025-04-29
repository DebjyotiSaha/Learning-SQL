
## 🧾 What is an SQL Query?
An **SQL query** is a command used to request specific data from a database.  
For example, if you have a database table and need to retrieve or analyze certain information, SQL is the language that helps you do that efficiently.

---

## 🔹 SQL Clauses Explained

### 1. **SELECT Clause**  
Used to specify which columns you want to retrieve.

- `SELECT *`: Retrieves **all columns**.  
  ```sql
  SELECT * FROM Data1;
  SELECT * FROM Data2;
  ```

- `SELECT Col1, Col2`: Retrieves only **specific columns**.  
  ```sql
  SELECT District, Growth, Literacy FROM Data1;
  ```

---

### 2. **WHERE Clause**  
Filters rows based on a condition.

```sql
SELECT * FROM Data1 WHERE Sex_Ratio != 900;
SELECT * FROM Data1 WHERE State = 'Maharashtra';
SELECT District, State FROM Data1 WHERE State = 'Maharashtra';
```

---

### 3. **ORDER BY Clause**  
Sorts the results by one or more columns, either **ascending (ASC)** or **descending (DESC)**.

```sql
SELECT * FROM Data1 ORDER BY Literacy DESC;
SELECT * FROM Data1 ORDER BY Literacy ASC;
```

**Nested ORDER BY** – For multiple sort levels:  
```sql
SELECT * FROM Data1 ORDER BY District DESC, Literacy ASC;
```

---

### 4. **GROUP BY Clause**  
Groups rows with the same values in specified columns and allows aggregation (e.g., `SUM`, `AVG`, `COUNT`).

```sql
SELECT State, SUM(Sex_Ratio) AS Total_Score FROM Data1 GROUP BY State;

SELECT State, SUM(Sex_Ratio) AS Total_Score, COUNT(State) AS Total_Appearance
FROM Data1
GROUP BY State;
```

---

### 5. **HAVING Clause**  
Filters groups after aggregation. Must be used **after GROUP BY**.

```sql
SELECT State, AVG(Sex_Ratio)
FROM Data1
WHERE Sex_Ratio != 0
GROUP BY State
HAVING AVG(Sex_Ratio) > 900;
```

**Tip:**  
- `WHERE` filters **before** aggregation.  
- `HAVING` filters **after** aggregation.

---

### 6. **DISTINCT Clause**  
Removes duplicate rows from the result.

```sql
SELECT DISTINCT State FROM Data1;
```

---

### 7. **TOP Clause**  
Limits the number of rows returned.

```sql
SELECT TOP 3 * FROM Data1;

SELECT TOP 3 * FROM Data1 ORDER BY Sex_Ratio DESC;
```

---

## 🔁 SQL: Coding Order vs Execution Order

**Coding Order (How You Write It):**
```sql
SELECT DISTINCT TOP 2
    Col1,
    Col2
FROM Table
WHERE Col = 10
GROUP BY Col1
HAVING SUM(Col2) > 30
ORDER BY Col1 ASC;
```

**Execution Order (How SQL Processes It):**
1. `FROM`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `DISTINCT`
7. `ORDER BY`
8. `TOP`

---

## 🧠 Quick Reference: When to Use What

| Task                             | SQL Clause       |
|----------------------------------|------------------|
| Choose specific columns          | `SELECT`         |
| Remove duplicates                | `DISTINCT`       |
| Limit number of rows             | `TOP`            |
| Filter rows before aggregation   | `WHERE`          |
| Filter rows after aggregation    | `HAVING`         |
| Sort rows                        | `ORDER BY`       |
| Group similar rows               | `GROUP BY`       |

---

