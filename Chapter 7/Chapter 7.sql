--????? 7--
--?????? 1--
/*???????????  ??? ?????? ???????? ????? 12%  ????????????.
  ???????? ?????? ? ??????? ??????? ??????? ??? ?? ???????
  ????? ??????, ????? ????????, ? ????? ???????????? ????????
  ??? ????? ??????.*/

SELECT onum, snum, amt*.12 as comm12 FROM Orders

--?????? 3--
/*???????? ?????? ? ??????? ?????????? ??????? ???  ??
 ?????  ?????? ?????? ? ?????? ??????.
 ????? ?????? ???? ? ????? ?????:
         For the city (city), the highest rating is: (rating). */

SELECT 'For the city', city,
', the highest rating is:', max(rating)
FROM Customers
GROUP BY city

--?????? 5--
/*????????  ??????  ??????? ??????? ?? ?????? ??????????
 ? ?????????? ??????? ?????????.  ????? ???? ?????? ( rating )
 ??????? ?????????????? ?????? ????????? ? ??? ???????.*/

SELECT rating, cname, cnum FROM Customers
ORDER BY rating DESC