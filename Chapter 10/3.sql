SELECT DISTINCT cname, rating
FROM Customers, Orders
WHERE amt > (SELECT AVG (amt)
			FROM Orders)
			AND Orders.cnum = Customers.cnum