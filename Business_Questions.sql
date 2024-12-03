__Business Problem
--Q1. Find the different payment methods and no of transactions, number of qnty sold
SELECT payment_method,
count (*) as no_of_Transactions,
sum(quantity) as no_qnty_sold
from walmart
group by payment_method

--Q2. Identify the highest_rated category in each branch , displaying the branch,category and the average rating

select * from
(
	select  
	branch,
	category,
	avg(rating) as average_rating,
	rank() over (partition by branch order by avg(rating) desc) as rank
	from walmart
	group by branch,category
)
where rank = 1

--Q3. Identify the busiest day for each branch based on the number of transactions
SELECT * FROM
(
SELECT 
 branch,
 TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') as day_name,
 COUNT(*) as no_transactions,
 RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as rank
FROM walmart
GROUP BY branch , day_name
)
WHERE rank = 1
