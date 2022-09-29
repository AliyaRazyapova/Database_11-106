/*Напишите запрос который вывел бы имена и рейтинги тех заказчиков,
 у которых есть заказы на сумму выше средней суммы по всем заказам.*/

SELECT DISTINCT cname, rating
FROM Customers, Orders
WHERE amt > (SELECT AVG (amt)
			FROM Orders)
			AND Orders.cnum = Customers.cnum