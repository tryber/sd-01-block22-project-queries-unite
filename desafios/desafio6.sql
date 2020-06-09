USE queries_unite;
CREATE VIEW amount_spent_by_user AS
SELECT u.id as user_id, u.full_name AS user_name,
SUM(tr.value) AS amount
FROM users u
INNER JOIN
purchases p
ON u.id = p.id
INNER JOIN
travel_packages tr
ON tr.travel_package_id = p.travel_package_id
GROUP BY u.id
ORDER BY 3;
SELECT * FROM amount_spent_by_user;
