CREATE VIEW amount_spent_by_user AS
SELECT t3.id, t3.full_name, sum(t2.package_price_total)
FROM queries_unite.purchases AS t1
INNER JOIN queries_unite.travel_packages AS t2
ON t1.travel_packages_id = t2.travel_packages_id
INNER JOIN queries_unite.users AS t3
ON t1.users_id = t3.id
group by t1.users_id
order by 3;
