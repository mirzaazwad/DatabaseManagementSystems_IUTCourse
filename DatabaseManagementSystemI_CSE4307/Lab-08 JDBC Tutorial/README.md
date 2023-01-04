# JDBC

## Introduction

* Java™ database connectivity is a Java API for communicating with database systems supporting SQL. 
* JDBC supports a variety of features for querying and updating data, and for retrieving queries. 
* JDBC also supports metadata retrieval, such as querying about relations present in the database and the names and types of the relation attributes.
* Model for communicating with the database
  * Open a connection
  * Create a statement object
* Execute queries using the statement object to send queries and fetch results.
* It also provides exception mechanism to handle errors.

## JDBC Features:

* Connecting to Database
* DB access in Java/Python
* Shipping SQL statements to the Database System
* Exceptions and Resource Management.
* Retrieving the Result of a Query
* Prepared Statements
* Callable statements
* Metadata Features
* Transaction Control
* Calling functions and procedures
* Handling large objects - BLOBs, CLOBs.

## Why does a database programmer need access to a general-purpose programming language?

* Not all queries can be expressed in SQL, since SQL does not provide the full  expressive power of a general-purpose programming language.
* Non-declarative actions such as printing a report, interacting with a user, or sending the results of a query to a GUI cannot be done from within the SQL.

## There are two approaches to access SQL from a General-Purpose Programming Language?

* A general-purpose program can connect to and communicate with a database server using a collection of functions
* Embedded SQL provides a means by which a program can interact with a database server.
 * SQL statement can be translated at compile time into function calls
 * At runtime, these function calls connect to the database using an API that provides dynamic SQL facilities
 
 ## Basic Structure of JDBC Code
 
 ```java
 public static void JDBCexample(String dbid, String userid, String passwd) 
{ 
 try (Connection conn = DriverManager.getConnection( 
  "jdbc:oracle:thin:@localhost:1521:xe", userid, passwd); 
  Statement stmt = conn.createStatement();
 ) 
 { 
 … Do Actual Work ….
 }
 catch (SQLException sqle) { 
  System.out.println("SQLException : " + sqle);
 }
}
 ```
 
 Note: This structure works from JDK 7 and JDBC 14 onwards. Resources opened in “try (….)” syntax (“try with resources”) are 
automatically closed at the end of the try block. The code given below works for older versions of java. Class.forName is not required from JDBC 4 onwards. The try with resources syntax given above is preferred for Java 7 onwards. 

 
 ```java
public static void JDBCexample(String dbid, String userid, String passwd) 
{ 
 try { 
  Class.forName ("oracle.jdbc.driver.OracleDriver"); 
  Connection conn = DriverManager.getConnection( 
  "jdbc:oracle:thin:@localhost:1521:xe", userid, passwd); 
  Statement stmt = conn.createStatement(); 
  … Do Actual Work ….
  stmt.close();
  conn.close();
 }
 catch (SQLException sqle) { 
  System.out.println("SQLException : " + sqle);
 }
}
```
## Database Queries using JDBC

#### Update to the Database

```java
try {
 stmt.executeUpdate(
 "insert into instructor values('77987', 'Kim', 'Physics', 98000)");
 } catch (SQLException sqle)
{
 System.out.println("Could not insert tuple. " + sqle);
}
```

#### Execute Query and Fetch Print Results

```java
ResultSet rset = stmt.executeQuery(
"select dept_name, avg (salary)
from instructor
group by dept_name");
while (rset.next()) {
System.out.println(rset.getString("dept_name") + " " +
rset.getFloat(2));
}

```
#### Getting Result Fields

```java
rs.getString(“dept_name”); //and 
rs.getString(1); //equivalent if dept_name is the first argument of select result
```

#### Dealing with NULL Values

```java
int a = rs.getInt(“a”);
if (rs.wasNull())
{
 Systems.out.println(“Got null value”);
}
```
#### Call some functions or procedures

```java
CallableStatement cStmt1 = conn.prepareCall("{? = call some function(?)}");
CallableStatement cStmt2 = conn.prepareCall("{call some procedure(?,?)}");
```

## SQL Injection and its Prevention using Prepared Statements

![SQL Injection Meme](https://github.com/mirzaazwad/CSE4307_DatabaseManagementSystem/blob/main/Lab-08%20JDBC%20Tutorial/SQLInjectionMeme.jpg)

In computing, SQL injection is a code injection technique used to attack data-driven applications, in which malicious SQL statements are inserted into an entry field for execution (e.g. to dump the database contents to the attacker). SQL injection must exploit a security vulnerability in an application's software, for example, when user input is either incorrectly filtered for string literal escape characters embedded in SQL statements or user input is not strongly typed and unexpectedly executed. SQL injection is mostly known as an attack vector for websites but can be used to attack any type of SQL database.

A step by step introduction:

* Suppose a query is constructed of the form:
```java
"select * from instructor where name = '" + name + "'"
```
* Suppose the user enters:
```sql
X' or 'Y' = 'Y
```
* Then the resulting statement becomes:
```java
"select * from instructor where name = '" + "X' or 'Y' = 'Y" + "'"
```
which is basically
```sql
 select * from instructor where name = 'X' or 'Y' = 'Y'
```
* User could even update his/her salary
```sql
X'; update instructor set salary = salary + 10000 where name='Anne'; -
```
* So we understand that it isn't the best idea to create queries by concatenating strings in the following manner:
```java
"insert into instructor values(' " + ID + " ', ' " + name + " ', " + " ' + dept name + " ', " ' balance + ')"
```
Also in the above mentioned example of concatenating strings, what if the name was *D'Souza*?
Always go for prepared statements as shown below for taking input from user that would be passed as a query to the database. _*ALWAYS USE PREPARED STATEMENTS WITH USER INPUT AS PARAMETERS*_.

#### SQLi Prevention mechanism using JDBC - Prepared Statements

The solution to the aforementioned SQL Injection Problem is the use of prepared statements
```java
PreparedStatement pStmt = conn.prepareStatement("insert into instructor values(?,?,?,?)"); // ? mark is a wildcard similar to its application in generics
pStmt.setString(1, "88877");//set the first wildcard(?) to 88877
pStmt.setString(2, "Perry"); //set the second wildcard(?) to Perry
pStmt.setString(3, "Finance");//set the third wildcard(?) to Finance
pStmt.setInt(4, 125000);//set the fourth wildcard(?) to 125000
pStmt.executeUpdate();
pStmt.setString(1, "88878");
pStmt.executeUpdate(); // insert statements aren't executed before executeUpdate is called when it is called it inserts with the replaced values by setString
```

Prepared stament internally uses:
```sql
select * from instructor where name = 'X\' or \'Y\' = \'Y'
```
Which is essentially a sort of filtration or sanitisation


## Metadata

Metadata is essentially a set of data that describes and gives information about other data. 

#### **ResultSet metadata**
In Java, we use ResultSetMetaData which is ResultSet for metadata.
For instance, we execute a query to get the ResultSet rs, then to get metadata:

```java
ResultSetMetaData rsmd = rs.getMetaData();
for(int i = 1; i <= rsmd.getColumnCount(); i++) {
 System.out.println(rsmd.getColumnName(i));
 System.out.println(rsmd.getColumnTypeName(i));
}
```

#### **Database metadata**

###### **Get All the column names**
```java
DatabaseMetaData dbmd = conn.getMetaData();
// Arguments to getColumns: Catalog, Schema-pattern, Table-pattern,
// and Column-Pattern
// Returns: One row for each column; row has a number of attributes
// such as COLUMN_NAME, TYPE_NAME
// The value null indicates all Catalogs/Schemas. 
// The value “” indicates current catalog/schema
// The value “%” has the same meaning as SQL like clause
ResultSet rs = dbmd.getColumns(null, "univdb", "department", "%");
while( rs.next()) {
 System.out.println(rs.getString("COLUMN_NAME"),
 rs.getString("TYPE_NAME");
}
```
and

###### **Get All the table names**
```java
DatabaseMetaData dbmd = conn.getMetaData();
// Arguments to getTables: Catalog, Schema-pattern, Table-pattern,
// and Table-Type
// Returns: One row for each table; row has a number of attributes
// such as TABLE_NAME, TABLE_CAT, TABLE_TYPE, ..
// The value null indicates all Catalogs/Schemas. 
// The value “” indicates current catalog/schema
// The value “%” has the same meaning as SQL like clause
// The last attribute is an array of types of tables to return. 
// TABLE means only regular tables
ResultSet rs = dbmd.getTables ("", "", "%", new String[] {"TABLES"});
while( rs.next()) {
 System.out.println(rs.getString(“TABLE_NAME“));
}
```

#### **Application of metadata - Finding Primary Key**

```java
DatabaseMetaData dmd = connection.getMetaData();
// Arguments below are: Catalog, Schema, and Table
// The value “” for Catalog/Schema indicates current catalog/schema
// The value null indicates all catalogs/schemas
ResultSet rs = dmd.getPrimaryKeys("", "", tableName);
while(rs.next()){
// KEY_SEQ indicates the position of the attribute in 
// the primary key, which is required if a primary key has multiple
// attributes
System.out.println(rs.getString(“KEY_SEQ”), 
rs.getString("COLUMN_NAME");
}
```
## Transaction Control in JDBC

The default system is to commit SQL statements automatically where each SQL statement is viewed as a seperate transaction. BUT, this is a bad idea for transactions with multiple updates. The solution:

Can turn off automatic commits on a connection:
```java
conn.setAutoCommit(false); //setting it to true can turn on automatic commit if needed
```
Transactions can and must then be:
Commited Using:
```java
 conn.commit();
```
Rollback can also be performed for the immediate last commit using:
```java
conn.rollback();
```
## Handling Large Object Types

* ``` getBlob()``` and ``` getClob()``` are similar to the ``` getString()``` method but returns blob and clob respectively.
* get data from these objects using ```java getBytes()```
* associate an open stream with Java Blob or Clob object to update large objects. 
```java
blob.setBlob(int parameterIndex, InputStream inputStream)
```

[For More Information regarding JDBC, Click Here](https://docs.oracle.com/javase/tutorial/jdbc/index.html)


 
