

### ✅ **1. ROUND**

**Purpose:** Rounds a numeric value to the specified number of decimal places.

**Examples:**

* `3.516 → ROUND to 2 → 3.52`
* `3.516 → ROUND to 1 → 3.5`
* `3.516 → ROUND to 0 → 4`
  *(Rounds up if the digit is 5 or more)*

```sql
SELECT 3.516 AS MAIN_NUMBER,
       ROUND(3.516, 2) AS ROUND_2,
       ROUND(3.516, 1) AS ROUND_1,
       ROUND(3.516, 0) AS ROUND_0;
```

---

### ✅ **2. ABS (Absolute)**

**Purpose:** Converts negative numbers into positive.

```sql
SELECT -10 AS NEGATIVE_INPUT,
       ABS(-10) AS ABS_RESULT,
       ABS(10) AS POSITIVE_INPUT;
```


