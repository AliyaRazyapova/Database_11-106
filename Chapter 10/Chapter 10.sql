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