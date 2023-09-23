#TITLE: FASHION SALES
#CREATED BY: JENY HOANG 
#CONCEPTS USED: WINDOW FUNCTIONS, AGGREGATE FUNCTIONS, CASE FUNCTIONS

#Review the database
Select * from fashion;

Select * from fashion 
order by price desc;

#Total Sale
Select SUM(price) as total_sale from fashion;

Select product_name, count(*) as count_product from fashion 
group by product_name;

Select *, Case 
	When rating >= 4 Then 'Good'
    When rating between 2.5 and 3.99 Then 'Normal'
    Else 'Bad'
End AS Quality From fashion; 

Select *, Case 
	When price >= 80 Then 'Expensive'
    When rating between 45 and 79 Then 'Normal'
    Else 'Cheap'
End AS price_range From fashion; 


Select Product_ID, product_Name, brand, price, color, round(rating,2) as rating,
dense_rank() over(partition by brand order by rating desc) as rk
From fashion;



