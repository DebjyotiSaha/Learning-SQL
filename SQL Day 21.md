
## 🏆 **Ranking Window Functions in SQL**

### ✅ Purpose:

Assign a position or percentile to rows **based on ordering**, usually by sales, score, price, etc. Helps with **top-N**, **segmenting**, and **relative comparisons**.

---

## 1️⃣ **ROW\_NUMBER()**

Assigns a unique number **to every row**, regardless of ties.

* **Does NOT handle ties**
* Always generates **unique ranks**

### Example:

```sql
SELECT pizza_id, total_price,
ROW_NUMBER() OVER (ORDER BY total_price DESC) AS RowNum
FROM pizza_sales;
```

### Use Cases:

* Unique row identifiers
* Selecting **first/last record** per group
* De-duplication

---

## 2️⃣ **RANK()**

Assigns the same rank to tied rows but **skips the next rank**.

### Example:

```sql
SELECT pizza_id, total_price,
RANK() OVER (ORDER BY total_price DESC) AS SalesRank
FROM pizza_sales;
```

### Behavior:

| Value | Rank |
| ----- | ---- |
| 100   | 1    |
| 100   | 1    |
| 90    | 3    |

### Use Cases:

* Standard rankings (e.g., Olympic medals)
* Top-N analysis **with tie awareness**

---

## 3️⃣ **DENSE\_RANK()**

Handles ties **without gaps** in rank.

### Example:

```sql
SELECT pizza_id, total_price,
DENSE_RANK() OVER (ORDER BY total_price DESC) AS DenseRank
FROM pizza_sales;
```

### Behavior:

| Value | Rank |
| ----- | ---- |
| 100   | 1    |
| 100   | 1    |
| 90    | 2    |

### Use Cases:

* Grouped rankings without gaps
* Leaderboards where **compact ranks** matter

---

## 4️⃣ **NTILE(n)**

Splits rows into **n equal buckets** (or as equal as possible).

### Example:

```sql
SELECT pizza_id, total_price,
NTILE(4) OVER (ORDER BY total_price DESC) AS Quartile
FROM pizza_sales;
```

### Use Cases:

* Quartiles, deciles, etc.
* Customer or product segmentation
* Load balancing

---

## 5️⃣ **CUME\_DIST()**

Returns **cumulative distribution** of a value in the partition.

* Value between 0 and 1
* Includes current row and all previous rows

### Example:

```sql
SELECT pizza_id, total_price,
CUME_DIST() OVER (ORDER BY total_price DESC) AS CumDist
FROM pizza_sales;
```

### Use Case:

* “What % of pizzas have **equal or higher sales** than this?”
* Market distribution analysis

---

## 6️⃣ **PERCENT\_RANK()**

Relative rank of a row **scaled between 0 and 1**, excluding current row from count.

### Example:

```sql
SELECT pizza_id, total_price,
PERCENT_RANK() OVER (ORDER BY total_price DESC) AS PercentRank
FROM pizza_sales;
```

### Use Case:

* Compare relative standing
* “This pizza is in the **top 15%** by sales”

---

## 📌 Differences at a Glance

| Function         | Ties | Gaps | Output Type | Use Case          |
| ---------------- | ---- | ---- | ----------- | ----------------- |
| `ROW_NUMBER()`   | ❌    | ❌    | Integer     | Unique ID         |
| `RANK()`         | ✅    | ✅    | Integer     | Competition Rank  |
| `DENSE_RANK()`   | ✅    | ❌    | Integer     | Dense Rank        |
| `NTILE(n)`       | ✅    | -    | Integer     | Bucketing         |
| `CUME_DIST()`    | ✅    | -    | Decimal     | Cumulative %      |
| `PERCENT_RANK()` | ✅    | -    | Decimal     | Relative Position |

---

## 🧠 Best Practices

* Use `RANK()` for **ranking with ties** (e.g., top scorers).
* Use `DENSE_RANK()` when **no gaps** in ranking are preferred.
* Use `ROW_NUMBER()` to assign **unique** sequence numbers.
* Use `NTILE()` for even **bucketing** of data.
* Use `CUME_DIST()` or `PERCENT_RANK()` for **top-X% analysis**.

---
