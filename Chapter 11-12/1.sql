/*�������� ������� SELECT ������������ ������������ ���������,  ����-
   ���  �������  ����� � ������ ���� ���������� � ������������� ��� ��
   ������� ����������.*/
   
SELECT cname, cnum
FROM Customers one
WHERE rating = (SELECT MAX (rating)
				FROM Customers two
				WHERE two.city = one.city);