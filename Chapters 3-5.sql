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