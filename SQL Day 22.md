# 🎯 Value Window Functions in SQL

These functions **return values from other rows** relative to the current row **without losing row-level detail**.

---

## 1️⃣ **LEAD()** and **LAG()**

| Function | Purpose                         | Direction |
| -------- | ------------------------------- | --------- |
| `LEAD()` | Get value from **next** row     | Forward   |
| `LAG()`  | Get value from **previous** row | Backward  |

### Syntax:

```sql
LEAD(column, offset, default) OVER (PARTITION BY ... ORDER BY ...)
LAG(column, offset, default) OVER (PARTITION BY ... ORDER BY ...)
```

### Example:

```sql
SELECT pizza_id, order_id, total_price,
  LAG(total_price) OVER(ORDER BY order_id) AS PrevPrice,
  LEAD(total_price) OVER(ORDER BY order_id) AS NextPrice
FROM pizza_sales;
```

### Use Cases:

* **Time Series Analysis** (e.g., MoM growth)
* **Customer retention** (gaps between orders)
* Compare current row with previous/next

---

## 🕒 Time Series Example

```sql
SELECT *, 
  CurrentM - PreviousM AS MoM,
  ROUND(CAST(CurrentM - PreviousM AS FLOAT) / NULLIF(PreviousM, 0) * 100, 1) AS MoMPercent
FROM (
  SELECT MONTH(order_date) AS order_month,
         SUM(total_price) AS CurrentM,
         LAG(SUM(total_price)) OVER(ORDER BY MONTH(order_date)) AS PreviousM
  FROM pizza_sales
  GROUP BY MONTH(order_date)
) t;
```

### Key Concept:

* `LAG()` allows you to reference **last month’s value**
* `LEAD()` would help if you're predicting **next month's**

---

## 👥 Customer Retention Example

```sql
SELECT pizza_id, AVG(DaysUntilNext) AS AvgDays,
  RANK() OVER (ORDER BY AVG(DaysUntilNext)) AS RankAvg
FROM (
  SELECT pizza_id, order_id, order_date AS CurrentOrder,
         LEAD(order_date) OVER(PARTITION BY pizza_id ORDER BY order_date) AS NextOrder,
         DATEDIFF(DAY, order_date, LEAD(order_date) OVER(PARTITION BY pizza_id ORDER BY order_date)) AS DaysUntilNext
  FROM pizza_sales
) t
GROUP BY pizza_id;
```

### Goal:

* Find **average days between orders** per pizza type
* Rank to find most frequently re-ordered pizzas

---

## 2️⃣ **FIRST\_VALUE()** and **LAST\_VALUE()**

| Function        | What it does                                       |
| --------------- | -------------------------------------------------- |
| `FIRST_VALUE()` | Gets **first value** in window (based on ORDER BY) |
| `LAST_VALUE()`  | Gets **last value** in window (based on ORDER BY)  |

### Syntax:

```sql
FIRST_VALUE(column) OVER (PARTITION BY ... ORDER BY ...)
LAST_VALUE(column) OVER (PARTITION BY ... ORDER BY ... ROWS BETWEEN ...)
```

> ⚠️ **Common Pitfall**:
> By default, `LAST_VALUE()` returns the **current row's value** because the window frame ends at the current row.
> Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` to get the true last value.

### Example (Correct LAST\_VALUE usage):

```sql
SELECT pizza_id, order_id, total_price,
  FIRST_VALUE(total_price) OVER (ORDER BY order_id) AS FirstOrderPrice,
  LAST_VALUE(total_price) OVER (
    ORDER BY order_id 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS LastOrderPrice
FROM pizza_sales;
```

---

## 🔄 Recap Table

| Function        | Purpose                      | Direction         | Use Case                           |
| --------------- | ---------------------------- | ----------------- | ---------------------------------- |
| `LEAD()`        | Value from next row          | Forward           | Forecast, comparison               |
| `LAG()`         | Value from previous row      | Backward          | Historical comparison              |
| `FIRST_VALUE()` | First row value in partition | Based on ORDER BY | Start of sequence                  |
| `LAST_VALUE()`  | Last row value in partition  | Based on ORDER BY | End of sequence (use proper frame) |

---
