
## 🔧 **Stored Procedures in SQL Server**

### 🔹 **Basic Syntax**

```sql
CREATE PROCEDURE ProcedureName
AS
BEGIN
    -- SQL Statements
END

-- Execution
EXEC ProcedureName
```

---

### 📌 **Example: Basic Stored Procedure**

```sql
CREATE PROCEDURE GetAmount
AS
BEGIN
    SELECT COUNT(Brand) AS TotalCompany,
           AVG(AmountInvestedlakhs) AS TotalAmount
    FROM Shark
    WHERE Sector = 'Health';
END

EXEC GetAmount;
```

---

### 🔹 **With Parameters**

```sql
ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(Brand) AS TotalCompany,
           AVG(AmountInvestedlakhs) AS TotalAmount
    FROM Shark
    WHERE Sector = @Sector;
END

EXEC GetFoodAmount @Sector = 'Food';
```

---

### 🔹 **Multiple Result Sets**

```sql
ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(Brand) AS TotalCompany,
           AVG(AmountInvestedlakhs) AS TotalAmount
    FROM Shark
    WHERE Sector = @Sector;

    SELECT COUNT(Brand) AS TotalBrand,
           SUM(AmoutAsked) AS TotalAmount
    FROM Shark
    WHERE Sector = @Sector;
END
```

---

### 🔹 **Using Variables**

```sql
ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
    DECLARE @TotalBrands INT, @AvgAmount FLOAT;

    SELECT @TotalBrands = COUNT(Brand),
           @AvgAmount = AVG(AmountInvestedlakhs)
    FROM Shark
    WHERE Sector = @Sector;

    PRINT 'Total Brands from ' + @Sector + ': ' + CAST(@TotalBrands AS NVARCHAR);
    PRINT 'Average Investment: ' + CAST(@AvgAmount AS NVARCHAR);

    SELECT COUNT(Brand) AS TotalBrand,
           SUM(AmoutAsked) AS TotalAmount
    FROM Shark
    WHERE Sector = @Sector;
END
```

---

### 🔹 **Control Flow Logic**

```sql
ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
    DECLARE @TotalBrands INT, @AvgAmount FLOAT;

    -- Data Cleaning
    IF EXISTS(SELECT 1 FROM Shark WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector)
    BEGIN
        PRINT 'Updating NULL to zero';
        UPDATE Shark
        SET AmountInvestedlakhs = 0
        WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector;
    END
    ELSE
    BEGIN
        PRINT 'No NULLs found';
    END

    -- Report Preparation
    SELECT @TotalBrands = COUNT(Brand),
           @AvgAmount = AVG(AmountInvestedlakhs)
    FROM Shark
    WHERE Sector = @Sector;

    PRINT 'Total Brands: ' + CAST(@TotalBrands AS NVARCHAR);
    PRINT 'Average Investment: ' + CAST(@AvgAmount AS NVARCHAR);

    SELECT COUNT(Brand) AS TotalBrand,
           SUM(AmoutAsked) AS TotalAmount
    FROM Shark
    WHERE Sector = @Sector;
END
```

---

### 🔹 **Error Handling**

```sql
ALTER PROCEDURE GetFoodAmount @Sector NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DECLARE @TotalBrands INT, @AvgAmount FLOAT;

        IF EXISTS(SELECT 1 FROM Shark WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector)
        BEGIN
            PRINT 'Updating NULL to zero';
            UPDATE Shark
            SET AmountInvestedlakhs = 0
            WHERE AmountInvestedlakhs IS NULL AND Sector = @Sector;
        END

        SELECT @TotalBrands = COUNT(Brand),
               @AvgAmount = AVG(AmountInvestedlakhs)
        FROM Shark
        WHERE Sector = @Sector;

        PRINT 'Total Brands: ' + CAST(@TotalBrands AS NVARCHAR);
        PRINT 'Average Investment: ' + CAST(@AvgAmount AS NVARCHAR);

        -- Intentional Error for Testing
        SELECT 1 / 0;

    END TRY
    BEGIN CATCH
        PRINT 'An error occurred';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT 'Error Procedure: ' + ERROR_PROCEDURE();
    END CATCH
END
```

---

## 📌 Summary: Why Use Stored Procedures?

| Benefit              | Description                                                     |
| -------------------- | --------------------------------------------------------------- |
| **Modularity**       | Encapsulates business logic in reusable blocks                  |
| **Performance**      | Compiled and optimized by SQL Server                            |
| **Security**         | Access control via GRANT/REVOKE                                 |
| **Maintainability**  | Easier to debug, audit, and modify                              |
| **Parameterization** | Dynamic input makes procedures reusable for different scenarios |

---
