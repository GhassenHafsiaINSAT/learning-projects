# SQL 

## SQL SELECT Clause  

sql```
SELECT column1, column2, ...
FROM table_name; 
```
### Select all elements

sql```
SELECT * 
FROM table_name; 
```

## SQL SELECT DISTINCT Clause

- The `DISTINCT` keyword is used to return only distinct values.  
sql ```
SELECT distinct column1
FROM table_name
```

## SQL WHERE Clause

sql ```
SELECT *
FROM table_name
WHERE condition; 
```

## SQL ORDER BY 

- The `ORDER BY` Keyword is used to sort the result-set in ascending or descinding order. 
- For string values the `ORDER BY` keyword will order alphabetically.    
sql```
SELECT * 
FROM table_name
ORDER BY column1, column2, ... ASC|DESC; 
``` 

## SQL INSERT INTO Statement
- The `INSERT INTO` statement is used to insert new records in a table.   
sql```
INSERT INTO table_name(cloumn1, column2, column3, ...) 
values (value1, value2, value3) 
```

## SQL NULL values
- A field with a `NULL` value is a field with no value.  
- It's not possible to test for NULL values with comparaison operators.  
sql```
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```



