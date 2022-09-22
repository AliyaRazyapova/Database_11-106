SELECT odate, count(distinct cnum) as count
FROM Orders
GROUP BY odate