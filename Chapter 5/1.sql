/*Напишите  два запроса которые могли бы 
вывести все заказы на 3 или 4 Октября 2015*/

SELECT * FROM Orders
WHERE odate in ('2015-10-03')

SELECT * FROM Orders
WHERE odate in ('2015-10-04')