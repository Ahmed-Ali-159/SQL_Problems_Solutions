-- Using: Postgres
WITH cte AS(
  SELECT user_id , count(user_id) AS no_of_tweets
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
)

SELECT count(user_id) as tweet_bucket, no_of_tweets as users_num
FROM cte
GROUP BY no_of_tweets
ORDER BY count(user_id)
