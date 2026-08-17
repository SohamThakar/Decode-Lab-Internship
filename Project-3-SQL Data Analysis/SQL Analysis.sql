CREATE DATABASE PROJECT;
USE PROJECT;
CREATE TABLE sales (
      OrderID TEXT, Date TEXT, CustomerID TEXT, Product TEXT,
      Quantity INTEGER, UnitPrice REAL, ShippingAddress TEXT,
      PaymentMethod TEXT, OrderStatus TEXT, TrackingNumber TEXT,
      ItemsInCart INTEGER, CouponCode TEXT, ReferralSource TEXT,
      TotalPrice REAL
  );
LOAD DATA LOCAL INFILE 'C:\\Users\\Ghansham Belekar\\Downloads\\Dataset for Data Analytics.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * 
FROM sales;

SELECT * 
FROM sales 
limit 10;

select * 
from sales 
where CouponCode ='';

UPDATE sales 
SET CouponCode='NO Coupon' 
WHERE CouponCode='';

select *
from sales 
where CouponCode ='';


#Exploring Table

select distinct Product 
from sales;

select distinct Product,AVG(TotalPrice) as average 
from sales 
GROUP BY Product ;

select PaymentMethod ,count(*) as count from
sales group by 
PaymentMethod ;

select ReferralSource ,count(*) as count 
from sales 
group by ReferralSource;

select count(OrderStatus)
from sales 
where OrderStatus='Delivered';

select count(OrderStatus) 
from sales 
where OrderStatus='Cancelled';

select  OrderId,Product,OrderStatus,TotalPrice 
from sales 
Order by TotalPrice DESC;

select PaymentMethod,sum(TotalPrice) as Revenue 
from sales 
Group by PaymentMethod;

select PaymentMethod,sum(TotalPrice) as Revenue 
from sales 
Group by PaymentMethod
Order By Revenue 
DESC 
limit 2;

select product,sum(TotalPrice) as Revenue 
from sales 
Group by Product 
Order by Revenue 
DESC ;

select PaymentMethod,count(*) as count 
from sales 
Group by PaymentMethod 
Order by count 
DESC limit 3;