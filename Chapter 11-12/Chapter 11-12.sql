use Gruber2022
--Главы 11-12--
--Задача 1--
/*Напишите команду SELECT использующую соотнесенный подзапрос,  кото-
   рая  выберет  имена и номера всех заказчиков с максимальными для их
   городов рейтингами.*/
   
SELECT cname, cnum
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