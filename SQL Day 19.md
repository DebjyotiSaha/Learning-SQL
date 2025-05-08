
## 🪟 **SQL Window Functions**

Window functions perform calculations **across a set of rows related to the current row**, **without collapsing** the rows like `GROUP BY` does.

---

### 🆚 **Window Functions vs GROUP BY**

| Feature       | `GROUP BY`              | `WINDOW FUNCTIONS`                       |
| ------------- | ----------------------- | ---------------------------------------- |
| Purpose       | Aggregate entire groups | Analytical calculations per row          |
| Output Detail | One row per group       | All original rows preserved              |
| Functions     | SUM, COUNT, AVG, etc.   | SUM, COUNT, AVG, RANK, ROW\_NUMBER, etc. |
| Example       | Sales by pizza          | Running total per pizza                  |

---

## 📘 **Syntax**

```sql
<Window Function> OVER (
  [PARTITION BY col]
  [ORDER BY col]
  [ROWS/RANGE BETWEEN ... AND ...]
)
```

---

### 1️⃣ **PARTITION BY Clause**

Divides data into groups (like a virtual `GROUP BY`) before applying the function.

```sql
SELECT
  order_id, order_date, pizza_name_id,
  SUM(total_price) OVER() AS SalesWithoutPart,
  SUM(total_price) OVER(PARTITION BY order_id) AS SalesWithPart
FROM pizza_sales;
```

> You can partition by **multiple columns** too:

```sql
SUM(total_price) OVER(PARTITION BY order_id, pizza_category)
```

---

### 2️⃣ **ORDER BY Clause (within OVER)**

Sorts rows **within each partition** before the function is applied. This is **mandatory** for ranking functions like `RANK()`.

```sql
SELECT
  order_id, total_price,
  RANK() OVER(ORDER BY total_price DESC) AS Rank
FROM pizza_sales;
```

---

### 3️⃣ **Window Frame (ROWS / RANGE)**

Specifies the **range of rows** used in the calculation relative to the current row.

**Common frame options**:

* `UNBOUNDED PRECEDING`
* `CURRENT ROW`
* `N PRECEDING` / `N FOLLOWING`

```sql
SELECT
  order_id, pizza_category, total_price,
  SUM(total_price) OVER (
    PARTITION BY pizza_category 
    ORDER BY order_date 
    ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
  ) AS RollingTotal
FROM pizza_sales;
```

Window frames define **which rows are included** in the calculation **relative to the current row** within each partition. This is **especially important** for functions like `SUM()`, `AVG()`, `ROW_NUMBER()`, etc., when paired with `ORDER BY`.

---

## 🔳 WINDOW FRAME TYPES

There are **two types** of window frames:

1. **ROWS** – exact physical row positions
2. **RANGE** – logical range of values (based on the `ORDER BY` column)

> In practice, `ROWS` is more predictable and commonly used than `RANGE`.

---

## 📐 FRAME BOUNDARY OPTIONS

Each frame has:

* A **starting point (lower boundary)**
* An **ending point (upper boundary)**

| Keyword               | Meaning                                       |
| --------------------- | --------------------------------------------- |
| `UNBOUNDED PRECEDING` | Start from the **first row** in the partition |
| `N PRECEDING`         | N rows **before** the current row             |
| `CURRENT ROW`         | The current row itself                        |
| `N FOLLOWING`         | N rows **after** the current row              |
| `UNBOUNDED FOLLOWING` | The **last row** in the partition             |

---

## ✅ COMMON COMBINATIONS & USE CASES

Here’s a breakdown of **typical window frame combinations** using `ROWS BETWEEN` syntax:

| Frame Clause                                               | Explanation                            | Use Case                                                      |
| ---------------------------------------------------------- | -------------------------------------- | ------------------------------------------------------------- |
| `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`         | From the first row to the current row  | **Running total** or **cumulative sum**                       |
| `ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING`         | From the current row to the last row   | **Future-looking total**                                      |
| `ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING`                 | One row before, current, and one after | **Moving average**, centered                                  |
| `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`                 | Current and two rows before            | **Lagging window**, e.g. 3-day trailing average               |
| `ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING`                 | Current and next two rows              | **Lead-based calculations**, e.g. next 3-day sum              |
| `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` | Entire partition                       | Acts like `SUM(...) OVER (PARTITION BY ...)` without ordering |

---

### 🧠 Example

```sql
SELECT
  order_date,
  pizza_category,
  total_price,
  SUM(total_price) OVER (
    PARTITION BY pizza_category
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS RunningTotal
FROM pizza_sales;
```

This returns a **cumulative sum of sales per category**, ordered by date.

---

### ⚠️ `RANGE` vs `ROWS`

| ROWS                           | RANGE                                                                                   |
| ------------------------------ | --------------------------------------------------------------------------------------- |
| Works with **physical rows**   | Works with **values**                                                                   |
| More precise and deterministic | Can lead to unexpected behavior (e.g. when multiple rows have same value in `ORDER BY`) |

---

## 🚫 **Rules to Remember**

* Can only use in `SELECT` or `ORDER BY` clauses.
* Cannot nest window functions.
* Executes **after** `WHERE` and **before** `ORDER BY`.
* Can combine with `GROUP BY`, **if using same columns**.

---

## 📌 **Summary**

| Component      | Purpose                                    |
| -------------- | ------------------------------------------ |
| `PARTITION BY` | Divides data into groups                   |
| `ORDER BY`     | Orders data within the partition           |
| `ROWS/RANGE`   | Defines the window frame for calculations  |
| Output         | All rows preserved, with calculated fields |

---
