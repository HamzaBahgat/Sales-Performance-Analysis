Create database Sample_Superstore;

use Sample_Superstore;

/*

*/
select * from Superstore;


--		1- Top 10 most profit
select top 10 
Customer_Name,Product_Name,sum(Profit) as Total_Profit
	from Superstore
group by Product_Name,Customer_Name
order by Total_Profit desc;
	



--		2- show OrderID and Customer Name where is Sales > $1000

select Order_ID, Customer_Name, Sales
	from Superstore
	where Sales> 1000
	order by Sales asc;
	


--		3- Orders from a specific region (  )

select Order_Date,Customer_Name,City,Category,Sales,Cost,Quantity,Profit,Ship_Days
	from Superstore
	where  Region = 'South'
	order by Order_Date asc;
	
	

--		4- Which regions or customer segments should we focus on for growth?
--			Home Office by segment 
--			 Central and South by regions
select 
	distinct COUNT(Order_ID) as total_Order , Segment , sum(Profit) as Total_Profit
	from Superstore
	group by Segment
	order by Total_Profit asc;
Go
select 
	distinct COUNT(Order_ID) as total_Order , Region , sum(Profit) as Total_Profit
	from Superstore
	group by Region
	order by Total_Profit;
GO


--		5- Which product categories generate the most profit?
--			Technology 
select 
	Category , SUM(Profit) as Total_Profit
	from Superstore
	group by Category
	order by Total_Profit desc;
Go


--		6- Which product category has the highest total sales?
	-- Technology

select 
	Category , SUM(Sales) as Total_sales
	from Superstore
	group by Category
	order by Total_sales desc;


go
--		7- Which 'Ship Mode' is used most frequently, and what is its average 'Ship Days'?

select  top 1
	Ship_Mode, COUNT(*) as OrderCount, AVG(DATEDIFF(DAY,Order_Date,Ship_Date)) as Avg_ShipDays
	from Superstore
	group by Ship_Mode
	order by OrderCount desc;
Go


--		8- What is the total quantity of products sold for each 'Sub-Category'?

select 
	Sub_Category , SUM(Quantity) as Total_Quantity
	from Superstore
	group by Sub_Category
	order by Total_Quantity desc;





--		9- What is the category that is highest each year?
select 
	Category ,Year,SUM(Sales) as Total_Sales 
	from Superstore
	group by Category,Year
	order by Year desc;


--		10-Which combination of product category and customer segment generates the highest profit margin?

select 
	Category , Segment , SUM(Sales) as Total_Sales , SUM(Profit) as Total_Profit
	,round (SUM(Profit)/SUM(Sales)*100,2) as Profit_Margin
	from Superstore
	group by Category, Segment
	order by Profit_Margin desc;