USE queries_unite;
CREATE VIEW amount_spent_by_user AS

SELECT
(
SELECT users_id 
FROM queries_unite.users
WHERE queries_unite.users.users_id = queries_unite.purchases.users_id
) AS users_id,
(
SELECT full_name 
FROM queries_unite.users
WHERE queries_unite.users.users_id = queries_unite.purchases.users_id
) AS user_name,
SUM((
SELECT price
FROM queries_unite.travel_packages
WHERE queries_unite.travel_packages.travel_package_id = queries_unite.purchases.travel_package_id
)) AS amount
FROM queries_unite.purchases
GROUP BY users_id
ORDER BY 3;

SELECT * FROM amount_spent_by_user;
