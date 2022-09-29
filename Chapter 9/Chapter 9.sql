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