
## 📄 SQL Views

### 🔍 **What is a View?**

A **View** in SQL is a **virtual table** that is based on the result of a SQL query. It **does not store data physically**; instead, it provides a **layered abstraction** over the underlying base tables.

---

### 🏗️ **3-Level Database Architecture and Views**

| Level              | Description                         | Access                              |
| ------------------ | ----------------------------------- | ----------------------------------- |
| **Physical Level** | Raw data storage in disk            | DBA (Database Administrator)        |
| **Logical Level**  | Logical schema, relationships       | Data Engineers                      |
| **View Level**     | Simplified access for various users | Analysts, Business Users, End Users |

---

### 🛠️ **Syntax: Create a View**

```sql
CREATE VIEW ViewName AS
SELECT column1, column2
FROM table
WHERE condition;
```

---

### 📘 **Example Use Case: Monthly Summary View**

#### Step 1: CTE-Based Summary Query

```sql
WITH CTE_Monthly AS (
  SELECT 
    DATETRUNC(MONTH, created_date) AS OrderMonth,
    SUM(product_id) AS TotalSales,
    COUNT(userid) AS TotalOrders
  FROM sales
  GROUP BY DATETRUNC(MONTH, created_date)
)
SELECT 
  OrderMonth, 
  SUM(TotalSales) OVER(ORDER BY OrderMonth) AS RunningTotal
FROM CTE_Monthly;
```

#### Step 2: Convert to a View

```sql
CREATE VIEW VMonthlySumm AS
SELECT 
  DATETRUNC(MONTH, created_date) AS OrderMonth,
  SUM(product_id) AS TotalSales,
  COUNT(userid) AS TotalOrders
FROM sales
GROUP BY DATETRUNC(MONTH, created_date);
```

#### Step 3: Use the View

```sql
SELECT * FROM VMonthlySumm;

SELECT 
  OrderMonth, 
  SUM(TotalSales) OVER(ORDER BY OrderMonth) AS RunningTotal
FROM VMonthlySumm;
```

---

### ❌ **Drop a View Safely**

```sql
IF OBJECT_ID('VMonthlySumm', 'V') IS NOT NULL
  DROP VIEW VMonthlySumm;
GO
```

---

### 📊 **Another Use Case: Order Details View**

```sql
CREATE VIEW V_OrderDetails AS
SELECT 
  s.userid,
  s.created_date,
  p.product_id,
  p.product_name,
  p.price,
  g.gold_signup_date
FROM sales s
LEFT JOIN product p ON s.product_id = p.product_id
LEFT JOIN users u ON s.userid = u.userid
LEFT JOIN goldusers_signup g ON u.userid = g.userid;
```

---

## ✅ **Advantages of Using Views**

| Feature              | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| **Security**         | Limit access to specific rows/columns (e.g., by country)     |
| **Simplification**   | Hide complex joins and logic from end users                  |
| **Flexibility**      | Reuse logic without repeating the full query                 |
| **Maintainability**  | Update logic centrally in one place                          |
| **Data Abstraction** | Create different logical representations for different roles |

---

## 🛡️ **Security Use Case**

You can create **region-specific views** to ensure data privacy:

```sql
CREATE VIEW V_SalesIndia AS
SELECT * FROM sales
WHERE country = 'India';
```

## ✅ **Use Cases of SQL Views**

SQL Views are powerful tools for data abstraction, security, and reusability. Below are key real-world use cases where views can significantly improve database operations:

---

### 1. 🧠 **Centralized Business Logic**

* **Purpose**: Encapsulate complex joins, aggregations, and business rules into a reusable object.
* **Benefit**: Prevents code duplication and ensures consistency across multiple reports and users.
* **Example**: A view that calculates monthly recurring revenue using multiple tables and business-specific filters.

---

### 2. 🎯 **Simplify Complexity for End Users**

* **Purpose**: Provide a user-friendly interface by abstracting the underlying table structure and joins.
* **Benefit**: Business analysts or non-technical users can query clean, ready-to-use views instead of raw tables.
* **Example**: A view that combines user, product, and sales data into a single flat structure.

---

### 3. 🔐 **Data Security**

* **Purpose**: Restrict access to sensitive information by exposing only relevant data.
* **Benefit**: Enforce row-level or column-level security.
* **Examples**:

  * Exclude salary or personal data.
  * Create region-specific views (e.g., sales data for India only).

---

### 4. 🧩 **Flexible and Dynamic Reporting**

* **Purpose**: Allow reports and dashboards to rely on standardized view definitions.
* **Benefit**: Updating the view automatically updates all dependent reports.
* **Example**: A view that adjusts to new business rules without changing front-end queries.

---

### 5. 🌐 **Multi-Language and Multi-Region Support**

* **Purpose**: Provide localized versions of data views.
* **Benefit**: Serve users in different languages or regional formats without modifying the underlying tables.
* **Example**: Views showing product names and descriptions in multiple languages.

---

### 6. 🏗️ **Virtual Layers in Data Warehouses (Data Marts)**

* **Purpose**: Create logical, domain-specific layers like "Marketing View", "Finance View", etc.
* **Benefit**: Decouple data modeling from physical storage and support modular data architecture.
* **Example**: A "Customer\_360\_View" combining all relevant customer data from multiple source systems.

---
