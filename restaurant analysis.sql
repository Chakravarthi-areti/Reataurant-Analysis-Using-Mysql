-- 1.WHICH IS THE TOP 1 CITY WITH HIGHEST NUMBER OF RESTAURANTS 

SELECT 
    city, COUNT(DISTINCT restaurant_name) AS no_of_restaurants
FROM
    swiggy
GROUP BY 1
ORDER BY no_of_restaurants DESC
LIMIT 1;

-- 2.HOW MAY RESTAURANTS HAVE THE WORD PIZZA IN THEIR NAME 

SELECT DISTINCT
    restaurant_name
FROM
    swiggy
WHERE
    restaurant_name LIKE '%pizza%';
    
-- 3. WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY 

SELECT 
    AVG(rating) AS rating_avg, city
FROM
    swiggy
GROUP BY city
ORDER BY rating_avg DESC;


-- 4. WHAT IS THE HIGHEST PRICE OF ITEM UNDER 'RECOMMENDED' CATEGORY FOR EACH RESTAURANT 

SELECT 
    DISTINCT(restaurant_name) as restaurant , max(price) as max_price 
FROM
    swiggy
WHERE
    menu_category LIKE 'RECOMMENDED'
GROUP BY restaurant 
ORDER BY max_price DESC;

-- 5.FIND TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN 'INDIAN'

SELECT DISTINCT
    restaurant_name, cost_per_person
FROM
    swiggy
WHERE
    cuisine <> 'INDIAN'
ORDER BY cost_per_person DESC
LIMIT 5;

-- 7.WHICH RESTAURANT IS PROVIDING LOWEST AVERAGE PRICE FOR ALL ITEMS 

select distinct restaurant_name , cost_per_person
from swiggy 
where cost_per_person < (select avg(cost_per_person) from swiggy )
order by cost_per_person asc
limit 1;

-- 8.WHICH RESTAURANT OFFERS MOST NUMBER OF ITEMS IN THE MAIN COURSE 

SELECT DISTINCT
    restaurant_name, menu_category, COUNT(item) AS items
FROM
    swiggy
WHERE
    menu_category = 'MAIN COURSE'
GROUP BY 1 , 2
ORDER BY items DESC
LIMIT 1; 



