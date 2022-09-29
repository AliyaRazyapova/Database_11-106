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