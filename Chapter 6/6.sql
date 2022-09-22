SELECT cnum, max(odate) as max_odate
FROM Orders
GROUP BY cnum
