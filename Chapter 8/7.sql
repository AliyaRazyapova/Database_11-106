/*Напишите запрос который вычислил бы сумму комиссионных
 продавца для каждого заказа заказчика с рейтингом выше 100.*/
 
SELECT onum, comm * amt as summ FROM Salespeople, Orders, Customers
WHERE rating > 100 AND Orders.cnum = Customers.cnum
                   AND Orders.snum = Salespeople.snum