
SELECT COUNT(*) FROM superstore;

/* ------SELECT---------- */
/* All data */
SELECT * FROM superstore;
/* Only customer Name and sales */
SELECT `Customer Name`, Sales
FROM superstore;
/*Customer Name,category and profit*/
SELECT `Customer Name`, Category, Profit
FROM superstore;

/* --------WHERE-------*/
/*Sales>1000*/
SELECT *
FROM superstore
WHERE Sales > 1000;
/*Furniture Orders*/
SELECT *
FROM superstore
WHERE Category = 'Furniture';
/*Profit<0(Loss)*/
SELECT *
FROM superstore
WHERE Profit < 0;

/*------- ORDER BY -------*/
/*Highest Sales */
SELECT *
FROM superstore
ORDER BY Sales DESC;
/*Highest Profit*/
SELECT *
FROM superstore
ORDER BY Profit DESC;
/*Lowest Profit*/
SELECT *
FROM superstore
ORDER BY Profit ASC;

/*----------AGGREGATE FUNCTIONS-------*/
/*Total Sales */
SELECT SUM(Sales) AS Total_Sales
FROM superstore;
/*Average Sales */
SELECT AVG(Sales) AS Average_Sales
FROM superstore;
/*Maximum Sales*/
SELECT MAX(Sales) AS Highest_Sale
FROM superstore;
/*Minimum Sales*/
SELECT MIN(Sales) AS Lowest_Sale
FROM superstore;
/*Total Orders*/
SELECT COUNT(*) AS Total_Orders
FROM superstore;

/*------GROUP BY --------*/
/* Sales by Category */
SELECT Category,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;
/* Profit by region */
SELECT Region,
SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;
/*sales by ship mode */
SELECT `Ship Mode`,
SUM(Sales) AS Sales
FROM superstore
GROUP BY `Ship Mode`;

/*-------HAVING--------*/
/* Categories with Sales > 500000 */
SELECT Category,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 500000;
/*Regions with Profit >500000*/
SELECT Region,
SUM(Profit) AS Profit
FROM superstore
GROUP BY Region
HAVING SUM(Profit) > 50000;

/*-------SUBQUERY--------*/
/*Products above Average Sales */
SELECT *
FROM superstore
WHERE Sales >
(
SELECT AVG(Sales)
FROM superstore
);
/*orders above average profit */
SELECT *
FROM superstore
WHERE Profit >
(
SELECT AVG(Profit)
FROM superstore
);

/* -------WINDOW FUNCTION--------*/
/*Rank products by sales */
SELECT
`Product Name`,
Sales,
RANK() OVER(ORDER BY Sales DESC) AS Sales_Rank
FROM superstore;
/*Row number */
SELECT
`Customer Name`,
Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_Num
FROM superstore;

/*--------JOIN----------*/

SELECT
A.`Customer Name`,
A.Region,
B.Category
FROM superstore A
JOIN superstore B
ON A.`Order ID` = B.`Order ID`
LIMIT 20;