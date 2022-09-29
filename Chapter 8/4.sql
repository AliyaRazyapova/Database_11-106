/*Напишите  запрос,  который бы выдавал для каждого заказа:
 номер заказа и имена продавца и заказчика.*/

SELECT onum, sname, cname
FROM Orders, Customers, Salespeople
WHERE Orders.cnum = Customers.cnum and Orders.snum = Salespeople.snum