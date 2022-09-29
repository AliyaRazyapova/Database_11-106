use Gruber2022

--����� 3--
--������ 1--
/*�������� ������� SELECT ������� �� ������ ������ �������,
 �����, � ���� ��� ���� ����� �� ������� �������.*/

SELECT onum, amt, odate FROM Orders

--������ 5--
/*�������� ������ ������� ����� �� ������� ���������
 �� ��������� � ��������� �������: city, sname, snum, comm.*/
 
 SELECT city, sname, snum, comm FROM Salespeople

--������ 10--
/*��������  ������,  ������� ����� �� �������� cnum
 ���� ���������� �� ������� ������� ��� ����� �� �� �� ����
 ����������.*/
 
 SELECT distinct cnum From Orders

 --����� 4--
--������ 1--
/*�������� ������ ������� ����� ���� ��� ���  ������
  ��  ���������� ����� ������ ���� ��� 1,000. */

SELECT * FROM Orders
WHERE amt > 1.000

--������ 4--
/*�������� ������, ������� ����� ������ ��� ���� cname � city
 ��� ���� ���������� �� ������ San Jose � ��������� ���� 150.*/

SELECT cname, city FROM Customers
WHERE city = 'San Jose' and rating > 150

--������ 7--
/*�������� ������ � ������� ���������, ������� ����
  ���� ��������� ����� ���, ���� �� �� ������ London,
  �� ��� ������������ �� ���� 0.11, � ����� - ���� 0.13.*/

SELECT * FROM Salespeople
WHERE city = 'London' and
	  (comm <= 0.11 or comm > 0.13)

--����� 5--
--������ 1--
/*��������  ��� ������� ������� ����� �� 
������� ��� ������ �� 3 ��� 4 ������� 2015*/

SELECT * FROM Orders
WHERE odate in ('2015-10-03')

SELECT * FROM Orders
WHERE odate in ('2015-10-04')

--������ 2--
/*�������� ������, ������� ���� 
��� ������ �� 3 � 6 ������� 2015*/

SELECT * FROM Orders
WHERE odate in ('2015-10-03', '2015-10-06')

--������ 5--
/*�������� ������,  ������� ����� ������� ���� ����������
  ���  ����� ���������� � ����� ���������� � �������� �� A �� G.*/

SELECT * FROM Customers
WHERE cname between 'A' AND 'H'

--������ 8--
/*�������� ������, ������� ������� ���� ���������,
 ��� �����  ������������� �� ����� s.*/
 
SELECT * FROM Salespeople
WHERE sname LIKE '%s'

--����� 6--
--������ 1--
/*�������� ������ ������� �������� �� ��� �����
������������ �� 3 �������.*/

SELECT odate, sum(amt) as sum
FROM Orders
WHERE odate = '2015-10-03'
GROUP BY odate

--������ 6--
/*��������  ������,  ������� ������ �� ����������
 ���� ������ ��� ������� ���������.*/
 
SELECT cnum, max(odate) as max_odate
FROM Orders
GROUP BY cnum

--������ 12--
/*�������� ������, ������� �������� �� ��� ������� ���
 ���������� ����������, ��������� ����� � ���� ����.
 (���� �������� ������ ����� ������ ������ � ������ ����,
  �� ������ ����������� ������ ���� ���.)*/
 
SELECT odate, count(distinct cnum) as count
FROM Orders
GROUP BY odate

--����� 7--
--������ 1--
/*�����������  ��� ������ �������� ����� 12%  ������������.
  �������� ������ � ������� ������� ������� ��� �� �������
  ����� ������, ����� ��������, � ����� ������������ ��������
  ��� ����� ������.*/

SELECT onum, snum, amt*.12 as comm12 FROM Orders

--������ 3--
/*�������� ������ � ������� ���������� ������� ���  ��
 �����  ������ ������ � ������ ������.
 ����� ������ ���� � ����� �����:
         For the city (city), the highest rating is: (rating). */

SELECT 'For the city', city,
', the highest rating is:', max(rating)
FROM Customers
GROUP BY city

--������ 5--
/*��������  ������  ������� ������� �� ������ ����������
 � ���������� ������� ���������.  ����� ���� ������ ( rating )
 ������� �������������� ������ ��������� � ��� �������.*/

SELECT rating, cname, cnum FROM Customers
ORDER BY rating DESC

--����� 8--
--������ 1--
/*��������  ������ ������� �� ����� ������ ������� �������
 ���������������� ������ ��������� ������� �������� ��.*/

SELECT onum, cname 
FROM Orders, Customers
WHERE Customers.cnum = Orders.cnum

--������ 4--
/*��������  ������,  ������� �� ������� ��� ������� ������:
 ����� ������ � ����� �������� � ���������.*/

SELECT onum, sname, cname
FROM Orders, Customers, Salespeople
WHERE Orders.cnum = Customers.cnum and Orders.snum = Salespeople.snum

--������ 5--
/*��������  ������  �������  �� ������� ���� ����������
 ������������� ��������� � ������������� ���� 12%.
 �������� ��� ���������,  ��� ��������, � ������ ������������ ��������.*/

SELECT cname, sname, comm FROM Salespeople, Customers
WHERE Salespeople.snum = Customers.snum AND comm>.12

--������ 7--
/*�������� ������ ������� �������� �� ����� ������������
 �������� ��� ������� ������ ��������� � ��������� ���� 100.*/
 
SELECT onum, comm * amt as summ FROM Salespeople, Orders, Customers
WHERE rating > 100 AND Orders.cnum = Customers.cnum
                   AND Orders.snum = Salespeople.snum

--������ 8--
/*�������� ������, ������� �������� ������ ����������
 �� ������� � �������: 
         ����� ������ � ����� (������ + ������������).*/

SELECT onum, comm + amt as summ FROM Salespeople, Orders, Customers
WHERE Customers.city = 'London' AND Orders.cnum = Customers.cnum
								AND Orders.snum = Salespeople.snum

--����� 9--
--������ 1--
/*�������� ������ ������� �� ����� ��� ���� ���������
 ������� � ����� � ��� �� ������.  ��������� ����������
 ��������� � ���� ��, � ����� ��������� ����� ���������
 � �������� �������.*/

SELECT one.sname as "sname one", two.sname as "sname two"
FROM Salespeople one, Salespeople two
WHERE one.city = two.city AND one.snum < two.snum

--������ 3--
/*�������� ������ ������� ����� �� ��� ���� �������
 �� ������ ����������,  ������ ���� ����������,
  � �������� ��������� �� ������, ��� � ���������� �������.*/

SELECT one.onum as "onum one", two.onum as "onum two", cname
FROM Orders one, Orders two, Customers
WHERE one.cnum = two.cnum AND one.cnum = Customers.cnum
						  AND one.onum < two.onum

--������ 5--
/*��������  ������  ������� ����� �� �����(cname)
 � ������(city) ���� ���������� � ����� �� �������(rating)
 ��� � Hoffman�. �������� ������ ������������ ���� cnum
 Hoffman� � �� ��� ������,  ��� ����� ��� ����� ����
 ������������ ���� ��� ������ ����� ���������.*/

SELECT one.cname, one.city
FROM Customers one, Customers two
WHERE one.rating = two.rating AND two.cnum = 2001

--����� 10--
--������ 1--
/*��������  ������,  �������  ��  ����������� ��������� ��� ���������
   ���� ������� ��������� � ������ Cisneros.  �����������, ��� ��
   �� ������ ������ ����� ���������, ������������ � ���� cnum.*/

SELECT *
FROM Orders
WHERE cnum IN (SELECT cnum
			   FROM Customers
			   WHERE cname = 'Cisneros')

--������ 3--
/*�������� ������ ������� ����� �� ����� � �������� ��� ����������,
 � ������� ���� ������ �� ����� ���� ������� ����� �� ���� �������.*/

SELECT DISTINCT cname, rating
FROM Customers, Orders
WHERE amt > (SELECT AVG (amt)
			FROM Orders)
			AND Orders.cnum = Customers.cnum

--������ 5--
/*�������� ������ ������� �� ������ ����� ����� ����  ������������  �
   �������  ���  ������� ��������,  � �������� ��� ����� ����� ������
   ��� ���������� ��������� ������� � �������.*/

SELECT snum, SUM (amt)
FROM Orders
GROUP BY snum
HAVING SUM (amt) > (SELECT MAX (amt)
					FROM Orders)

--����� 11-12--
--������ 1--
/*�������� ������� SELECT ������������ ������������ ���������,  ����-
   ���  �������  ����� � ������ ���� ���������� � ������������� ��� ��
   ������� ����������.*/
   
SELECT cnum, cname
FROM Customers one
WHERE rating = (SELECT MAX (rating)
				FROM Customers two
				WHERE two.city = one.city);

--������ 4--
/*�������� ������ ������� �� ����������� �������� EXISTS ��� �������-
   ��� ���� ��������� ������� ����� ���������� � ������� 300.*/

SELECT *
FROM Salespeople one
WHERE EXISTS (SELECT *
				FROM Customers two
				WHERE one.snum = two.snum
				AND rating = 300);

--������ 6--
/*��������  ������  ������� �������� �� �� ������� ���������� �������
   ��������� ������������ � �������� ������� � ������ ������ �����  ��
   ������� ���� ��� ������ ��������� ( ����� ��������� �������� �� ��-
   ������ ) � �������� � ������� �������*/

SELECT *
	FROM Customers one
	WHERE EXISTS (SELECT *
						FROM Orders two
						WHERE one.snum = two.snum
						AND one.cnum != two.cnum)