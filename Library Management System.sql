
Create database Project_Library_System

use Project_Library_System

Create table Book(
ID              int          Not Null Primary Key ,
Book_Name       nvarchar(25) Not Null ,
Author_ID       int          Not Null ,
Category_ID     int          Not Null ,
Country_ID      int          Not Null ,
Dar_elnashr_ID  int          Not Null ,
Place_ID        int          Not Null ,
Page_Num        int          Not Null ,
Create_Date     date         Not Null ,
Book_Price      real         Not Null
)


Create table Author(
ID          int          Not Null Primary Key ,
Author_Name nvarchar(25) Not Null ,
Date_born   date         Not Null ,
Country     nvarchar(25) Not Null ,
)

Create table Book_Borrow(
ID          int          Not Null Primary Key ,
Book_ID     int          Not Null ,
Borrower_ID int          Not Null ,
Start_Date  date         Not Null ,
End_Date    date         Not Null
)
 
Create table Borrower(
ID            int          Not Null Primary Key ,
Borrower_Name nvarchar(25) Not Null ,
Date_Borrow   date         Not Null ,
tel           nvarchar(11) Not Null ,
)

Create table Category(
ID            int          Not Null Primary Key ,
Category_Name nvarchar(25) Not Null 
)

Create table Country(
ID            int          Not Null Primary Key ,
Country_Name nvarchar(25)  Not Null 
)

Create table Place(
ID            int          Not Null Primary Key ,
Place_Name nvarchar(25)    Not Null 
)

Create table Dar_elnashr(
ID               int          Not Null Primary Key ,
Dar_elnashr_Name nvarchar(25) Not Null ,
Country          nvarchar(25) Not Null 
)


/*	Insert Statement  */ 


insert into Country values (1 ,'Egypt')
insert into Country values (2 ,'Austria')
insert into Country values (3 ,'China')
insert into Country values (4 ,'Ecuador')
insert into Country values (5 ,'India')
insert into Country values (6 ,'Iraq')


insert into Place values (1 ,'Paris')
insert into Place values (2 ,'Rome')
insert into Place values (3 ,'Beijing')
insert into Place values (4 ,'Tokyo')
insert into Place values (5 ,'Berlin')
insert into Place values (6 ,'Giza')

insert into Category values (1 ,'Horror')
insert into Category values (2 ,'Rome')
insert into Category values (3 ,'Fable')
insert into Category values (4 ,'Romance')
insert into Category values (5 ,'Classic')

insert into Dar_elnashr values (1 ,'Dar Majallat','Cairo')
insert into Dar_elnashr values (2 ,'Dar al-Bayan','Kuwait')
insert into Dar_elnashr values (3 ,'Dar Elsalam','Giza')

insert into Author values (1 ,'Amitav Ghose','2000-02-11','China')
insert into Author values (2 ,'Alexander Dumas','2006-06-23','Ecuador')
insert into Author values (3 ,'Amartya Sen','2004-09-23','India')
insert into Author values (4 ,'Amrita Pritam','2005-06-03','Austria')
insert into Author values (5 ,'Amrita Pritam','2005-06-03','Austria')

insert into Book values (1 ,'The Three Musketeers',2,1,1,2,5,380,'2010-02-11',100)
insert into Book values (2 ,'River of Smoke',1,2,2,1,4,345,'2014-04-30',145)
insert into Book values (3 ,'Circle of Reason',3,3,3,2,3,764,'2016-10-02',212)
insert into Book values (4 ,'Death of City',3,4,4,1,2,876,'2011-06-21',244)
insert into Book values (5 ,'Politics',2,5,5,2,1,346,'2002-01-31',54)

insert into Borrower values (1 ,'Mohamed','2020-02-11','01244578912')
insert into Borrower values (2 ,'Ali','2019-06-23','01143348812')
insert into Borrower values (3 ,'Mohamed','2018-12-21','01254426942')
insert into Borrower values (4 ,'Hassan','2019-06-23','01041345842')

insert into Book_Borrow values (1 ,2,1,'2020-04-11','2020-04-17')
insert into Book_Borrow values (2 ,1,2,'2020-05-01','2020-05-07')
insert into Book_Borrow values (3 ,3,2,'2020-03-21','2020-03-27')
insert into Book_Borrow values (4 ,5,1,'2020-02-15','2020-02-21')


/*	select Statement  */ 

select * from Country
select * from Place
select * from Category
select * from Dar_elnashr
select * from Author
select * from Book
select * from Book_Borrow
select * from Borrower


/*	Select Statements using Sub Query   */ 

select * from Book
where ID not in ( select distinct ID from Book_Borrow)

select * from Place
where ID not in ( select distinct ID from Book)

select * from Country
where ID not in ( select distinct ID from Book)


/*  Select Statements using Count and Group Functions   */

select COUNT(ID) as Count_Book , Author_ID from Book group by Author_ID

select COUNT(ID) as Count_Book , Country_ID from Book group by Country_ID




 /*  Select Statements using Different Joins  */

SELECT Book_Borrow.ID, Book.Book_Name
FROM Book
INNER JOIN Book_Borrow ON Book_Borrow.Book_ID=Book.ID

SELECT Book_Borrow.ID, Book.Book_Name
FROM Book
LEFT JOIN Book_Borrow ON Book_Borrow.Book_ID=Book.ID
order by Book.ID

SELECT Book_Borrow.ID, Book.Book_Name
FROM Book
Right JOIN Book_Borrow ON Book_Borrow.Book_ID=Book.ID

/* Update Statement  */

update Borrower
set Borrower_Name = 'Ahmed' , Date_Borrow = '01-02-2019'
where ID = 1 

update Author
set Date_born = '01-06-1990'
where ID = 3 

update Place
set Place_Name = 'Cairo' 
where ID = 6 

update Book
set Book_Price = 345 
where ID = 3 

update Author
set Country = 'Egypt'
where ID = 5

/* 	Delete Statement  */

Delete from Author
where ID = 1

delete from Place
where Place_Name = 'Cairo'

Delete from Borrower
where Borrower_Name = 'Mohamed'

delete from Borrower
where Borrower_Name = 'Hassan'

delete from Dar_elnashr
where Dar_elnashr_Name = 'Dar Elsalam'