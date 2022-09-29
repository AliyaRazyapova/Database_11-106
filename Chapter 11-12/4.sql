/*Напишите запрос который бы использовал оператор EXISTS для извлече-
   ния всех продавцов которые имеют заказчиков с оценкой 300.*/

SELECT *
FROM Salespeople one
WHERE EXISTS (SELECT *
				FROM Customers two
				WHERE one.snum = two.snum
				AND rating = 300);