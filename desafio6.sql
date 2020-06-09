USE queries_unite;
CREATE VIEW amount_spent_by_user AS
SELECT
u.users_id as user_id,
u.full_name as user_name,
SUM(t.value_total) as amount
FROM queries_unite.users u
INNER JOIN queries_unite.purchases p
ON u.users_id = p.users_id
INNER JOIN queries_unite.travel_packages t
ON t.travel_package_id = p.travel_package_id
group by user_id
order by amount ASC;

SELECT * FROM amount_spent_by_user;
