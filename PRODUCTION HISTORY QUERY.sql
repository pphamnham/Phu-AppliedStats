select * from product_history1


GROUP BY product_id;


SELECT CAST(date as date) as Date, COUNT(product_id) as 'Number of Product'
from product_history1
WHERE Date IN (
SELECT max(CAST(date AS date)) as 'max_date'
	FROM product_history1
	GROUP BY month(date),year(date))
AND product_status = 'ON'
GROUP BY Date
ORDER BY Date desc;




SELECT month(eom.max_date),day(eom.max_date),
from
(SELECT max(CAST(date AS date)) as 'max_date'
	FROM product_history1
		GROUP BY month(date),year(date)) as eom
Order by eom.max_date desc;




SELECT max(CAST(date AS date)) as 'max_date', SUM(CAST(stock AS int))
	FROM product_history1
		GROUP BY month(date),year(date)

	



	