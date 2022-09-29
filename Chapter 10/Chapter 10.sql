--Глава 10--
--Задача 1--
/*Напишите  запрос,  который  бы  использовал подзапрос для получения
   всех заказов заказчика с именем Cisneros.  Предположим, что вы
   не знаете номера этого заказчика, указываемого в поле cnum.*/

SELECT *
FROM Orders
WHERE cnum IN (SELECT cnum
			   FROM Customers
			   WHERE cname = 'Cisneros')

--Задача 3--
/*Напишите запрос который вывел бы имена и рейтинги тех заказчиков,
 у которых есть заказы на сумму выше средней суммы по всем заказам.*/

SELECT DISTINCT cname, rating
FROM Customers, Orders
WHERE amt > (SELECT AVG (amt)
			FROM Orders)
			AND Orders.cnum = Customers.cnum

--Задача 5--
/*Напишите запрос который бы выбрал общую сумму всех  приобретений  в
   заказах  для  каждого продавца,  у которого эта общая сумма больше
   чем наибольшая стоимость заказов в таблице.*/

SELECT snum, SUM (amt)
FROM Orders
GROUP BY snum
HAVING SUM (amt) > (SELECT MAX (amt)
					FROM Orders)