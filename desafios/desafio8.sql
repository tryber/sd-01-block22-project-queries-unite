USE queries_unite;
CREATE VIEW revenue_report AS
SELECT (SELECT MIN(value * purchase_count) FROM travel_packages) AS lowest_revenue,
(SELECT MAX(value * purchase_count) FROM travel_packages) AS biggest_revenue,
(SELECT ROUND(AVG(value * purchase_count), 6) FROM travel_packages) AS average_revenue,
(SELECT ROUND(SUM(value * purchase_count), 2) FROM travel_packages) AS total_revenue;

SELECT * FROM revenue_report;
