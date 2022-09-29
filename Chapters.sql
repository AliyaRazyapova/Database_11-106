use Gruber2022

--Глава 3--
--Задача 1--
/*Напишите команду SELECT которая бы вывела номера заказов,
 сумму, и дату для всех строк из таблицы Заказов.*/

SELECT onum, amt, odate FROM Orders

--Задача 5--
/*Напишите запрос который вывел бы таблицу Продавцов
 со столбцами в следующем порядке: city, sname, snum, comm.*/
 
 SELECT city, sname, snum, comm FROM Salespeople

--Задача 10--
/*Напишите  запрос,  который вывел бы значения cnum
 всех заказчиков из таблицы Заказов без каких бы то ни было
 повторений.*/
 
 SELECT distinct cnum From Orders

 --Глава 4--
--Задача 1--
/*Напишите запрос который может дать вам все  заказы
  со  значениями суммы заказа выше чем 1,000. */

SELECT * FROM Orders
WHERE amt > 1.000

--Задача 4--
/*Напишите запрос, который может выдать вам поля cname и city
 для всех заказчиков из города San Jose с рейтингом выше 150.*/

SELECT cname, city FROM Customers
WHERE city = 'San Jose' and rating > 150

--Задача 7--
/*Напишите запрос к таблице Продавцов, который дает
  всех Продавцов таких что, если он из города London,
  то его комиссионные не выше 0.11, а иначе - выше 0.13.*/

SELECT * FROM Salespeople
WHERE city = 'London' and
	  (comm <= 0.11 or comm > 0.13)

--Глава 5--
--Задача 1--
/*Напишите  два запроса которые могли бы 
вывести все заказы на 3 или 4 Октября 2015*/

SELECT * FROM Orders
WHERE odate in ('2015-10-03')

SELECT * FROM Orders
WHERE odate in ('2015-10-04')

--Задача 2--
/*Напишите запрос, который дает 
все заказы на 3 и 6 Октября 2015*/

SELECT * FROM Orders
WHERE odate in ('2015-10-03', '2015-10-06')

--Задача 5--
/*Напишите запрос,  который может вывести всех заказчиков
  чьи  имена начинаются с буквы попадающей в диапазон от A до G.*/

SELECT * FROM Customers
WHERE cname between 'A' AND 'H'

--Задача 8--
/*Напишите запрос, который выберет всех продавцов,
 чьи имена  заканчиваются на букву s.*/
 
SELECT * FROM Salespeople
WHERE sname LIKE '%s'

--Глава 6--
--Задача 1--
/*Напишите запрос который сосчитал бы все суммы
приобретений на 3 Октября.*/

SELECT odate, sum(amt) as sum
FROM Orders
WHERE odate = '2015-10-03'
GROUP BY odate

--Задача 6--
/*Напишите  запрос,  который выбрал бы наибольшую
 дату заказа для каждого заказчика.*/
 
SELECT cnum, max(odate) as max_odate
FROM Orders
GROUP BY cnum

--Задача 12--
/*Напишите запрос, который сосчитал бы для каждого дня
 количество заказчиков, сделавших заказ в этот день.
 (Если заказчик сделал более одного заказа в данный день,
  он должен учитываться только один раз.)*/
 
SELECT odate, count(distinct cnum) as count
FROM Orders
GROUP BY odate

--Глава 7--
--Задача 1--
/*Предположим  что каждый продавец имеет 12%  комиссионных.
  Напишите запрос к таблице Заказов который мог бы вывести
  номер заказа, номер продавца, и сумму комиссионных продавца
  для этого заказа.*/

SELECT onum, snum, amt*.12 as comm12 FROM Orders

--Задача 3--
/*Напишите запрос к таблице Заказчиков который мог  бы
 найти  высшую оценку в каждом городе.
 Вывод должен быть в такой форме:
         For the city (city), the highest rating is: (rating). */

SELECT 'For the city', city,
', the highest rating is:', max(rating)
FROM Customers
GROUP BY city

--Задача 5--
/*Напишите  запрос  который выводил бы список заказчиков
 в нисходящем порядке рейтингов.  Вывод поля оценки ( rating )
 должден сопровождаться именем заказчика и его номером.*/

SELECT rating, cname, cnum FROM Customers
ORDER BY rating DESC

--Глава 8--
--Задача 1--
/*Напишите  запрос который бы вывел список номеров заказов
 сопровождающихся именем заказчика который создавал их.*/

SELECT onum, cname 
FROM Orders, Customers
WHERE Customers.cnum = Orders.cnum

--Задача 4--
/*Напишите  запрос,  который бы выдавал для каждого заказа:
 номер заказа и имена продавца и заказчика.*/

SELECT onum, sname, cname
FROM Orders, Customers, Salespeople
WHERE Orders.cnum = Customers.cnum and Orders.snum = Salespeople.snum

--Задача 5--
/*Напишите  запрос  который  бы выводил всех заказчиков
 обслуживаемых продавцом с комиссионными выше 12%.
 Выведите имя заказчика,  имя продавца, и ставку комиссионных продавца.*/

SELECT cname, sname, comm FROM Salespeople, Customers
WHERE Salespeople.snum = Customers.snum AND comm>.12

--Задача 7--
/*Напишите запрос который вычислил бы сумму комиссионных
 продавца для каждого заказа заказчика с рейтингом выше 100.*/
 
SELECT onum, comm * amt as summ FROM Salespeople, Orders, Customers
WHERE rating > 100 AND Orders.cnum = Customers.cnum
                   AND Orders.snum = Salespeople.snum

--Задача 8--
/*Напишите запрос, который отбирает заказы заказчиков
 из Лондона и выводит: 
         номер заказа и сумму (заказа + комиссионных).*/

SELECT onum, comm + amt as summ FROM Salespeople, Orders, Customers
WHERE Customers.city = 'London' AND Orders.cnum = Customers.cnum
								AND Orders.snum = Salespeople.snum

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