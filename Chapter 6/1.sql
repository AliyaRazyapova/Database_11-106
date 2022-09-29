/*Напишите запрос который сосчитал бы все суммы
приобретений на 3 Октября.*/

SELECT odate, sum(amt) as sum
FROM Orders
WHERE odate = '2015-10-03'
GROUP BY odate