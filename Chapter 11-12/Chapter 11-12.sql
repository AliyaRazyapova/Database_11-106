use Gruber2022
--����� 11-12--
--������ 1--
/*�������� ������� SELECT ������������ ������������ ���������,  ����-
   ���  �������  ����� � ������ ���� ���������� � ������������� ��� ��
   ������� ����������.*/
   
SELECT cname, cnum
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