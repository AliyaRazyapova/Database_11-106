use Gruber2022

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