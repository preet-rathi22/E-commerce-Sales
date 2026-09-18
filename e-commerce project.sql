create database ecommerce_db1;

USE ecommerce_db1;


-- 1. Total Orders
SELECT COUNT(*) AS Total_Orders
FROM orders;


-- 2. Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM orders;


-- 3. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM orders;


-- 4. Total Quantity
SELECT SUM(Quantity) AS Total_Quantity
FROM orders;


-- 5. Average Sales
SELECT AVG(Sales) AS Average_Sales
FROM orders;


-- 6. Category-wise Sales
SELECT Category, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 7. Sub-category-wise Sales
SELECT Sub_Category, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;


-- 8. Sub-category-wise Profit
SELECT Sub_Category, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;


-- 9. State-wise Sales
SELECT State, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY State
ORDER BY Total_Sales DESC;


-- 10. Monthly Sales
SELECT MONTH(Order_Date) AS Month,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;


-- 11. Top 10 Customers by Sales
SELECT Customer_Name,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 12. Top 10 Products by Sales
SELECT Product,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;


-- 13. Loss-making Products
SELECT Product,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- 14. Lowest 10 Products by Profit
SELECT Product,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product
ORDER BY Total_Profit ASC
LIMIT 10;


-- 15. Category-wise Profit
SELECT Category,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;


-- 16. Category-wise Quantity
SELECT Category,
       SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Category
ORDER BY Total_Quantity DESC;


-- 17. State-wise Profit
SELECT State,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit DESC;


-- 18. Monthly Profit
SELECT MONTH(Order_Date) AS Month,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;


-- 19. Top 10 Customers by Profit
SELECT Customer_Name,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10;


-- 20. Top 10 Products by Profit
SELECT Product,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;


-- 21. Average Discount by Category
SELECT Category,
       AVG(Discount) AS Average_Discount
FROM orders
GROUP BY Category
ORDER BY Average_Discount DESC;


-- 22. Discount vs Sales & Profit
SELECT Discount,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;


-- 23. City-wise Sales
SELECT City,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY City
ORDER BY Total_Sales DESC;


-- 24. City-wise Profit
SELECT City,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY City
ORDER BY Total_Profit DESC;


-- 25. Category + Sub-category Sales & Profit
SELECT Category,
       Sub_Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category, Sub_Category
ORDER BY Total_Profit DESC;


-- 26. Category + Sub-category Quantity
SELECT Category,
       Sub_Category,
       SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Category, Sub_Category
ORDER BY Total_Quantity DESC;


-- 27. Orders by State
SELECT State,
       COUNT(*) AS Total_Orders
FROM orders
GROUP BY State
ORDER BY Total_Orders DESC;


-- 28. Sales per Order
SELECT COUNT(*) AS Total_Orders,
       SUM(Sales) AS Total_Sales,
       SUM(Sales) / COUNT(*) AS Sales_Per_Order
FROM orders;


-- 29. Profit Margin
SELECT SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percentage
FROM orders;


-- 30. Duplicate Order ID Check
SELECT Order_ID,
       COUNT(*) AS Duplicate_Count
FROM orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;


-- 31. NULL / Blank Check
SELECT
    SUM(Order_ID IS NULL) AS Order_ID_Blank,
    SUM(Customer_Name IS NULL) AS Customer_Blank,
    SUM(Category IS NULL) AS Category_Blank,
    SUM(Sub_Category IS NULL) AS Sub_Category_Blank,
    SUM(Product IS NULL) AS Product_Blank,
    SUM(Quantity IS NULL) AS Quantity_Blank,
    SUM(Sales IS NULL) AS Sales_Blank,
    SUM(Discount IS NULL) AS Discount_Blank,
    SUM(Profit IS NULL) AS Profit_Blank,
    SUM(City IS NULL) AS City_Blank,
    SUM(State IS NULL) AS State_Blank
FROM orders;


-- 32. CASE WHEN - Product Profit Status
SELECT Product,
       SUM(Profit) AS Total_Profit,
       CASE
           WHEN SUM(Profit) > 0 THEN 'Profitable'
           WHEN SUM(Profit) < 0 THEN 'Loss'
           ELSE 'No Profit No Loss'
       END AS Profit_Status
FROM orders
GROUP BY Product
ORDER BY Total_Profit DESC;


-- 33. Subquery - Above Average Product Sales
SELECT Product,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Product
HAVING SUM(Sales) > (
    SELECT AVG(Product_Sales)
    FROM (
        SELECT SUM(Sales) AS Product_Sales
        FROM orders
        GROUP BY Product
    ) AS Product_Total
)
ORDER BY Total_Sales DESC;


-- 34. Top 5 Products by Profit
SELECT Product,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;


-- 35. Final Project Summary
SELECT
    COUNT(*) AS Total_Records,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Sales) AS Average_Sales,
    (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
FROM orders;