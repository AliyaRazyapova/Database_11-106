use Gruber2022

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