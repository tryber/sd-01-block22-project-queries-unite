USE queries_unite;
CREATE VIEW amount_spent_by_user AS

SELECT 
U.users_id,
U.full_name AS user_name,
SUM(T.price) AS amount
FROM queries_unite.users AS U
INNER JOIN travel_packages AS T
ON T.travel_package_id = P.travel_package_id
INNER JOIN purchases AS P
ON U.users_id = P.users_id
GROUP BY user_name
ORDER BY 3;
