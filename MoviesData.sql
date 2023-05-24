-- Viewing Dataset --
SELECT * 
FROM CopyofIMDBTop250MoviesCleanedIMDBTop250Movies;

-- Changing Table Name -- 
ALTER TABLE CopyofIMDBTop250MoviesCleanedIMDBTop250Movies RENAME TO CurrentMovies

-- Viewing Dataset --
SELECT * 
FROM CurrentMovies

-- Top five budgeted moviesCopyofIMDBTop250MoviesCleanedIMDBTop250Movies
SELECT 
name, budget
FROM
CurrentMovies
ORDER BY budget DESC
LIMIT 5 
--- Princess Mononoke Update --
UPdate CurrentMovies
SET budget = REPLACE(budget, 2400000000, 23500000)

-- 3 Idiots Update --
UPdate CurrentMovies
SET budget = REPLACE(budget, 550000000, 6700000)

-- Top 5 Budjectyed Movies --
SELECT 
name, budget
FROM
CurrentMovies
ORDER BY budget DESC
LIMIT 5 

-- Top five rated movies -- 
SELECT 
name, rating
FROM
CurrentMovies
ORDER BY rating DESC
LIMIT 5 

-- Top 5 box office hits --
SELECT 
name, box_office
FROM
CurrentMovies
ORDER BY box_office DESC
LIMIT 5 

-- Top 10 highest profitable movies --
SELECT
name, (box_office - budget) AS profit
FROM
CurrentMovies
ORDER BY profit DESC
LIMIT 10

-- 10 Lowest Profitable Movies
SELECT
name, (box_office - budget) AS profit
FROM
CurrentMovies
ORDER BY profit 
LIMIT 10

-- Most Popular Genres
SELECT genre, COUNT(*) AS genre_count
FROM (
  SELECT TRIM(value) AS genre
  FROM CurrentMovies
  CROSS JOIN json_each('["' || REPLACE(genre, ',', '","') || '"]')
  )
  GROUP BY genre
  ORDER BY genre_count DESC
  LIMIT 5
  
-- Top 10 Directors -- 
  SELECT directors, COUNT(*) AS number_of_movies
  FROM CurrentMovies
  GROUP BY
  directors
  ORDER BY Number_of_Movies DESC
  LIMIT 10
  
-- How many movies in each rating category -- 
  SELECT
  certificate, COUNT(*) AS total
  FROM
  CurrentMovies
  GROUP BY certificate
  ORDER BY total DESC
  
-- Which year had the most movies --
-- How many movies are in each decade --
-- Most popular movie genre in each decade