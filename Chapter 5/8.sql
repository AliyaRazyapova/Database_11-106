/*Напишите запрос, который выберет всех продавцов,
 чьи имена  заканчиваются на букву s.*/
 
SELECT * FROM Salespeople
WHERE sname LIKE '%s'