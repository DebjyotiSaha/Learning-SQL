
## 🔍 **Subqueries in SQL – A Practical Overview**

### 🧠 **Definition:**

A **subquery** is a query nested inside another SQL query — used to **filter, transform, or join** data inline.

---

## 🧰 **When to Use Subqueries**

Use subqueries when:

* You need to **calculate or filter** based on **aggregated** or **intermediate** results
* You want to **compare row values** to other dynamic data (like averages, ranks, etc.)
* You prefer **compact, readable queries** over joins (though joins can sometimes be more performant)

---

## 📂 **Subquery Categories**

### 1️⃣ **By Result Type**

| Type       | Description                               | Example                                                                   |
| ---------- | ----------------------------------------- | ------------------------------------------------------------------------- |
| **Scalar** | Returns a single value                    | `SELECT AVG(price) FROM pizza_sales`                                      |
| **Row**    | Returns one row (can be multiple columns) | `SELECT total_price FROM pizza_sales WHERE order_id = 1`                  |
| **Table**  | Returns a full result set                 | `SELECT * FROM (SELECT * FROM pizza_sales WHERE total_price > 1000) AS t` |

---

### 2️⃣ **By Location of Use**

#### 🔹 **FROM Clause**

Use when you want to treat a query result as a **virtual table**.

```sql
SELECT * FROM (
  SELECT order_id, total_price,
         AVG(total_price) OVER () AS AvgPrice
  FROM pizza_sales
) t
WHERE total_price > AvgPrice;
```

#### 🔹 **SELECT Clause**

Use when you want to **add derived columns** (often aggregates or lookups).

```sql
SELECT pizza_id, total_price,
  (SELECT COUNT(*) FROM pizza_sales) AS TotalOrders
FROM pizza_sales;
```

#### 🔹 **WHERE Clause**

Use when filtering based on **aggregates or dynamic values**.

```sql
SELECT pizza_id, total_price
FROM pizza_sales
WHERE total_price > (
  SELECT AVG(total_price) FROM pizza_sales
);
```

#### 🔹 **JOIN Clause**

Use when you want to **join a summarized dataset** to the base data.

```sql
SELECT c.*, t.TotalTerritory
FROM Data2 c
LEFT JOIN (
  SELECT State, COUNT(*) AS TotalTerritory
  FROM Data1
  GROUP BY State
) t ON c.State = t.State;
```

---

## 🧮 **Operators Used With Subqueries**

### 🔸 `IN`

Filters where a value exists in the subquery result.

```sql
SELECT userid, signup_date
FROM users
WHERE userid IN (
  SELECT userid FROM sales WHERE product_id = 3
);
```

### 🔸 `EXISTS`

Checks whether **any** row is returned from the subquery.

```sql
SELECT userid, signup_date
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM sales s
  WHERE product_id = 3 AND u.userid = s.userid
);
```

### 🔸 `ANY` / `ALL`

Compare value to **any or all** of the values returned by subquery.

```sql
SELECT State, Sex_Ratio, Literacy
FROM Data1
WHERE Sex_Ratio > 600
AND Sex_Ratio > ANY (
  SELECT Literacy FROM Data1 WHERE Sex_Ratio < 600
);
```

---

## ✅ **Best Practices**

* **Avoid deeply nested subqueries** where joins or CTEs improve clarity/performance.
* **Use indexes** on columns involved in subqueries.
* **Label subquery aliases** when used in `FROM` clause.
* **EXISTS** is usually more efficient than `IN` for large datasets.
* Prefer **JOINs or CTEs** when reusing the same subquery multiple times.

---
