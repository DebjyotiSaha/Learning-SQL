
## ✅ **Window Aggregate Functions Overview**

### Syntax:

```sql
AGG_FUNCTION(column) OVER (
  PARTITION BY col1 -- optional
  ORDER BY col2     -- optional
  ROWS BETWEEN ...  -- optional
)
```

---

### 🔢 1. **COUNT()**

* Counts rows in the defined window.
* Ignores `NULL` values if using a column, but not with `COUNT(*)`.

#### Examples:

```sql
-- Total rows in the entire table
SELECT COUNT(*) OVER() AS TotalRows FROM pizza_sales;

-- Count by pizza_id
SELECT pizza_id, COUNT(*) OVER (PARTITION BY pizza_id) AS CountByPizza FROM pizza_sales;

-- Check for primary key duplicity
SELECT order_id, COUNT(*) OVER(PARTITION BY order_id) AS CheckPK FROM pizza_sales;
```

---

### ➕ 2. **SUM()**

* Returns the total of the column within the window.

#### Example:

```sql
SELECT
  order_id,
  SUM(total_price) OVER () AS TotalSales,
  ROUND(total_price * 100.0 / SUM(total_price) OVER (), 2) AS SalesPercent
FROM pizza_sales;
```

---

### 🧮 3. **AVG()**

* Averages the values in the window.

#### Example:

```sql
SELECT
  pizza_category,
  AVG(total_price) OVER (PARTITION BY pizza_category) AS AvgByCategory
FROM pizza_sales;
```

---

### 🔼 4. **MIN() / MAX()**

* Finds the lowest or highest value within a window.

#### Example:

```sql
SELECT
  pizza_category,
  MIN(total_price) OVER (PARTITION BY pizza_category) AS MinCat,
  MAX(total_price) OVER (PARTITION BY pizza_category) AS MaxCat
FROM pizza_sales;
```

---

## 🔄 Running, Rolling, and Moving Aggregates

---

### 📈 **Running Total**

* Cumulative total *from first row to current*.

```sql
SELECT
  order_date,
  total_price,
  SUM(total_price) OVER (ORDER BY order_date) AS RunningTotal
FROM pizza_sales;
```

---

### 🔁 **Rolling Total (e.g., 3-row moving sum)**

```sql
SELECT
  order_date,
  total_price,
  SUM(total_price) OVER (
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS Rolling3DaySum
FROM pizza_sales;
```

---

### 📊 **Moving Average (trailing or centered)**

```sql
SELECT
  order_date,
  pizza_category,
  total_price,
  AVG(total_price) OVER (
    PARTITION BY pizza_category
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS MovingAvg3
FROM pizza_sales;
```

You can adjust the `ROWS BETWEEN ...` clause for **future-looking**, **centered**, or **lagging windows**.

---

### 🧠 Best Practices

| Use Case       | Function                   | Notes                         |
| -------------- | -------------------------- | ----------------------------- |
| Count rows     | `COUNT(*) OVER()`          | Includes all rows             |
| Rank by total  | Use with `ORDER BY`        | Required for meaningful order |
| Analyze trends | Use `ORDER BY` + `ROWS`    | Ensures time-based logic      |
| Performance    | Prefer `ROWS` over `RANGE` | More deterministic            |

---
