
## 📅 **SQL Date and Time**

### 🔹 **Date Format**

* Standard SQL Date: `'YYYY-MM-DD'`
* Time: `'HH:MM:SS'`
* Combined: `TIMESTAMP` (or `DATETIME` in SQL Server)

---

### 🔹 **Datetime Values**

**1. From Table Column:**

```sql
SELECT order_id, order_time 
FROM pizza_sales;
```

**2. Hardcoded Date:**

```sql
SELECT order_id, order_time, '2015-12-12' AS HardCoded 
FROM pizza_sales;
```

**3. Current Date & Time:**

```sql
SELECT order_id, order_time, GETDATE() AS Today 
FROM pizza_sales;
```

---

## 🧰 **Functions Overview**

### 🧩 Part Extraction

* `DAY()`, `MONTH()`, `YEAR()` – Return day, month, year respectively

```sql
SELECT order_id, order_date,
       YEAR(order_date) AS Year,
       MONTH(order_date) AS Month,
       DAY(order_date) AS Day
FROM pizza_sales;
```

* `DATEPART()` – Extract numeric parts (year, month, hour, quarter, etc.)

```sql
SELECT order_id, order_date, order_time,
       DATEPART(YEAR, order_date) AS Year,
       DATEPART(HOUR, order_time) AS Hour,
       DATEPART(QUARTER, order_date) AS Quarter
FROM pizza_sales;
```

* `DATENAME()` – Returns string representation (e.g. "February", "Monday")

```sql
SELECT order_id, DATENAME(MONTH, order_date) AS MonthName,
       DATENAME(WEEKDAY, order_date) AS DayName
FROM pizza_sales;
```

* `DATETRUNC()` – Truncates datetime to a specified part (e.g. DAY, MINUTE)

```sql
SELECT order_id,
       DATETRUNC(DAY, order_date) AS StartOfDay,
       DATETRUNC(MINUTE, order_time) AS StartOfMinute
FROM pizza_sales;
```

* `EOMONTH()` – Returns end of month

```sql
SELECT order_id, EOMONTH(order_date) AS EndOfMonth
FROM pizza_sales;
```

---

## 📊 **Data Aggregation Examples**

* **Orders by Year:**

```sql
SELECT YEAR(order_date) AS Year, COUNT(*) AS OrderCount
FROM pizza_sales
GROUP BY YEAR(order_date);
```

* **Orders by Month:**

```sql
SELECT MONTH(order_date) AS Month, COUNT(*) AS OrderCount
FROM pizza_sales
GROUP BY MONTH(order_date);
```

* **Orders in February:**

```sql
SELECT *
FROM pizza_sales
WHERE MONTH(order_date) = 2;
```

---

## 🤔 **Which Function to Use?**

| Goal                      | Function           | Returns   |
| ------------------------- | ------------------ | --------- |
| Numeric day/month         | `DAY()`, `MONTH()` | Integer   |
| Full name of day/month    | `DATENAME()`       | String    |
| Year                      | `YEAR()`           | Integer   |
| Hour, week, quarter, etc. | `DATEPART()`       | Integer   |
| Start of time intervals   | `DATETRUNC()`      | Date/Time |
| End of month              | `EOMONTH()`        | Date      |

---
