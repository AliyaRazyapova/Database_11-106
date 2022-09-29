/*Напишите  запрос  который  бы выводил всех заказчиков
 обслуживаемых продавцом с комиссионными выше 12%.
 Выведите имя заказчика,  имя продавца, и ставку комиссионных продавца.*/

SELECT cname, sname, comm FROM Salespeople, Customers
WHERE Salespeople.snum = Customers.snum AND comm>.12