USE queries_unite;

CREATE VIEW revenue_report AS 
SELECT MIN(cost) AS lowest_revenue,
MAX(cost) AS biggest_revenue,
AVG(cost) AS average_revenue,
SUM(cost) AS total_revenue
FROM 
(SELECT p.travel_package_id, SUM(t_p.cost) AS cost
  FROM purchases AS p
INNER JOIN travel_packages AS t_p
ON p.travel_package_id = t_p.travel_package_id
  GROUP BY t_p.travel_package_id
) AS C;

SELECT * FROM revenue_report;
