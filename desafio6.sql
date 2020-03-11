USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT utp.user_id,
( SELECT full_name FROM users WHERE id = utp.user_id ) AS user_name,
ROUND(SUM(( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id )),2) AS amount
FROM user_travel_packages AS utp
GROUP BY utp.user_id
ORDER BY amount ASC;

SELECT * FROM amount_spent_by_user;
