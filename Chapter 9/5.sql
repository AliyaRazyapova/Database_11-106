SELECT one.cname, one.city
FROM Customers one, Customers two
WHERE one.rating = two.rating AND two.cnum = 2001