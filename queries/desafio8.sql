CREATE VIEW revenue_report AS
SELECT MIN(value) AS lowest_revenue,
MAX(value) AS biggest_revenue,
AVG(value) AS average_revenue,
SUM(value) AS total_revenue
FROM 
(SELECT PU.travel_package_id, SUM(TR.value) AS value
FROM purchases AS PU
INNER JOIN travel_packages AS TR
ON PU.travel_package_id = TR.travel_package_id
GROUP BY TR.travel_package_id
) AS Total;
