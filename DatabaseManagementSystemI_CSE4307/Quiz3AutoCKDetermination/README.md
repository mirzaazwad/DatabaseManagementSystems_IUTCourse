
# CSE 4307: Database Management Systems
## Assignment for Quiz 3 Full Marks: 15
#### Last date of submission: December 27, 2022
#### Submission should be done through the Google Classroom.
1. Write a program using any suitable programming language to deduce all possible Candidate (15)
Keys (CKs) for a given Relation (R) and a set of Functional Dependencies (FDs) (CO1,PO1)
Followings are the instructions and conventions for the given task.

- You should use **Only Method 3** for finding all possible CKs. **See the corresponding class
lecture for details of Method 3**.

- The input should be in text file such as input.txt. The file should have entries as follows
(as an example): (all entries are in UPPER CASE letter)
**sample input.txt**
```
R(A,B,C,D)

A->B, B->C, D->A
```
It implies that line no. 1 contains the Relation where attributes are enclosed withing
( , , ) and each attribute is separated by a comma ,
FDs are given in line no.2, each FD is separated by a comma ,
the arrow symbol is denoted by ->


- The program should write all possible CKs in another file such as output.txt. Sample
entry for output.txt is given bellow :

**sample output.txt**
```
There are a total of 3 possible CKs. They are given below:

CK1: AB

CK2: BD

CK3: CD
```
- The program should be able to run correctly in each new settings of **input.txt**

Note: Assignment should be submitted

to a single .zip file where both sources and text
files should exist. The sources must be commented properly. The program must be runnable
independently.
