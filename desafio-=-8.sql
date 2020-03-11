CREATE VIEW revenue_report AS
select min(valores) as lowest_revenue, max(valores) as biggest_revenue, avg(valores) as average_revenue, sum(valores) as total_revenue from(
select sum(package_price_total) as valores
from queries_unite.travel_packages as tp
inner join queries_unite.purchases as p
on p.travel_packages_id = tp.travel_packages_id
group by tp.travel_packages_id) as tabela;