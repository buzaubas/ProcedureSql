with ProductsCategory as
(select p.CategoryID, 
		count(1) as cnt
from Products p 
join Categories c on p.CategoryID = c.CategoryID
group  by p.CategoryID, c.CategoryName)

select * from ProductsCategory p  --второй раз обратиться нельзя, так как создается во время выполнения
where p.cnt > 10

declare @name NVARCHAR(20), @age INT;
set @name = 'Dimash';
set @age = 18;
print 'Name ' + @name;
print 'Age ' + convert(char, @age);

declare @MyTableLondon table(Id int not null, FirstName varchar(100), Title varchar(100), City varchar(100));
insert @MyTableLondon
select EmployeeID, FirstName, Title, City 
from Employees where City = 'London';

select * from @MyTableLondon

print 'Today is a day of ' + convert(varchar, getdate());
--////////////////////////////////--
declare @msg nvarchar(50);
set @msg = 'Today ' + cast(getdate() as nvarchar(30)) + '.';
print @msg;


declare @maxPrice MONEY,
		@minPrice MONEY,
		@dif MONEY,
		@count int;
set @count = (select sum(o.Quantity) from [Order Details] o);

select @minPrice=MIN(p.UnitPrice), @maxPrice = MAX(p.UnitPrice) from Products p;

set @dif = @maxPrice - @minPrice;

print 'Total ' + str(@count, 5);
print 'Difference ' + str(@dif);

select * from Products
select * from Categories

declare @Bevarages table(Category nvarchar(100), Number int)
insert @Bevarages
select CategoryName, 
		count(1) as cnt
from Products p 
join Categories c on p.CategoryID = c.CategoryID
group  by p.CategoryID, c.CategoryName

select * from @Bevarages where Category = 'Beverages';

select * from Employees

create procedure AddEmployees
		@FirstName nvarchar(100),
		@LastName nvarchar(100),
		@Title nvarchar(100),
		@City nvarchar(100)
as
insert into Employees(LastName, FirstName, Title, City)
values (@LastName, @FirstName, @Title, @City)


declare @newFName nvarchar(100);
declare @newLName nvarchar(100);
declare @newTitle nvarchar(100);
declare @newCity nvarchar(100);
set @newFName = 'Dimash';
set @newLName = 'Bexultanov';
set @newTitle = 'CEO';
set @newCity = 'Almaty';

exec AddEmployees @newFName, @newLName, @newTitle, @newCity;

--***************************************************************************--
select * from Suppliers

create procedure SearchSupplier
		@Country nvarchar(100)
as
select CompanyName, count(1) as cnt from Suppliers where Country = @Country group by CompanyName;

declare @var nvarchar(100)
set @var = 'UK';

exec SearchSupplier @var;
