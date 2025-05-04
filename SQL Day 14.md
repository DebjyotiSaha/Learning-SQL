
## 🗓️ **SQL Date Format & Data Casting**

---

### 🔸 **1. Date Formatting**

Used to display date values in specific formats.
**Function:** `FORMAT()`

#### ✅ **Syntax**:

```sql
FORMAT(value, format, [culture])
```

#### ✅ **Examples**:

```sql
SELECT order_id, order_date, order_time,
       FORMAT(order_date, 'MM-dd-yyyy') AS MM_DD_YYYY,
       FORMAT(order_date, 'dd-MM-yyyy') AS DD_MM_YYYY,
       FORMAT(order_date, 'dd') AS Day_Only,
       FORMAT(order_date, 'ddd') AS Day_Short,
       FORMAT(order_date, 'dddd') AS Day_Full,
       FORMAT(order_date, 'MM') AS Month_Number,
       FORMAT(order_date, 'MMM') AS Month_Short,
       FORMAT(order_date, 'MMMM') AS Month_Full
FROM pizza_sales;
```

#### 🔹 **Formatted String Example**:

```sql
SELECT order_id, order_date, order_time,
       'Day ' + FORMAT(order_date, 'ddd MMM') +
       ' Q' + DATENAME(QUARTER, order_date) + ' ' +
       FORMAT(order_date, 'yyyy hh:mm:ss tt') AS CustomFormatted
FROM pizza_sales;
```

#### 🔹 **Aggregation by Formatted Date**:

```sql
SELECT FORMAT(order_date, 'MMM yy') AS Order_Month, COUNT(*) AS Orders
FROM pizza_sales
GROUP BY FORMAT(order_date, 'MMM yy');
```

---

### 🔸 **2. Data Casting**

Used to **convert data types** for processing or formatting.

---

### ✅ **CONVERT()**

#### ✅ **Syntax**:

```sql
CONVERT(data_type, value [, style])
```

#### ✅ **Examples**:

```sql
SELECT 
       CONVERT(INT, '123') AS ToInt,
       CONVERT(DATE, '2025-08-24') AS ToDate,
       order_date,
       CONVERT(DATE, order_date) AS OrderDateOnly
FROM pizza_sales;

SELECT 
       order_date,
       CONVERT(DATE, order_date) AS DateOnly,
       CONVERT(VARCHAR, order_date, 32) AS CustomFormatted
FROM pizza_sales;
```

---

### ✅ **CAST()**

#### ✅ **Syntax**:

```sql
CAST(value AS data_type)
```

#### ✅ **Examples**:

```sql
SELECT 
       CAST('123' AS INT) AS ToInt,
       CAST('123' AS VARCHAR) AS ToString,
       CAST('2025-06-12' AS DATE) AS ToDate,
       CAST('2023-12-12' AS DATETIME) AS ToDateTime;
```

---

## 🧠 **Comparison Table**

| Feature     | `FORMAT()`              | `CAST()`        | `CONVERT()`              |
| ----------- | ----------------------- | --------------- | ------------------------ |
| Converts to | Only **string**         | **Any type**    | **Any type**             |
| Formatting  | Yes (date/time, number) | No              | Yes (for date/time only) |
| Use Case    | Display formatting      | Type conversion | Type conversion + format |

---
