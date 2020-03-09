USE queries_unite;
CREATE VIEW revenue_report AS
SELECT
MIN((
SELECT price
FROM queries_unite.travel_packages 
WHERE queries_unite.travel_packages.travel_package_id = queries_unite.purchases.travel_package_id
)) AS lowest_revenue,

MAX((SELECT price
FROM queries_unite.travel_packages 
WHERE queries_unite.travel_packages.travel_package_id = queries_unite.purchases.travel_package_id
)) AS biggest_revenue,

AVG((SELECT price
FROM queries_unite.travel_packages 
WHERE queries_unite.travel_packages.travel_package_id = queries_unite.purchases.travel_package_id
)) AS average_revenue,

SUM((SELECT ROUND(price,2)
FROM queries_unite.travel_packages 
WHERE queries_unite.travel_packages.travel_package_id = queries_unite.purchases.travel_package_id
)) AS total_revenue
FROM queries_unite.purchases;

-- NÃO CONSEGUI O RESULTADO ESPERADO