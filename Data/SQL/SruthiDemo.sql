create database sruthi;

Create Table tblGen
(ID int not null Primary Key,
Gender varchar(50))

INSERT INTO tblPerson (Id, Name, Email, GenderId)
VALUES (1, 'Tom', 'Tom@gmail.com', 1),
 (2, 'Jessy', 'Jessy@gmail.com', 2),
 (3, 'Kristy', 'Kristy@gmail.com', 2),
 (4, 'John', 'John@gmail.com', 1),
 (5, 'Rob', 'Rob@gmail.com', 1)

 INSERT INTO tblGen (ID, Gender)
 VALUES (1, 'Male'),
  (2, 'Female'),
  (3, 'Others')

  UPDATE tblPerson
  SET Email = 'TomUpdated@gmail.com'
  Where Name= 'Tom'

  select * from tblPerson

  Update tblPerson
  Set GenderId = 1
  Where Id = 2

  DELETE from tblPerson
  Where Id=3;

  Create Table Student
  (Name varchar(50),
   Age int,
   class int)

   Create Table Courses
   (Subject varchar(50),
    Teacher varchar(50),
	DurationInHours int)

	Insert into Student (Name, Age, Class)
	Values ('Jose', 10, 5)
	
	select * from Courses;

	Insert Into Courses (Subject, Teacher, DurationInHours)
	Values ('Science', 'Einstein', 20),
	('Tamil', 'Barat', 30)


