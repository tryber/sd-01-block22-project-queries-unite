USE queries_unite;

CREATE VIEW revenue_report AS 
SELECT MIN(t_p.cost) AS lowest_revenue,
MAX(t_p.cost) AS biggest_revenue,
SUM(t_p.cost)/5 AS average_revenue,
SUM(t_p.cost) AS total_revenue
FROM purchases AS p
INNER JOIN travel_packages AS t_p
ON p.travel_package_id = t_p.travel_package_id
INNER JOIN users AS u
ON u.user_id = p.user_id;

SELECT * FROM revenue_report;

-- FAZER NO FORMATO SUBQUERY 
