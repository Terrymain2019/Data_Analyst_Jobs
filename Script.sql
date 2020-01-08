/*How many rows are in the data_analyst_jobs table? */
Select count (*) from data_analyst_jobs;
--1793 rows
/*Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/
SELECT * FROM data_analyst_jobs LIMIT 10;
--ExxonMobil
/*How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?*/
SELECT COUNT (*) FROM data_analyst_jobs WHERE location = 'TN';
--There are 21 postings in TN. 
SELECT COUNT(*) FROM data_analyst_jobs WHERE (location = 'TN' or location = 'KY'); 
--There are 27 postings in TN or KY
/*How many postings in Tennessee have a star rating above 4?*/
SELECT COUNT (star_rating) FROM data_analyst_jobs WHERE (star_rating)>4;
--416 postings in TN have a star rating above 4
/*How many postings in the dataset have a review count between 500 and 1000?*/
SELECT COUNT(review_count) FROM data_analyst_jobs WHERE review_count BETWEEN 500 and 1000;
--There are 151 postings with a review count between 500 and 1000.
/*Show the average star rating for each state. 
 The output should show the state as state and the average rating for the state as avg_rating. 
 Which state shows the highest average rating?*/
SELECT location AS state, AVG(star_rating) AS avg_rating 
FROM data_analyst_jobs 
GROUP BY state 
ORDER BY avg_rating DESC;
--NE has the highest average rating of 4.199
/*Select unique job titles from the data_analyst_jobs table. How many are there?*/
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs; 
--Unique titles are about 881 from the table.
/*how many unique job titles are there for California companies?*/
SELECT COUNT(DISTINCT title) FROM data_analyst_jobs WHERE location = 'CA';
--California has 230 unique job titles 
/*Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
How many companies are there with more that 5000 reviews across all locations?*/
/*Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?*/
SELECT company, AVG(star_rating) 
FROM data_analyst_jobs 
GROUP BY company
HAVING SUM (review_count)>5000 
ORDER BY AVG(star_rating) DESC;
--Google is the top highest company
/*Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?*/
SELECT title FROM data_analyst_jobs WHERE title like '%Analyst%';