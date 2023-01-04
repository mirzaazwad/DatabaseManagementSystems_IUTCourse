# PL/SQL

PL stands for Procedural Language and SQL for Structured Query Language, PL/SQL is essentially a procedural language for structured query language. In this segment, we explore the PL/SQL for oracle sql.

## Blocks
Block: Smallest unit of code

In PL/SQL, as in most procedural languages, the **smallest meaningful grouping of code** is known as a block. A block is a unit of code that provides **execution and scoping boundaries for variable declarations and exception handling**.

#### Anonymous Blocks

Essentially, it has no Name

Anonymous blocks don't have a name and hence it cannot be called by any other block since it doesn't have a handle for reference. Instead, anonymous blocks serve as  containers that execute PL/SQL statements. It is not in the database and cannot be reused.(_one-time execution_).

Let's do the mandatory thing to start out with any new programming language:
```sql
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello World!');
END ;
```

#### Named Blocks

While anonymous PL/SQL blocks are indispensable, the majority of code you write will be in names blocks that is:
* Functions
* Procedures
It is stored in the database and can be reused.

## Conditional Statements

**if then** is the most primitive of conditional statements. It can be written as: 
```sql
IF <condition-1> THEN
 --TRUE sequence of executable statements for condition-1
ELSIF <condition-2> THEN
 --TRUE sequence of executable statements for condition-2
ELSE
  --FALSE/NULL sequence of executable statements
END IF ;
```

## Function

#### Why use function/procedure?
Modular code using a function has the following benefits:
* More reusable
* More manageable
* More readable

Structure of a Function:
```sql
FUNCTION [schema]name[( parameter[, parameter ...])]
RETURN return_datatype
IS
[declaration statements]
BEGIN
<executable statements with a return>
[EXCEPTION
exception handler statements]

END [name];
```
Tid Bits about functions: 
* **IN** parameter (like conventional parameter), **OUT** parameter(not used here, used for writing call back to the caller)
* No datatype precision is allowed in parameter and return type:
```sql
 return varchar2(20); 
 --is invalid
```
* Function Name and parameters should be self-explanatory. (Clean Code: do not use abc as function name, x, y, and z as paramters with excessive commenting for explanation purposes).
* A simple example of a function:
```sql
CREATE OR REPLACE FUNCTION get_total_sales
RETURN NUMBER
IS 
  v_total_sales:=0;
BEGIN
--get total sales
 SELECT SUM(unit_price*quantity) INTO v_toal_sales FROM order_items INNER JOIN orders USING (order_id) WHERE status='Shipped';
 -- return the total sales
 RETURN v_total_sales;
END;
```

#### Calling a function

There are 3 general options:
* It can readily tested by a fixed parameter from dual:
```sql
 select get_total('CSE') from dual;
```
* You can test it by passing it as a parameter in put_line function:
```sql
 DBMS_OUTPUT.PUT_LINE('Sales: ' || get_total_sales);
```
* It can be selected from table values, the parameter value can be passed dunamically in the select statement.
```sql
 select id, get_cgpa(sid) from students where dept='CSE';
```
## Built-in Functions

#### DECODE function

DECODE() compared expression to each search value one by one. If expression is equal to a search, then Oracle Database returns the corresponding result. If no match is found, then Oracle returns default. If default is omitted, then Oracle returns null.
```sql
DECODE(expr,search,result
 [,search, result]...
 [, default]
 )
```

For example:
```sql
 SELECT product_id, DECODE(warehouse_id,1,'Southlake',
                           2,'San Fransisco',
                           3, 'New Jersey',
                           4,'Seattle',
                           'Non domestic')
                            "Location of inventory" 
                            FROM inventories WHERE product_id<100;
```

#### Rank function

* The RANK() function is **analytical function** that calculates the rank of a value in a set of values.
* The RANK() function returns the same rank for the rows with the same values. It adds the number of tied rows to the tied rank to calculate the next rank. Therefore, the ranks **may not be consecutive numbers**.
* The Rank() function is useful for top-N and bottom-N queries

Syntax of rank:
```sql
RANK()
     OVER ([query_partition_clause] order_by_clause)
```

Example of rank:
```sql
select sid,name,cgpa, rank() over (order by cgpa desc) position from students;
```
## Triggers

A trigger is a statement that is executed automatically by the system as a side effer of a modification to the database.

* To design a trigger mechanism, we must:
 * Specify the **conditions** under which the trigger is to be executed.
 * Specify the **actions** to be taken when the trigger executes.
* Since the trigger is **event-oriented**, it is **not explicitly called** like functions rather it **automatically fies** whenever the **condition is met**.

#### Classifying Triggers

![Trigger Classification Image](https://github.com/mirzaazwad/CSE4307_DatabaseManagementSystem/blob/main/Lab-09%20PL_SQL%20Tutorial%20%231/Trigger.png)

#### Row-level trigger

Some example cases where it may be used,
* Whenever an account holder withdraws money, his balance must be greater than the withdrawn amount.
* Any student is admitted with basic information, his/her student ID will be generated automatically.
* Whenever any update(1 or more rows affected) occurs in a specific table, the time of update should be recorded without human intervention.

So they have one in common: **it is executed for each possible record's change**.

Syntax for row-level trigger:
```
CREATE OR REPLACE TRIGGER trigger_name
BEFORE | AFTER 
INSER OR DELETE OR UPDATE OF column1, column2,
ON table.name
FOR EACH ROW
REFERENCING OLD AS old.name
NEW AS new.name
WHEN <condition>
DECLARE
BEGIN
EXCEPTION
END ;
```

#### Statement-Level Trigger

It works exactly in the same way as row-level trigger except it is only executed once no matter how many records are effected by the DML statement.
Syntax: Just ommit the **for each row** option.


[For More Information Regarding PL/SQL](https://github.com/mirzaazwad/CSE4307_DatabaseManagementSystem/blob/main/Lab-10%20PL_SQL%20Tutorial%20%232/Notes%20on%20PLSQL.pdf) Courtesy of Bhaktiyar Hasan Sir, Zannatul Naim Sristy Ma'am and Anaas Jawad Sir.
