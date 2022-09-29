/*�������� ������ ������� �� ����������� �������� EXISTS ��� �������-
   ��� ���� ��������� ������� ����� ���������� � ������� 300.*/

SELECT *
FROM Salespeople one
WHERE EXISTS (SELECT *
				FROM Customers two
				WHERE one.snum = two.snum
				AND rating = 300);