
## 🔍 SQL `WHERE` Clause – Operators Explained

The `WHERE` clause is used to **filter rows** in a SQL query based on specified conditions. SQL provides different types of operators to build these conditions:

### ✅ Types of Operators in SQL `WHERE` Clause:
1. **Comparison Operators** (`=`, `!=`, `>`, `<`, `>=`, `<=`)
2. **Logical Operators** (`AND`, `OR`, `NOT`)
3. **Range Operator** (`BETWEEN`)
4. **Membership Operator** (`IN`, `NOT IN`)
5. **Pattern Matching** (`LIKE`)

---

### 1. 🔁 Comparison Operators
Used to compare column values to specific values.

| Operator | Description                          | Example |
|----------|--------------------------------------|---------|
| `=`      | Equals                                | `WHERE State = 'Maharashtra'` |
| `!=` or `<>` | Not equal to                    | `WHERE State != 'Maharashtra'` |
| `>`      | Greater than                          | `WHERE Sex_Ratio > 800` |
| `<`      | Less than                             | `WHERE Sex_Ratio < 800` |
| `>=`     | Greater than or equal to              | `WHERE Sex_Ratio >= 800` |
| `<=`     | Less than or equal to                 | `WHERE Sex_Ratio <= 800` |

---

### 2. 🧠 Logical Operators

#### `AND` – All conditions must be true
```sql
SELECT * FROM Data1
WHERE State = 'Gujarat' AND Sex_Ratio > 900;
```

#### `OR` – At least one condition must be true
```sql
SELECT * FROM Data1
WHERE State = 'Gujarat' OR Sex_Ratio > 900;
```

#### `NOT` – Negates a condition
```sql
SELECT * FROM Data1
WHERE NOT State = 'Gujarat';
```

---

### 3. 📊 Range Operator: `BETWEEN`

Checks if a value lies within a given range (inclusive).

```sql
SELECT * FROM Data1
WHERE Sex_Ratio BETWEEN 800 AND 900;
```

Equivalent to:
```sql
SELECT * FROM Data1
WHERE Sex_Ratio >= 800 AND Sex_Ratio <= 900;
```

---

### 4. 🧾 Membership Operator: `IN`, `NOT IN`

#### `IN` – Checks if value exists in a given list
```sql
SELECT * FROM Data1
WHERE State IN ('Bihar', 'Gujarat');
```

Instead of:
```sql
SELECT * FROM Data1
WHERE State = 'Bihar' OR State = 'Gujarat';
```

#### `NOT IN` – Checks if value does *not* exist in the list
```sql
SELECT * FROM Data1
WHERE State NOT IN ('Bihar', 'Gujarat');
```

---

### 5. 🔍 Pattern Matching: `LIKE`

Used for **partial string matching**.  
- `%` → Any number of characters  
- `_` → Exactly one character

#### Examples:
```sql
-- Starts with M
SELECT * FROM Data1
WHERE District LIKE 'M%';

-- Ends with n
SELECT * FROM Data1
WHERE District LIKE '%n';

-- Contains 'r'
SELECT * FROM Data1
WHERE District LIKE '%r%';

-- Third character is 'r'
SELECT * FROM Data1
WHERE District LIKE '__r%';
```

