# SQL 

## SQL SELECT Clause  

```sql
SELECT column1, column2, ...
FROM table_name; 
```
### Select all elements

```sql
SELECT * 
FROM table_name; 
```

## SQL SELECT DISTINCT Clause

- The `DISTINCT` keyword is used to return only distinct values.
```sql
SELECT distinct column1
FROM table_name
```

## SQL WHERE Clause

```sql
SELECT *
FROM table_name
WHERE condition; 
```

## SQL ORDER BY 

- The `ORDER BY` Keyword is used to sort the result-set in ascending or descinding order. 
- For string values the `ORDER BY` keyword will order alphabetically.    
```sql
SELECT * 
FROM table_name
ORDER BY column1, column2, ... ASC|DESC; 
``` 

## SQL INSERT INTO Statement
- The `INSERT INTO` statement is used to insert new records in a table.
```sql
INSERT INTO table_name(cloumn1, column2, column3, ...) 
values (value1, value2, value3) 
```

## SQL NULL values
- A field with a `NULL` value is a field with no value.  
- It's not possible to test for NULL values with comparaison operators.

```sql
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```

## SQL UPDATE Statement
- The `UPDATE` statement is used to modify th existing records in a table.
- If you omit the `WHERE` clause, all records will be updated.  
```sql
UPDATE table_name
SET column1=value1, column2=value2, ...
WHERE condition;
```

## SQL DELETE Statement
- The `DELETE` statement is used to delete existing records in a table.
```sql
DELETE
FROM table_name
WHERE condition;
```
### Delete or records
```sql
DELETE
FROM table_name;
```
### Delete a table 
```sql
DROP TABLE table_name
```

## SQL Aggregate Functions 
- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

    `MIN()` - returns the smallest value within the selected column.  
    `MAX()` - returns the largest value within the selected column.  
    `COUNT()` - returns the number of rows in a set.  
    `SUM()` - returns the total sum of a numerical column.  
    `AVG()` - returns the average value of a numerical column.  
## SQL LIKE Operator
- The `LIKE` operator in a `WHERE` clause to search fpr a specified pattern in a column.
- `LIKE` wildcards :
    - The percent sign `%` represents zero, one, or multiple characters.  
    - The underscore sign `_` represents one, single character.
### Wildcard Characters
    Symbol 	Description
    % 	Represents zero or more characters
    _ 	Represents a single character
    [] 	Represents any single character within the brackets *
    ^ 	Represents any character not in the brackets *
    - 	Represents any single character within the specified range *
    {} 	Represents any escaped character **
## Joins
### INNER JOIN 
```sql
SELECT 
FROM table_name1, table_name2
WHERE table.name1.column_name1=table_name2.column_name2
```

