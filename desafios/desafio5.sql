USE queries_unite;
CREATE VIEW travel_package_info AS
SELECT tr.travel_package_id, tr.package_name AS travel_package_name,
u.id as user_id, u.full_name as user_name, tr.value as cost
FROM travel_packages tr
INNER JOIN
purchases p
ON p.travel_package_id = tr.travel_package_id
INNER JOIN
users u
ON u.id = p.id
ORDER BY 5 desc;
SELECT * FROM travel_package_info;
