## 🔧 How to Modify an SQL Table (Using DDL)

**DDL (Data Definition Language)** is used to define and modify the structure of database objects like tables, schemas, and constraints.

---

### 1. **CREATE Command**
Used to **create a new table** with a defined structure.

```sql
CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
);
```

📌 **Key points:**
- `id`, `person_name`, etc., define the **columns and data types**.
- `PRIMARY KEY` ensures uniqueness of the `id`.

---

### 2. **ALTER Command**
Used to **modify an existing table** — you can add, delete, or change columns.

#### ➕ Add a column:
```sql
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
```

#### ➖ Remove a column:
```sql
ALTER TABLE persons
DROP COLUMN phone;
```

🛠️ You can also use `ALTER` to rename columns, change data types, or add constraints (syntax may vary by DBMS).

---

### 3. **DROP Command**
Used to **delete a table** permanently from the database.

```sql
DROP TABLE persons;
```

⚠️ This command **removes the table and all its data**. Use with caution!

---
