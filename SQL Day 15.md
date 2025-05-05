
## 🧮 **SQL Date Calculations & Validation**

---

### 🔸 **1. `DATEADD()` – Add/Subtract Time**

Used to add or subtract intervals (like days, months, or years) to/from a date.

#### ✅ **Syntax**:

```sql
DATEADD(part, interval, date)
```

#### ✅ **Date Parts**:

`YEAR`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND`

#### ✅ **Examples**:

```sql
SELECT order_id, order_date,
       DATEADD(YEAR, 3, order_date) AS Plus_3_Years,
       DATEADD(MONTH, 3, order_date) AS Plus_3_Months,
       DATEADD(DAY, 3, order_date) AS Plus_3_Days,
       DATEADD(YEAR, -10, order_date) AS Minus_10_Years
FROM pizza_sales;
```

---

### 🔸 **2. `DATEDIFF()` – Calculate Time Difference**

Used to calculate the difference between two dates.

#### ✅ **Syntax**:

```sql
DATEDIFF(part, start_date, end_date)
```

#### ✅ **Examples**:

```sql
SELECT EmployeeID, BirthDate,
       DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees;
```

---

### 🔸 **3. `ISDATE()` – Date Validation**

Checks whether a value is a valid date or not.

#### ✅ **Syntax**:

```sql
ISDATE(value)
```

#### ✅ **Examples**:

```sql
SELECT ISDATE('123') AS Is_123_Valid;             -- 0 (False)
SELECT ISDATE('2025-08-20') AS Is_Valid_Date;     -- 1 (True)
SELECT ISDATE('23-09-2013') AS Is_Valid_DDMMYYYY; -- 0 (Depends on SQL settings)
```

> 🧠 **Use Case**: Useful for **data quality checks**, input validation, and cleaning unstructured datasets.

---


