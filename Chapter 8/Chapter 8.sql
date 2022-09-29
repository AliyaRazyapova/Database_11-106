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