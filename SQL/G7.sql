CREATE TABLE Employee(
  Fname VARCHAR(20),
  Minit VARCHAR(3),
  Lname VARCHAR(25),
  Ssn CHAR(9) PRIMARY KEY,
  Bdate DATE,
  Address VARCHAR(40),
  Sex CHAR(1) CHECK(Sex='F' or Sex='M'),
  Salary INTEGER(7) NOT NULL CHECK(Salary>=0),
  Super_ssn CHAR(9) REFERENCES Department(Mgr_ssn),
  Dno CHAR(1) REFERENCES Department(Dnumber)
);

CREATE TABLE Department(
  Dname VARCHAR(20),
  Dnumber CHAR(1) PRIMARY KEY,
  Mgr_ssn CHAR(9),
  Mgr_start_date DATE
);

CREATE TABLE Dept_Locations(
  Dnumber CHAR(1) REFERENCES Department(Dnumber),
  Dlocation VARCHAR(20),
  PRIMARY KEY(Dnumber, Dlocation)
);

CREATE TABLE Works_On(
  Essn CHAR(9) REFERENCES Employee(Ssn),
  Pno CHAR(2) REFERENCES Project(Pnumber),
  Hours FLOAT,
  PRIMARY KEY(Essn, Pno)
);

CREATE TABLE Project(
  Pname VARCHAR(20),
  Pnumber CHAR(2) PRIMARY KEY,
  Plocation VARCHAR(20) REFERENCES Dept_Locations(Dlocation),
  Dnum CHAR(1) REFERENCES Department(Dnumber)
);

CREATE TABLE Dependent(
  Essn CHAR(9) REFERENCES Employee(Ssn),
  Dependent_name VARCHAR(20),
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(15)
);

INSERT INTO Employee VALUES('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', '5');
INSERT INTO Employee VALUES('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', '5');
INSERT INTO Employee VALUES('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', '4');
INSERT INTO Employee VALUES('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '921 Berry, Bellaire, TX', 'F', 43000, '888665555', '4');
INSERT INTO Employee VALUES('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', '5');
INSERT INTO Employee VALUES('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', '5');
INSERT INTO Employee VALUES('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', '4');
INSERT INTO Employee VALUES('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, '1');

INSERT INTO Department VALUES('Research', '5', '333445555', '1988-05-22');
INSERT INTO Department VALUES('Administration', '4', '987654321', '1995-01-01');
INSERT INTO Department VALUES('Headquarters', '1', '888665555', '1981-06-19');

INSERT INTO Dept_Locations VALUES('1', 'Houston');
INSERT INTO Dept_Locations VALUES('4', 'Stafford');
INSERT INTO Dept_Locations VALUES('5', 'Bellaire');
INSERT INTO Dept_Locations VALUES('5', 'Sugarland');
INSERT INTO Dept_Locations VALUES('5', 'Houston');

INSERT INTO Works_On VALUES('123456789', '1', 32.5);
INSERT INTO Works_On VALUES('123456789', '2', 7.5);
INSERT INTO Works_On VALUES('666884444', '3', 40.0);
INSERT INTO Works_On VALUES('453453453', '1', 20.0);
INSERT INTO Works_On VALUES('453453453', '2', 20.0);
INSERT INTO Works_On VALUES('333445555', '2', 10.0);
INSERT INTO Works_On VALUES('333445555', '3', 10.0);
INSERT INTO Works_On VALUES('333445555', '10', 10.0);
INSERT INTO Works_On VALUES('333445555', '20', 10.0);
INSERT INTO Works_On VALUES('999887777', '30', 30.0);
INSERT INTO Works_On VALUES('999887777', '10', 10.0);
INSERT INTO Works_On VALUES('987987987', '10', 35.0);
INSERT INTO Works_On VALUES('987987987', '30', 5.0);
INSERT INTO Works_On VALUES('987654321', '30', 20.0);
INSERT INTO Works_On VALUES('987654321', '20', 15.0);
INSERT INTO Works_On VALUES('888665555', '20', NULL);

INSERT INTO Project VALUES('ProductX', '1', 'Bellaire', '5');
INSERT INTO Project VALUES('ProductY', '2', 'Sugarland', '5');
INSERT INTO Project VALUES('ProductZ', '3', 'Houston', '5');
INSERT INTO Project VALUES('Computerization', '10', 'Stafford', '4');
INSERT INTO Project VALUES('Reorganization', '20', 'Houston', '1');
INSERT INTO Project VALUES('Newbenefits', '30', 'Stafford', '4');

INSERT INTO Dependent VALUES('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO Dependent VALUES('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO Dependent VALUES('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO Dependent VALUES('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO Dependent VALUES('123456789', 'Michael', 'M', '1988-01-04', 'Son');
INSERT INTO Dependent VALUES('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO Dependent VALUES('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

SELECT Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno
FROM Employee;

SELECT Dname, Dnumber, Mgr_ssn, Mgr_start_date
FROM Department;

SELECT Dnumber, Dlocation
FROM Dept_Locations;

SELECT Essn, Pno, Hours
FROM Works_On;

SELECT Pname, Pnumber, Plocation, Dnum
FROM Project;

SELECT Essn, Dependent_name, Sex, Bdate, Relationship
FROM Dependent;


# a)
SELECT DISTINCT E.Fname, E.Lname
FROM Employee E, Works_On W, Project P
WHERE E.Dno = '5'and E.Ssn=W.Essn and W.Hours > 10.0 and W.Pno='1'; # and something about P.Pno is from productX ???

# b)
SELECT DISTINCT E.Fname, E.Lname
FROM Employee E, Dependent D
WHERE E.Ssn=D.Essn and E.Fname=D.Dependent_name;

# c)
SELECT DISTINCT E.Fname, E.Lname
FROM Employee E
WHERE E.Super_ssn=(SELECT E1.Ssn
                   FROM Employee E1
                   WHERE E1.Fname='Franklin' and E1.Lname='Wong'
                  );

# d)
SELECT Pname, SUM(Hours)
FROM Project, Works_On
WHERE Pno=Pnumber
GROUP BY Pno;

# e)
SELECT Fname, Lname
FROM Employee E
WHERE NOT EXISTS(SELECT P.Pnumber
                 FROM Project P
                 WHERE NOT EXISTS(SELECT *
                                  FROM Works_On W
                                  WHERE P.Pnumber=W.Pno AND W.Essn=E.Ssn));

# f)
SELECT DISTINCT Fname, Lname
FROM Employee
WHERE Ssn NOT IN  (SELECT DISTINCT Essn
                   FROM Works_On
                  );

# g)
SELECT AVG(Salary), Dname
FROM Department, Employee
WHERE Dnumber=Dno
GROUP BY Dname;

# h)
SELECT AVG(Salary)
FROM Employee
WHERE Sex='F';

# i)
SELECT E.Fname, E.Lname, E.Address
FROM Employee E
WHERE EXISTS(SELECT *
              FROM Works_On W, Project P
              WHERE E.Ssn=W.Essn AND W.Pno=P.Pnumber and P.Plocation='Houston')
              AND
              NOT EXISTS(SELECT *
                          FROM Dept_Locations L
                          WHERE E.Dno=L.Dnumber AND L.Dlocation='Houston');

# j)
SELECT E.Fname, E.Lname
FROM Employee E
WHERE EXISTS(SELECT *
              FROM Department D
              WHERE E.Ssn=D.Mgr_ssn)
              AND
              NOT EXISTS(SELECT *
              FROM Dependent Dp
              WHERE E.Ssn=Dp.Essn);


DROP TABLE Employee;
DROP TABLE Department;
DROP TABLE Dept_Locations;
DROP TABLE Works_On;
DROP TABLE Project;
DROP TABLE Dependent;




