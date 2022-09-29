/*Ќапишите  запрос,  который выбрал бы наибольшую
 дату заказа дл€ каждого заказчика.*/
 
SELECT cnum, max(odate) as max_odate
FROM Orders
GROUP BY cnum
