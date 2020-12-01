--CONCAT
SELECT CONCAT(NAME, CONCAT(' ' , SURNAME)) FULLNAME FROM USERS_TABLE;

SELECT NAME || ' ' || SURNAME FULLNAME FROM USERS_TABLE;

--INSTR
SELECT INSTR(NAME, 'a') FROM (SELECT * FROM BOOK WHERE ROWNUM = 1);

--LPAD - RPAD
SELECT LPAD(NAME, 20, '-'), RPAD(SURNAME, 20, '-') FROM USERS_TABLE;

--TRIM
SELECT TRIM(TRAILING 'm' from EMAIL) FROM USERS_TABLE;

--SUBSTR
select substr (NAME, 2, 3) from BOOK;

--REPLACE
SELECT REPLACE(NAME, 'A', 'E') FROM USERS_TABLE;

--UPPER, LOWER, INITCAP 
SELECT LOWER(u.NAME || ' ' || u.SURNAME) || ' kullan�c�s� ' || UPPER(a.NAME) || ' isimli yazar�n ' 
|| INITCAP(b.NAME) || ' isimli kitab�n� alm��t�r.' FROM USERS_TABLE u JOIN
USER_BOOK_ASSIGNMENT asg ON u.ID = asg.USERID
JOIN BOOK b ON b.ID = asg.BOOKID
JOIN AUTHOR a ON b.AUTHORID = a.ID;

--ROUND - TRUNC
SELECT ROUND(451.121515, 5) FROM DUAL;
SELECT TRUNC(ROUND(451.121515, 5), 2) FROM DUAL;

--TO_CHAR
SELECT TO_CHAR(DELIVERYDATE, 'MM') FROM USER_BOOK_ASSIGNMENT;

--TO_NUMBER
SELECT TO_NUMBER(TRIM(BOTH '-' FROM '--123--')) FROM DUAL;

--TO_DATE, ADD_MONTHS
SELECT ADD_MONTHS (to_date ('2020','YYYY'), 5) FROM DUAL;

--LAST_DAY
SELECT TO_CHAR(LAST_DAY(ADD_MONTHS (to_date ('2020','YYYY'), 5)),'Day') FROM DUAL;

--NULLIF
SELECT NULLIF (to_date ('2021','YYYY'), ADD_MONTHS('20201201', 12)) FROM dual;

--RANK OVER
SELECT RANK(23, '8824756595') WITHIN GROUP (ORDER BY ID, ISBN)
FROM BOOK;

--LISTAGG
SELECT 
	USERID, 
	LISTAGG(BOOKID,',') WITHIN GROUP( ORDER BY BOOKID ) AS Books 
FROM USER_BOOK_ASSIGNMENT
GROUP BY USERID 
ORDER BY USERID;

--LEAD - LAG
SELECT USERID, BOOKID WRONG_VALUE, LAG(BOOKID, 2) OVER (ORDER BY USERID) ACTUAL_VALUE FROM USER_BOOK_ASSIGNMENT;
SELECT USERID, BOOKID WRONG_VALUE, LEAD(BOOKID, 2) OVER (ORDER BY USERID) ACTUAL_VALUE FROM USER_BOOK_ASSIGNMENT;














