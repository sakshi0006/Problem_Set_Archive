/* Q1: Histogram of Tweets [Twitter SQL Interview Question]

Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.
tweets Table:
Column Name	Type
tweet_id	integer
user_id	integer
msg	string
tweet_date	timestamp
tweets Example Input:
tweet_id	user_id	  msg	                                                                tweet_date
214252	  111	     Am considering taking Tesla private at $420. Funding secured.	     12/30/2021 00:00:00
739252	  111	     Despite the constant negative press covfefe	                       01/01/2022 00:00:00
846402	  111	     Following @NickSinghTech on Twitter changed my life! 	             02/14/2022 00:00:00
241425	  254	     If the salary is so competitive why won’t you tell me what it is?	 03/01/2022 00:00:00
231574	  148	     I no longer have a manager. I can't be managed	                     03/23/2022 00:00:00
Example Output:
tweet_bucket	users_num
1	2
2	1  */

select tweet_bucket, count(*) as user_num 
from
(SELECT user_id ,count(tweet_id) as tweet_bucket
FROM tweets
WHERE EXTRACT(Year from tweet_date) = 2022
GROUP BY user_id) as x
GROUP BY x.tweet_bucket;


/* Q2: Data Science Skills [LinkedIn SQL Interview Question]

Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

Assumption:
There are no duplicates in the candidates table.

Candidates Table:
Column Name	Type
candidate_id	integer
skill	varchar

Candidates Example Input:
candidate_id	   skill
 123	           Python
 123	           Tableau
 123	           PostgreSQL
 234	           R
 234	           PowerBI
 234	           SQL Server
 345	           Python
 345	           Tableau
Example Output:
candidate_id
123
*/

SELECT candidate_id
from
(SELECT *
FROM candidates
where skill = 'Python' OR skill = 'Tableau' OR skill = 'PostgreSQL') as filtered_table
GROUP BY candidate_id
HAVING count(candidate_id) = 3;

