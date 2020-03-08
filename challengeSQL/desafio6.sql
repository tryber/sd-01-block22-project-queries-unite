USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT U.user_id,
U.full_name AS user_name,
SUM(T.cost) AS amout
FROM purchases AS P
INNER JOIN users AS U
ON U.user_id = P.user_id
INNER JOIN travel_packages AS T
ON P.travel_package_id = T.travel_package_id
GROUP BY user_id
ORDER BY amout ASC;

SELECT * FROM amount_spent_by_user;
