USE queries_unite;
CREATE VIEW revenue_report AS
SELECT
  ROUND(MIN(alias),2) AS lowest_revenue,
  ROUND(MAX(alias),2) AS biggest_revenue,
  ROUND(AVG(alias),6) AS average_revenue,
  ROUND(SUM(alias),2) AS total_revenue
FROM (
SELECT P.travel_package_id, SUM(price) AS alias
FROM travel_packages AS TP
INNER JOIN purchases AS P
ON TP.travel_package_id = P.travel_package_id
GROUP BY TP.travel_package_id
) AS DOUG;
SELECT * FROM revenue_report;
