
## 🛠️ Data Manipulation Language (DML)

**DML** refers to SQL commands used to **insert, update, or delete** data within a table. The primary DML commands are:

- `INSERT`
- `UPDATE`
- `DELETE`

---

### ➕ INSERT Command
Used to **add new rows** of data to a table.

**Syntax:**
```sql
INSERT INTO table_name (col1, col2, col3, ...)
VALUES (val1, val2, val3, ...);
```

**Rules:**
- The number of columns must match the number of values.
- Maintain correct data types for each column.

**Example:**
```sql
INSERT INTO customers (id, first_name, country, score)
VALUES 
    (1, 'Anna', 'USA', 24),
    (2, 'Sam', NULL, 100);
```

---

### 🔄 INSERT Using SELECT
Insert data **from one table into another** without manually specifying values.

**Step 1: Table Definitions**
```sql
CREATE TABLE customers (
    id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(15),
    score INT NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (id)
);

CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
);
```

**Step 2: Insert using SELECT**
```sql
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT id, first_name, NULL, 'Unknown'
FROM customers;
```

---

### ✏️ UPDATE Command
Used to **modify existing data** in a table.

**Syntax:**
```sql
UPDATE table_name
SET col1 = val1,
    col2 = val2
WHERE condition;
```

**Important Rule:**  
Always use a `WHERE` clause unless you intend to update **all rows** in the table.

**Example:**
```sql
UPDATE customers
SET country = 'USA',
    score = 0
WHERE id = 1;
```

---

### ❌ DELETE Command
Used to **remove rows** from a table.

**Syntax:**
```sql
DELETE FROM table_name
WHERE condition;
```

**Example:**
```sql
DELETE FROM customers
WHERE id < 2;
```

---

### ⚠️ TRUNCATE Command
Used to **delete all data** from a table **quickly and irreversibly**, but keeps the table structure intact.

**Syntax:**
```sql
TRUNCATE TABLE table_name;
```

**Note:** Unlike `DELETE`, `TRUNCATE` cannot be rolled back in most databases.

---
