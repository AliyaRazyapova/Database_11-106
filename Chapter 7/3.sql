/*�������� ������ � ������� ���������� ������� ���  ��
 �����  ������ ������ � ������ ������.
 ����� ������ ���� � ����� �����:
         For the city (city), the highest rating is: (rating). */

SELECT 'For the city', city,
', the highest rating is:', max(rating)
FROM Customers
GROUP BY city