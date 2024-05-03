# SQL COMMANDS Cheat Sheet

## SQL SELECT Clause  
- The `SELECT` statement is used to select data from a database.
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
DROP TABLE table_name;
```

## SQL Aggregate Functions 
- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
- Aggregate functions ignore NULL values.   
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
### Self Join
- A self join is when a table is joined with itself.  
```sql
SELECT 
FROM table_name1, table_name1
WHERE table.name1.commun_field=table_name1.commun_field;
```
### Multi-table Selection
- Selection data from multiple tables.
```sql
SELECT t1.column_name1, t2.column_name2
FROM table_name1 t1, table_name2 t2
WHERE t1.commun_field=t2.commun_field;
```
### Outer Join
- Combining rows from two or more tables and including unmatched rows from one or both tables.
- In Oracle, the `(+)` sign is used to denote an outer join, it is placed on th column of the tabl that might not have matching records in the other table.    
```sql
SELECT t1.column_name1, t2.column_name2
FROM table_name1 t1, table_name2 t2
WHERE t1.common_field = t2.common_field(+);
```
## SQL GROUP BY Statement 
- The `GROUP BY` statement groups rows that have the same values into summary rows
```sql
SELECT column_name1, agg_func(column_name2)
FROM table_name
WHERE condition
GROUP BY column_name1;
```
## SQL HAVING Keyword
- The `HAVING` clause was added to SQL because the `WHERE` keyword cannot be used with aggregate functions.
```sql
SELECT column_name1
FROM table_name
WHERE condition
GROUP BY column_name1
HAVING condition
```
## SQL EXISTS Operator
- The `EXISTS` operator is used to test for the existence of any record in a subquery.
```sql
SELECT column_name1
FROM table_name
WHERE EXISTS
(SELECT column_name1 FROM table_name WHERE condition);
```
## SQL ANY Operator
- `ANY` means that the condition will be true if the operation is true for any of the values in the range.
```sql
SELECT column_name1
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
```
## SQL ALL Operator
- `ALL` means that the condition will be true only if the operation is true for all values in the range.
```sql
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);
```
