SELECT *
	FROM Customers one
	WHERE EXISTS (SELECT *
						FROM Orders two
						WHERE one.snum = two.snum
						AND one.cnum != two.cnum)