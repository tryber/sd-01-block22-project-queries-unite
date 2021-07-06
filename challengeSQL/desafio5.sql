USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT 
T.travel_package_id, 
T.travel_package_name, 
U.user_id, 
U.full_name AS user_name, 
T.cost
FROM purchases AS P
INNER JOIN travel_packages AS T
ON T.travel_package_id = P.travel_package_id
INNER JOIN users AS U
ON U.user_id = P.user_id
ORDER BY T.cost DESC;

SELECT * FROM travel_package_info;
