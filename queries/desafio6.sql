CREATE VIEW amount_spent_by_user AS
SELECT US.id AS user_id,
US.full_name AS user_name,
SUM(TR.value) AS amout
FROM purchases AS PU
INNER JOIN users AS US
ON US.id = PU.id
INNER JOIN travel_packages AS TR
ON PU.travel_package_id = TR.travel_package_id
GROUP BY user_id
ORDER BY amout;
