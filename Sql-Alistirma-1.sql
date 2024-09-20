---"I'm gonna write code using SQL."

use CARDB

--We can see what is in the WEBOFFERS table
Select * From WEBOFFERS

--I'll chose the some title which is in the Istanbul and let's see what I'm gonna see
Select W.TITLE,W.BRAND,W.MODEL,W.PRICE,C.CITY
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID=C.ID
WHERE C.CITY='Ýstanbul';

--I'm gonna chose the cars which are between different prices
Select TITLE,BRAND,MODEL,PRICE
FROM WEBOFFERS
WHERE PRICE BETWEEN 100000 and 300000

--I'll make the list based on user's ýnformation
SELECT W.TITLE,W.BRAND,W.MODEL,W.PRICE, U.USERNAME_ ,U.NAMESURNAME
FROM WEBOFFERS W
JOIN USER_ U ON W.USERID=U.ID
WHERE U.USERNAME_='user123';

--I'll take the average price

Select C.CITY,AVG(W.PRICE) AS AVERAGE_PRICE
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID=C.ID
GROUP BY C.CITY

--How many cars are there in cities?
Select C.CITY,T.TOWN,COUNT(W.ID) AS VEHICLE_COUNT
FROM WEBOFFERS W
INNER JOIN CITY C ON W.CITYID=C.ID
INNER JOIN TOWN T ON W.TOWNID = T.ID
GROUP BY C.CITY,T.TOWN
ORDER BY VEHICLE_COUNT DESC;

--I m gonna take the cars based on types of year
SELECT BRAND,MODEL,PRICE
FROM WEBOFFERS
WHERE YEAR_='2020' AND FUEL='Benzin'
ORDER BY PRICE DESC;

--What is the cheapest and expensive cars in the data tabe?
Select *
From WEBOFFERS
Where PRICE =(Select MAX(PRICE) FROM WEBOFFERS)
OR PRICE=(SELECT MIN(PRICE) FROM WEBOFFERS);


Select C.CITY,AVG(W.PRICE) AS AVG_PRICE,COUNT(W.ID) AS TOTAL_CARS
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID=C.ID
GROUP BY C.CITY
ORDER BY AVG_PRICE DESC;