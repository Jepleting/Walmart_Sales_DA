__Business Problem
--Q1. Find the different payment methods and no of transactions, number of qnty sold
SELECT payment_method,
count (*) as no_of_Transactions,
sum(quantity) as no_qnty_sold
from walmart
group by payment_method

--Q2. Identify the highest_rated category in each branch , displaying the branch,category and the average rating