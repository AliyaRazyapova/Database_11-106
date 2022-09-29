/*Напишите запрос который вывел бы все пары заказов
 по данным заказчикам,  именам этих заказчиков,
  и исключал дубликаты из вывода, как в предыдущем вопросе.*/

SELECT one.onum as "onum one", two.onum as "onum two", cname
FROM Orders one, Orders two, Customers
WHERE one.cnum = two.cnum AND one.cnum = Customers.cnum
						  AND one.onum < two.onum