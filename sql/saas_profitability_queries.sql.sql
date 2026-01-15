select * 
from saas_sales;

SELECT 
    COUNT(*) AS total_rows_in_file
FROM saas_sales;
 
select 
count("order id") AS Total_order_id
from saas_sales;
select 
COUNT(*) - COUNT("Order ID") AS null_rows_found
FROM saas_sales;

select "industry",
count(*) AS Transaction_count,
round(sum("Sales"), 2) as total_sales,
round(sum("Profit"), 2) as total_profits
from saas_sales
where "order id" is not null
group by Industry
order by total_sales desc;

SELECT 
    "Order ID", 
    "Customer", 
    "Sales", 
    "Discount", 
    "Profit"
FROM saas_sales
WHERE "Profit" < 0
ORDER BY "Profit" ASC
LIMIT 10;

SELECT COUNT(*) 
FROM saas_sales
WHERE Sales > 0;

SELECT 
    COUNT(DISTINCT industry) AS unique_industries
FROM saas_sales
WHERE "row id" IS NOT NULL;

select
count(distinct product) as unique_product
from saas_sales
where "row id" IS NOT NULL;

select
count(distinct country) as unique_country
from saas_sales
where "row id" IS NOT NULL;

select 
sum(case when "customer id" is null then 1 else 0 end) as missing_customer_id
from saas_sales
where "row id" IS NOT NULL;

select 
sum(case when "sales" is null then 1 else 0 end) as missing_sales_values
from saas_sales
where "row id" IS NOT NULL;

SELECT 
    "Order Date", 
    "Date key",
LENGTH(CAST("Date key" AS char )) AS Date_Key_length
FROM saas_sales
WHERE "row id" IS NOT NULL
LIMIT 10;

SELECT 
    "order id", 
    "Sales", 
    "profit", 
    (profit / NULLIF(sales, 0)) * 100 AS profit_margin_percent
FROM saas_sales
WHERE "row id" IS NOT NULL
ORDER BY profit_margin_percent DESC
LIMIT 10;

CREATE TABLE saas_model_ready AS
SELECT 
    `Order ID`, 
    `Order Date`, 
    `Customer`, 
    `Industry`, 
    `Segment`, 
    `Product`, 
    `Region`,
    `Sales`, 
    `Quantity`, 
    `Discount`, 
    `Profit`,
    (`Profit` / NULLIF(`Sales`, 0)) * 100 AS Profit_Margin
    from saas_sales;
    
    select 
    CASE 
        WHEN `Discount` > 0.3 THEN 'Aggressive' 
        WHEN `Discount` > 0 THEN 'Standard'
        ELSE 'None' 
    END AS Discount_Strategy
FROM saas_sales
WHERE `Order ID` IS NOT NULL;

SELECT 
    Industry, 
    Region, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin), 2) AS Avg_Margin_Percent,
    COUNT(`Order ID`) AS Number_of_Orders
FROM saas_model_ready
GROUP BY Industry, Region
ORDER BY Total_Profit DESC;

SELECT 
    "Discount", 
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin), 2) AS Avg_Profit_Margin
FROM saas_model_ready
GROUP BY Discount
ORDER BY Avg_Profit_Margin DESC;

SELECT 
    Product, 
    Discount, 
    AVG(Profit_Margin) as Avg_Margin, 
    COUNT(*) as Transaction_Count
FROM saas_model_ready
WHERE Profit_Margin < -100
GROUP BY Product, Discount
ORDER BY Avg_Margin ASC;

SELECT 
    Discount,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM saas_model_ready)), 2) AS Percent_of_Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales_Value
FROM saas_model_ready
GROUP BY Discount;

CREATE VIEW management_risk_monitor AS
SELECT 
    `Order ID`, 
    `Customer`, 
    `Industry`, 
    `Sales`, 
    `Profit`, 
    `Discount`,
    CASE 
        WHEN `Profit` < 0 THEN 'IMMEDIATE ACTION REQUIRED'
        WHEN `Profit_Margin` < 10 THEN 'MANDATORY REVIEW'
        ELSE 'PROFITABLE'
    END AS Management_Alert
FROM saas_model_ready
WHERE `Profit` <= 0 
ORDER BY `Profit` ASC;

select *
from management_risk_monitor;