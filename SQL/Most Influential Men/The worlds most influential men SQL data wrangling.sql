#For this SQL project i will be answering 10 question from this data set
#Let start by introducing the table 

SELECT * 
FROM `data_analytics_ with_sql`.`The worlds most influential men`;

# 1. What is the average age of the men in the dataset?

SELECT AVG(AGE) 
FROM `data_analytics_ with_sql`.`The worlds most influential men`;

#  2.	How many men in the dataset are from each country?

SELECT COUNT(NAME) AS NUM_OF_MEN, 
LOCATION
FROM `data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY LOCATION 
ORDER BY COUNT(NAME) DESC;

#3.	What are the top 5 most common occupations among the men in the dataset?

SELECT CATEGORY, 
COUNT(CATEGORY) AS NUM_OF_MEN
FROM `data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY 1
ORDER BY NUM_OF_MEN DESC;

#4.	How many men in the dataset are over the age of 40?

SELECT COUNT(AGE) AS OVER40MEN 
FROM `data_analytics_ with_sql`.`The worlds most influential men`
WHERE AGE > 40
ORDER BY OVER40MEN DESC;  

#-----OR---

SELECT `The worlds most influential men`.NAME, 
AGE AS OVER40MEN 
FROM `data_analytics_ with_sql`.`The worlds most influential men`
WHERE AGE > 40
ORDER BY OVER40MEN DESC;

#5.	What is the youngest and oldest age of the men in the dataset?
#YOUNGEST
SELECT `The worlds most influential men`.RANK,
`the worlds 100 most powerful men`.NAME, 
AGE AS YOUNGEST_MAN, LOCATION, CATEGORY
FROM `data_analytics_ with_sql`.`The worlds most influential men`
ORDER BY YOUNGEST_MAN
LIMIT 1;

#OLDEST

SELECT `The worlds most influential men`.RANK,
`The worlds most influential men`.NAME, 
AGE AS OLDEST_MAN, LOCATION, CATEGORY
FROM `data_analytics_ with_sql`.`The worlds most influential men`
ORDER BY OLDEST_MAN DESC
LIMIT 1;

#6.	How many men in the dataset are from North America?

SELECT  LOCATION, 
COUNT(LOCATION) AS NORTH_AMERICA
FROM `data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY LOCATION
HAVING LOCATION IN ('United states', 'Honduras', 'Barbados') ; 



#7.	How many men in the dataset are in the Technology category?

SELECT CATEGORY, 
COUNT(CATEGORY) AS MEN_IN_TECH
FROM `data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY CATEGORY
HAVING CATEGORY = 'Technology';

#8.	How many men in the dataset are from Asia?

SELECT LOCATION, 
COUNT(LOCATION) AS ASIAN_MANPOWER
FROM `data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY LOCATION
HAVING LOCATION IN ('China', 'India', 'Singapore',  'Indonesia' , 'Bangladesh', 'Japan', 'South Korea', 'Taiwan')
ORDER BY ASIAN_MANPOWER DESC;

#---or----

SELECT LOCATION , 
COUNT(
CASE
WHEN LOCATION IN ('China', 'India', 'Singapore',  'Indonesia' , 'Bangladesh', 'Japan', 'South Korea', 'Taiwan') Then 1 END) AS Men
FROM`data_analytics_ with_sql`.`The worlds most influential men`
GROUP BY 1 
ORDER BY MEN DESC;

# 9.	What is the standard deviation of the ages of the men in the dataset?

SELECT STDDEV(AGE) AS STDDEV_AGE
FROM `data_analytics_ with_sql`.`The worlds most influential men`;

 
#10.  ASSIGNMENT LOCATION TO TEMPORARY COULMNS TO SHOWCASE COLUMNS
SELECT *,
CASE 
    WHEN LOCATION IN ('United States', 'Honduras', 'Barbados') THEN 'NORTH AMERICA'
    WHEN LOCATION IN ('Germany', 'Belgium', 'Italy', 'United Kingdom', 'Spain', 'France', 'Denmark',  'Turkey', 'Finland', 'Solvakia') THEN 'EUROPE'
    WHEN LOCATION IN ('China', 'India', 'Taiwan', 'Singapore', 'Indonesia', 'Bangladesh', 'Japan', 'South Korea') THEN 'ASIA'
    WHEN LOCATION IN('Australia','New Zealand') THEN 'OCEANIA'
    WHEN LOCATION IN ('Nigeria', 'Tanzania') THEN 'AFRICA'
    ELSE 'WHAT ARE YOU!' END AS CONTINENT
FROM `data_analytics_ with_sql`.`The worlds most influential men`
ORDER BY CONTINENT;


#11. What is the median age of the men in the dataset?

SELECT AVG (AGE) AS MEDIAN_AGE
FROM 
(SELECT AGE 
FROM `data_analytics_ with_sql`.`The worlds most influential men`
ORDER BY AGE);


