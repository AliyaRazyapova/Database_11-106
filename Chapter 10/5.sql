SELECT snum, SUM (amt)
FROM Orders
GROUP BY snum
HAVING SUM (amt) > (SELECT MAX (amt)
					FROM Orders)