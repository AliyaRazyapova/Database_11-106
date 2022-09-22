SELECT onum, cname 
FROM Orders, Customers
WHERE Customers.cnum = Orders.cnum