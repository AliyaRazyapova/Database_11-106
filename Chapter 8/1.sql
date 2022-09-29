/*Ќапишите  запрос который бы вывел список номеров заказов
 сопровождающихс€ именем заказчика который создавал их.*/

SELECT onum, cname 
FROM Orders, Customers
WHERE Customers.cnum = Orders.cnum