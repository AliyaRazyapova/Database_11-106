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