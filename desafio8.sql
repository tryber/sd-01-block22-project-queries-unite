USE queries_unite;
CREATE VIEW revenue_report AS
SELECT
min(valores) as lowest_revenue,
max(valores) as biggest_revenue,
avg(valores) as average_revenue,
sum(valores) as total_revenue
FROM 
(SELECT sum(t.value_total) as valores
FROM queries_unite.travel_packages t
inner join queries_unite.purchases p
on p.travel_package_id = t.travel_package_id
group by t.travel_package_id) as teste;

SELECT * FROM revenue_report;

