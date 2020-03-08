USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT 
TP.travel_package_id,
TP.package_name AS travel_package_name,
U.users_id,
U.full_name AS user_name,
TP.price AS cost
FROM travel_packages AS TP
INNER JOIN
purchases AS P
ON P.travel_package_id = TP.travel_package_id
INNER JOIN
users AS U
ON U.users_id = P.users_id
ORDER BY 5 desc;