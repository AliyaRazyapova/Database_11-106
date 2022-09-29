SELECT one.sname as "sname one", two.sname as "sname two"
FROM Salespeople one, Salespeople two
WHERE one.city = two.city AND one.snum < two.snum