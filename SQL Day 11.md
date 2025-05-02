
## 🔤 SQL String Functions

### 🛠️ **String Manipulation**

| Function    | Description                         | Example                             |
| ----------- | ----------------------------------- | ----------------------------------- |
| `CONCAT()`  | Joins multiple strings into one     | `CONCAT(District, ', ', State)`     |
| `UPPER()`   | Converts string to uppercase        | `UPPER(State)`                      |
| `LOWER()`   | Converts string to lowercase        | `LOWER(District)`                   |
| `TRIM()`    | Removes leading and trailing spaces | `TRIM(District)`                    |
| `REPLACE()` | Replaces characters in a string     | `REPLACE('123-456-7890', '-', '/')` |

---

### 📏 **String Calculation**

| Function | Description                                                     | Example                                 |
| -------- | --------------------------------------------------------------- | --------------------------------------- |
| `LEN()`  | Returns the number of characters in a string (including spaces) | `LEN('Maria')`<br>`LEN(TRIM(District))` |

---

### 🔍 **String Extraction**

| Function      | Description                                           | Example                                 |
| ------------- | ----------------------------------------------------- | --------------------------------------- |
| `LEFT()`      | Extracts a number of characters from the left         | `LEFT(District, 2)`                     |
| `RIGHT()`     | Extracts characters from the right                    | `RIGHT(District, 2)`                    |
| `SUBSTRING()` | Extracts characters starting from a specific position | `SUBSTRING(District, 2, LEN(District))` |

---

### ✅ **1. CONCAT**

**Purpose:** Combines multiple string values into one.

```sql
SELECT District,
       State,
       CONCAT(District, ', ', State) AS Combined
FROM Data1;
```

---

### ✅ **2. LOWER**

**Purpose:** Converts all characters to lowercase.

```sql
SELECT LOWER(District) AS Lower_District
FROM Data1;
```

---

### ✅ **3. UPPER**

**Purpose:** Converts all characters to uppercase.

```sql
SELECT UPPER(State) AS Upper_State
FROM Data1;
```

---

### ✅ **4. TRIM**

**Purpose:** Removes leading and trailing spaces.

```sql
SELECT District,
       LEN(District) AS OriginalLength,
       LEN(TRIM(District)) AS TrimmedLength,
       LEN(District) - LEN(TRIM(District)) AS ExtraSpaces
FROM Data1
WHERE LEN(District) - LEN(TRIM(District)) != 0;
```

---

### ✅ **5. REPLACE**

**Purpose:** Replaces a specific character or substring with something else.

```sql
SELECT '123-456-7890' AS phone,
       REPLACE('123-456-7890', '-', '/') AS new_phone;
```

---

### ✅ **6. LEN**

**Purpose:** Returns the length of a string (number of characters).

```sql
SELECT LEN('Maria') AS NameLength;
```

---

### ✅ **7. LEFT**

**Purpose:** Extracts characters from the beginning (left) of a string.

```sql
SELECT District,
       LEFT(District, 2) AS FirstTwoChars
FROM Data1;
```

---

### ✅ **8. RIGHT**

**Purpose:** Extracts characters from the end (right) of a string.

```sql
SELECT District,
       RIGHT(District, 2) AS LastTwoChars
FROM Data1;
```

---

### ✅ **9. SUBSTRING**

**Purpose:** Extracts a part of a string starting from a specific position.

```sql
SELECT District,
       SUBSTRING(District, 2, LEN(District)) AS SkippedFirstChar
FROM Data1;
```

---
