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