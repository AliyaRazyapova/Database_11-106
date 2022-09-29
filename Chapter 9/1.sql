/*Напишите запрос который бы вывел все пары продавцов
 живущих в одном и том же городе.  Исключите комбинации
 продавцов с ними же, а также дубликаты строк выводимых
 в обратным порядке.*/

SELECT one.sname as "sname one", two.sname as "sname two"
FROM Salespeople one, Salespeople two
WHERE one.city = two.city AND one.snum < two.snum