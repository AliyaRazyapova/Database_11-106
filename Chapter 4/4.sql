/*Напишите запрос, который может выдать вам поля cname и city
 для всех заказчиков из города San Jose с рейтингом выше 150.*/

SELECT cname, city FROM Customers
WHERE city = 'San Jose' and rating > 150