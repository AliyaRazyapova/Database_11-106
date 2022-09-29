use Gruber2022

--Глава 9--
--Задача 1--
/*Напишите запрос который бы вывел все пары продавцов
 живущих в одном и том же городе.  Исключите комбинации
 продавцов с ними же, а также дубликаты строк выводимых
 в обратным порядке.*/

SELECT one.sname as "sname one", two.sname as "sname two"
FROM Salespeople one, Salespeople two
WHERE one.city = two.city AND one.snum < two.snum

--Задача 3--
/*Напишите запрос который вывел бы все пары заказов
 по данным заказчикам,  именам этих заказчиков,
  и исключал дубликаты из вывода, как в предыдущем вопросе.*/

SELECT one.onum as "onum one", two.onum as "onum two", cname
FROM Orders one, Orders two, Customers
WHERE one.cnum = two.cnum AND one.cnum = Customers.cnum
						  AND one.onum < two.onum

--Задача 5--
/*Напишите  запрос  который вывел бы имена(cname)
 и города(city) всех заказчиков с такой же оценкой(rating)
 как у Hoffmanа. Напишите запрос использующий поле cnum
 Hoffmanа а не его оценку,  так чтобы оно могло быть
 использовано если его оценка вдруг изменится.*/

SELECT one.cname, one.city
FROM Customers one, Customers two
WHERE one.rating = two.rating AND two.cnum = 2001

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

--Главы 11-12--
--Задача 1--
/*Напишите команду SELECT использующую соотнесенный подзапрос,  кото-
   рая  выберет  имена и номера всех заказчиков с максимальными для их
   городов рейтингами.*/
   
SELECT cnum, cname
FROM Customers one
WHERE rating = (SELECT MAX (rating)
				FROM Customers two
				WHERE two.city = one.city);

--Задача 4--
/*Напишите запрос который бы использовал оператор EXISTS для извлече-
   ния всех продавцов которые имеют заказчиков с оценкой 300.*/

SELECT *
FROM Salespeople one
WHERE EXISTS (SELECT *
				FROM Customers two
				WHERE one.snum = two.snum
				AND rating = 300);

--Задача 6--
/*Напишите  запрос  который извлекал бы из таблицы Заказчиков каждого
   заказчика назначенного к продавцу который в данный момент имеет  по
   крайней мере еще одного заказчика ( кроме заказчика которого вы вы-
   берете ) с заказами в таблице Заказов*/

SELECT *
	FROM Customers one
	WHERE EXISTS (SELECT *
						FROM Orders two
						WHERE one.snum = two.snum
						AND one.cnum != two.cnum)