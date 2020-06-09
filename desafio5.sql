USE queries_unite;
CREATE VIEW travel_package_info AS
SELECT
t.travel_package_id,
t.name as travel_package_name,
u.users_id as user_id,
u.full_name as user_name,
t.value_total as cost
FROM queries_unite.purchases p
INNER JOIN queries_unite.travel_packages t
ON t.travel_package_id = p.travel_package_id
INNER JOIN queries_unite.users u
ON u.users_id = p.users_id
order by cost DESC;

SELECT * FROM travel_package_info;
