USE queries_unite;

CREATE VIEW revenue_report AS
SELECT ROUND(MIN(sum_recipe),2) AS lowest_revenue,
ROUND(MAX(sum_recipe),2) AS biggest_revenue,
ROUND(AVG(sum_recipe),6) AS average_revenue,
ROUND(SUM(sum_recipe),2) AS total_revenue
FROM (
SELECT SUM( ( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id ) ) AS sum_recipe
FROM  user_travel_packages AS utp
GROUP BY utp.travel_package_id
) AS recipe;

SELECT * FROM revenue_report;
