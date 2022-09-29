use Gruber2022

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