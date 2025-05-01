## 🔗 SQL Joins

SQL Joins allow you to combine data from **two or more tables** based on a related column between them. The main purpose of joins is to recombine data, enrich it with additional information, or check for existence across multiple tables.

### **When to use Joins?**
- **Recombine Data**: Bringing related data together.
- **Data Enrichment**: Adding additional data for analysis.
- **Check for Existence**: Ensuring a specific value or condition is met in a related table.

### **Types of SQL Joins**
- **Inner Join**
- **Left Join**
- **Right Join**
- **Full Join**

### **Types of SQL Set Operators** (For combining results by rows)
- **Union**
- **Union All**
- **Except**
- **Intersect**

---

### 1. 🔑 **Inner Join**
An **Inner Join** returns only the rows where there is a match in both tables. Rows in the tables that don’t have a matching value are **excluded**.

**Syntax:**
```sql
SELECT * FROM A INNER JOIN B ON A.Key = B.Key;
```

**Example:**
```sql
SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data1
INNER JOIN Data2
ON Data1.District = Data2.District;
```
Use an **Inner Join** when you only need matching data between two tables. It’s commonly used for **recombining data** and checking the **existence** of related data in both tables.

---

### 2. 🟢 **Left Join** (Left Outer Join)
A **Left Join** returns **all rows** from the **left table** (table A) and the **matching rows** from the **right table** (table B). If there is no match, **NULL** values are returned for columns from the right table.

**Syntax:**
```sql
SELECT * FROM A LEFT JOIN B ON A.Key = B.Key;
```

**Example:**
```sql
SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population, Data2.Area_km2,
       Data1.Literacy, Data1.Sex_Ratio
FROM Data1
LEFT JOIN Data2
ON Data1.District = Data2.District;
```
Use a **Left Join** when you want to keep all rows from the **left table** and only the matching rows from the **right table**. This is often used for **data enrichment** or **checking existence** with a `WHERE` clause.

---

### 3. 🔴 **Right Join** (Right Outer Join)
A **Right Join** returns **all rows** from the **right table** (table B) and the **matching rows** from the **left table** (table A). If there is no match, **NULL** values are returned for columns from the left table.

**Syntax:**
```sql
SELECT * FROM B RIGHT JOIN A ON A.Key = B.Key;
```

**Example:**
```sql
SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data2
RIGHT JOIN Data1
ON Data1.District = Data2.District;
```
Use a **Right Join** when you want to keep all rows from the **right table** and only the matching rows from the **left table**. It is useful when **the right table is the primary source of data**.

---

### 4. 🟣 **Full Join** (Full Outer Join)
A **Full Join** returns **all rows** from both tables. Where there is no match, **NULL** values are returned for columns from the table without a match.

**Syntax:**
```sql
SELECT * FROM A FULL JOIN B ON A.Key = B.Key;
```

**Example:**
```sql
SELECT Data1.State, Data1.District, Data1.Growth, Data2.Population
FROM Data2
FULL JOIN Data1
ON Data1.District = Data2.District;
```
Use a **Full Join** when you want to retrieve **all data** from both tables, regardless of whether there’s a match. This can be used for **recombining data** or **checking existence** across both tables with a `WHERE` clause.

---

### Recap of When to Use Each Type of Join:
- **Inner Join**: When you need only the matching rows from both tables.
- **Left Join**: When you want all rows from the left table, even if there's no match in the right table.
- **Right Join**: When you want all rows from the right table, even if there's no match in the left table.
- **Full Join**: When you want all rows from both tables, regardless of whether they match.

---
