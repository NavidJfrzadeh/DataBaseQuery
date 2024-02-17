--Create DataBase LibraryApp

create table Genre(
Id int Identity(1,1) Primary Key,
Title NvarChar(50)
);

create table City(
Id int Identity(1,1) Primary Key,
Title Nvarchar(50)
);

--Member
create table Member(
Id int Identity(1,1) Primary Key,
FirstName NVarChar(50),
LastName NvarChar(100),
Modile varchar(15),
Code BigInt,
Age TinyInt,
RegisterDate Date
);


Create Table Address(
Id int Identity(1,1) Primary Key,
Title NvarChar(50),
Description NvarChar(250),
CityId int Foreign Key References dbo.City(Id)
);


--create address
If Object_Id('dbo.City') is not null
Begin
	Create Table Address(
	Id int Identity(1,1) Primary Key,
	Title NvarChar(50),
	Description NvarChar(250),
	CityId int Foreign Key References dbo.City(Id),
	MemberId int Foreign Key References dbo.Member(Id)
	);
end
else
Begin
	create table City(
	Id int Identity(1,1) Primary Key,
	Title Nvarchar(50)
	);
end

--create book
IF OBJECT_ID('dbo.Genre') IS NOT NULL
BEGIN
    CREATE TABLE Book (
        Id int IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(50),
        GenreId INT Foreign Key references dbo.Genre(Id),
        --CONSTRAINT FK_GenreId FOREIGN KEY (GenreId) REFERENCES Genre(Id)
    );
END
ELSE
BEGIN
    create table Genre(
	Id int Identity(1,1) Primary Key,
	Title NvarChar(50)
	);

	--ALTER TABLE table_name
	--ADD CONSTRAINT fk_constraint_name
	--FOREIGN KEY (column_name)
	--REFERENCES referenced_table(referenced_column);
END


--create many to many relations between book and Genre
Create Table BookGenre(
Id int Identity(1,1) Primary Key,
bookId int Foreign Key REferences dbo.book(Id),
GenreId int Foreign Key References dbo.Genre(Id),
);

--create many to many relations between member and book
Create Table BookMember(
Id int Identity(1,1) Primary Key,
bookId int foreign Key References dbo.book(Id),
MemberId int foreign Key references dbo.Member(Id)
);

--create a backup BackUpMember
CREATE TABLE BackUpMember as
SELECT * FROM dbo.Member


-- get members who registered last 15 days
select * from dbo.Member m
where m.RegisterDate >= GETDATE() - day(15)
-- another solution
select * from dbo.Member m
where m.RegisterDate >= DATEADD(day,-15,getdate())


--count of each ages
select m.Age,count(m.Id) from dbo.Member m
group by m.Age

--show haow many books each person have
select m.firstname,m.lastname , count(bm.BookId) as[books Count]
from dbo.Member m 
join dbo.BookMember bm on m.Id = bm.bookId
group by m.firstname,m.lastname

--number of register users group by year
select year(m.RegisterDate) as [year],count(m.id) from dbo.Member m
group by year(m.RegisterDate)
having m.RegisterDate is not null


--group by year and then group by month
select year(m.RegisterDate) as [year],MONTH(m.registerDate) as [month] ,count(m.id)
from dbo.Member m
group by year(m.RegisterDate),MONTH(m.registerDate)
order by year(m.RegisterDate),month(m.RegisterDate)

--number of books borrowed in each genre
select g.Title , count(bm.memberId)
from dbo.Genre g
join dbo.Book b on b.GenreId = g.Id
join dbo.BookMember bm on bm.bookId = b.Id
group by g.Title

--retrun city for each members
select  c.title, m.firstname,m.lastname
from dbo.member m
join dbo.Address a on a.MemberId = m.Id
join dbo.City c on c.Id = a.CityId

