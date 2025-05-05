
## 🕳️ **Understanding NULL in SQL**

---

### 🔸 **What is NULL?**

* Represents **missing**, **unknown**, or **not provided** values.
* Common in forms where fields are left blank.
* **NULL ≠ 0**, **NULL ≠ '' (empty string)** — it is a distinct marker.

---

### 🔸 **🔍 Checking for NULLs**

#### ✅ `IS NULL` / `IS NOT NULL`

Used in filtering to find records with or without NULL values.

```sql
SELECT * FROM orders
WHERE ShippingAddress IS NULL;

SELECT * FROM orders
WHERE ShippingAddress IS NOT NULL;
```

---

### 🔸 **🔁 Replacing NULLs**

#### ✅ `ISNULL()`

Replaces `NULL` with a specified value (works only with 2 arguments).

```sql
ISNULL(ShippingAddress, BillingAddress)
```

#### ✅ `COALESCE()`

Returns the **first non-NULL** value from a list of arguments.

```sql
COALESCE(ShippingAddress, BillingAddress, 'Unknown')
```

> 📝 Use `COALESCE()` when you need to evaluate **multiple fallback options**.

---

### 🔸 **🧮 Data Aggregation & Calculations**

Always handle NULLs before performing **math or aggregations**:

```sql
SELECT order_id, total_price,
       AVG(total_price) OVER () AS AvgRaw,
       AVG(COALESCE(total_price, 0)) OVER () AS AvgHandled
FROM pizza_sales;
```

```sql
SELECT
  pizza_name_id,
  pizza_category,
  COALESCE(pizza_category, '') AS CleanCategory,
  pizza_name_id + ' ' + COALESCE(pizza_category, '') AS FullName,
  COALESCE(total_price, 0) + 10 AS Bonus
FROM pizza_sales;
```

---

### 🔸 **⚙️ NULL in JOINs**

Handle NULLs when comparing nullable columns:

```sql
SELECT A.YEAR, A.TYPE, A.ORDERS, B.SALES
FROM Table1 A
JOIN Table2 B
  ON A.YEAR = B.YEAR
  AND ISNULL(A.TYPE, '') = ISNULL(B.TYPE, '');
```

---

### 🔸 **📊 NULL in Sorting**

Sorts can be misleading if NULLs are not accounted for—use `ISNULL` or `COALESCE` to substitute.

```sql
ORDER BY ISNULL(sales, 0) DESC
```

---

### 🔸 **🚫 NULLIF() – Handling Invalid Values**

Returns `NULL` if both values are equal.

#### ✅ Use Case: Prevent divide-by-zero errors

```sql
SELECT Price / NULLIF(Quantity, 0) AS UnitPrice
FROM products;
```

---
