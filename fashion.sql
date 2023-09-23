--TITLE: FASHION SALES
--CREATED BY: JENY HOANG 
--CONCEPTS USED: WINDOW FUNCTIONS, AGGREGATE FUNCTIONS, CASE FUNCTIONS

--Review the Database
Select * from fashion;

--Sort Fashion Products Ordered by Price Descending
Select * from fashion 
order by price desc;

--Calculate Total Sales in Fashion Data
Select SUM(price) as total_sale from fashion;

--Count Fashion Products by Name
Select product_name, count(*) as count_product from fashion 
group by product_name;

--Categorize Fashion Products by Quality Rating
Select *, Case 
	When rating >= 4 Then 'Superior'
    When rating between 2.5 and 3.99 Then 'Standard'
    Else 'Inferior'
End AS Quality From fashion; 

--Categorize Fashion Products by Price Range
Select *, Case 
	When price >= 80 Then 'Premium'
    When rating between 45 and 79 Then 'Average-priced'
    Else 'Economical'
End AS price_range From fashion; 

--Rank Fashion Products by Brand Based on Rating
Select Product_ID, product_Name, brand, price, color, round(rating,2) as rating,
dense_rank() over(partition by brand order by rating desc) as rk
From fashion;

--Insert a new product
INSERT INTO fashion (product_name, brand, category, price, rating, size, color)
VALUES ('Jacket', 'Zara', 'Women''s Fashion', 120, 4.5, 'M', 'Black');

--Calculate average rating and sales for each product category
SELECT
    category,
    AVG(rating) AS avg_rating,
    SUM(price) AS total_sales
FROM fashion
GROUP BY category
ORDER BY total_sales DESC;


