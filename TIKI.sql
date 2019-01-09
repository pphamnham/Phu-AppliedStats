
/**
CREATE TABLE table_X(
    Seller_ID int,
    Category varchar(255),
    Sales int,
   );
   */
INSERT INTO table_X(Seller_ID,Category,Sales)
VALUES 
('1','Book','258'),
('2','Electronics','299'),
('3','Electronics','123'),
('4','Book','272'),
('5','FMCG','485'),
('6','Book','187'),
('7','FMCG','349'),
('8','FMCG','61'),
('9','Electronics','321'),
('10','FMCG','20')
;

Select * from table_X;

Select * from table_X

Order by  Category asc, Sales desc;

SELECT X.Seller_ID as 'Seller ID', X.Category, X.Sales as 'Sales (Millions VND)'
FROM table_X as X
WHERE X.Sales IN 
	(SELECT max(Sales) as 'Sales'
	FROM table_X
	GROUP BY Category )
ORDER BY Category asc;

SELECT max(Sales) as Sales
FROM table_X
GROUP BY Category;


select*from table_y;

Drop table table_X;
Drop table table_y;



/**
CREATE TABLE table_Y(
    Award_Year int,
    Award varchar(255),
    Seller_ID int,
   );
   */

INSERT INTO table_Y(Award_Year,Award,Seller_ID)
VALUES ('2017','Best Seller','9'),
('2018','Best Seller','5'),
('2017','Best Operations','5'),
('2018','Best Quality','10'),
('2018','Best Operations','6'),
('2017','Best Seller','4'),
('2017','Best Operations','5'),
('2017','Best Quality','7'),
('2017','Best Quality','10');


;WITH a AS (SELECT X.Seller_ID as 'Seller ID', X.Category, X.Sales as 'Sales (Millions VND)'
FROM table_X as X
WHERE X.Sales IN 
	(SELECT max(Sales) as 'Sales'
	FROM table_X
	GROUP BY Category))
SELECT a.Seller_ID, a.Category, count(y.Award) as 'Awards in 2017'
 FROM  table_Y as y
INNER JOIN a
ON y.Seller_ID = a.Seller_ID
AND y.Award_Year= '2017'
GROUP BY a.Seller_ID,a.Category;



SELECT a.Seller_ID, a.Category, count(y.Award) as 'Awards in 2017'
 FROM (
		SELECT *
		FROM table_X WHERE Sales IN (
		SELECT max(Sales) as 'Sales'
		FROM table_X
		GROUP BY Category)) as a
INNER JOIN table_Y as y
ON y.Seller_ID = a.Seller_ID
AND y.Award_Year= '2017'
GROUP BY a.Seller_ID,a.Category
;







SELECT a.Seller_ID, a.Category, y.Award
 FROM (
		SELECT *
		FROM table_X WHERE Sales IN (
		SELECT max(Sales) as 'Sales'
		FROM table_X
		GROUP BY Category)) as a
INNER JOIN table_Y as y
ON y.Seller_ID = a.Seller_ID
AND y.Award_Year= '2017'






select FIND_BESTSELLER.* from 
(SELECT *
FROM table_X WHERE Sales IN (
SELECT max(Sales) as 'Sales'
FROM table_X
GROUP BY Category)) AS FIND_BESTSELLER



