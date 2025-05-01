
## 🔗 Multi-Table Joins in SQL

When working with normalized databases, data is often spread across multiple related tables. To get a **complete dataset**, we join these tables using **JOIN operations**, most commonly using `LEFT JOIN` or `INNER JOIN`.

---

### 🎯 **Use Case: Combine Sales, Users, Products, and Gold Signups**

Let’s say we want to analyze **user purchases**, their **details**, the **products they bought**, and whether they are **gold members**.

---

### 📍 Step-by-Step Join Pathway

**Pathway:**
```
Master Table: Sales
   ↓
LEFT JOIN Users      -- Get user info
   ↓
LEFT JOIN Product    -- Get product info
   ↓
LEFT JOIN GoldUsers  -- Check for gold membership
```

---

### 🔍 1. Inspect Individual Tables
```sql
SELECT * FROM goldusers_signup;
SELECT * FROM product;
SELECT * FROM sales;
SELECT * FROM users;
```

Understand the **primary keys** and **foreign keys** to plan the joins.

---

### 🔗 2. First Join – Sales + Users
```sql
SELECT 
  S.userid, 
  S.created_date
FROM sales AS S
LEFT JOIN users AS U
  ON S.userid = U.userid;
```

✅ This gives us the **user info** along with their sales.

---

### 🔗 3. Add Product Information
```sql
SELECT 
  S.userid, 
  S.created_date, 
  S.product_id, 
  P.product_name
FROM sales AS S
LEFT JOIN users AS U
  ON S.userid = U.userid
LEFT JOIN product AS P
  ON S.product_id = P.product_id;
```

✅ Now we get **product details** for each sale.

---

### 🔗 4. Add Gold Membership Status
```sql
SELECT 
  S.userid, 
  S.created_date, 
  S.product_id, 
  P.product_name,
  G.gold_signup_date
FROM sales AS S
LEFT JOIN users AS U
  ON S.userid = U.userid
LEFT JOIN product AS P
  ON S.product_id = P.product_id
LEFT JOIN goldusers_signup AS G
  ON S.userid = G.userid;
```

✅ This final query combines **sales**, **user data**, **product data**, and **gold membership status**.

---

### 🧠 Best Practices

- Use `LEFT JOIN` when:
  - You want to **retain all sales records**, even if user/product/gold data is missing.
- Use `INNER JOIN` when:
  - You want only **fully matched rows** (e.g., users who have signed up **and** made purchases **and** bought a known product).
- Use **aliases** (e.g., `S`, `U`, `P`, `G`) to keep your query clean and readable.

---
