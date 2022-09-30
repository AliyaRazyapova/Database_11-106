/*Ќапишите команду SELECT использующую соотнесенный подзапрос,  кото-
   ра€  выберет  имена и номера всех заказчиков с максимальными дл€ их
   городов рейтингами.*/
   
SELECT cname, cnum
FROM Customers one
WHERE rating = (SELECT MAX (rating)
				FROM Customers two
				WHERE two.city = one.city);