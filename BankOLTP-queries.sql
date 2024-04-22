CREATE TABLE City (
    City_id INT PRIMARY KEY IDENTITY,
    City_name VARCHAR(100),
    State VARCHAR(50),
    City_population INT
);

Insert into City(City_name,State,City_population)
select city,State,City_pop
from 
dbo.banktransaction
group by
city,State,City_pop
order by city;



CREATE TABLE Address (
    ADDR_id INT PRIMARY KEY IDENTITY,
    Street VARCHAR(100),
    Zip VARCHAR(10),
    Lat DECIMAL(9, 6),
    Long DECIMAL(9, 6),
    City_id INT,
    CONSTRAINT FK_City FOREIGN KEY (City_id) REFERENCES City(City_id)
);


Insert into Address(Street,Zip,Lat,Long,City_id)
select street,zip,lat,Long,b.City_id
from
banktransaction a
join city b
on a.city=b.City_name
and a.state=b.state
group by street,zip,lat,Long,a.city,a.state,b.City_id
order by City_id;


CREATE TABLE Customer (
    CUST_ID INT PRIMARY KEY IDENTITY,
    First_Name NVARCHAR(50),
	Last_Name NVARCHAR(50),
	Credit_Card_Number bigint,
	Gender CHAR(1),
	Job NVARCHAR(100),
	Date_Of_Birth date,
	ADDR_id INT,
    CONSTRAINT FK_Address FOREIGN KEY (ADDR_id) REFERENCES dbo.Address(ADDR_id)
);


Insert into Customer(First_Name,Last_Name,Credit_Card_Number,Gender,Job,Date_Of_Birth,ADDR_id)
select first,last,cc_num,gender,job,dob,b.ADDR_id
from banktransaction a
join Address b
on a.street=b.Street
and a.zip=b.Zip
group by first,last,cc_num,gender,job,dob,b.ADDR_id
order by cc_num;


CREATE TABLE Category (
    Category_id INT PRIMARY KEY IDENTITY,
    Category_name VARCHAR(50),
);

insert into Category(Category_name)
select category from  bankTransaction
group by category;


CREATE TABLE Merchant (
    Merchant_ID INT PRIMARY KEY IDENTITY,
    Merchant_Name NVARCHAR(50),
	Lat NVARCHAR(50),
	Long NVARCHAR(50),
	Category_id INT,
    CONSTRAINT FK_Category FOREIGN KEY (Category_id) REFERENCES Category(Category_id)
);


insert into Merchant(Merchant_Name,Lat,Long,Category_id)
select Merchant,merch_lat,merch_long,b.Category_id
from BankTransaction a
join Category b
on a.Category=b.Category_name
group by Merchant,merch_lat,merch_long,b.Category_id;


CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY IDENTITY,
    Amount Decimal(10,2),
	Transaction_TimeStamp DateTime2,
	Unix_Time int,
	Is_Fraud BIT,

	Cust_id INT,
    CONSTRAINT FK_Customer FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),

	Merchant_id INT,
    CONSTRAINT FK_Merchant FOREIGN KEY (Merchant_id) REFERENCES Merchant(Merchant_id)
);


insert into Transactions(Amount,Transaction_TimeStamp,
Unix_Time,Is_Fraud,Cust_id,Merchant_id)
Select amt,trans_date_trans_time,unix_time,is_fraud,CUST_ID,Merchant_ID
from BankTransaction a
join Merchant b
on a.merchant=b.Merchant_Name
and a.merch_lat=b.Lat
and a.merch_long=b.Long
join Customer c
on a.cc_num=c.Credit_Card_Number
order by trans_date_trans_time;









