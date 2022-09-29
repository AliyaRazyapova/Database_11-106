SELECT *
FROM Orders
WHERE cnum IN (SELECT cnum
			   FROM Customers
			   WHERE cname = 'Cisneros')