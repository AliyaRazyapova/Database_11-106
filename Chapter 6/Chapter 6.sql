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