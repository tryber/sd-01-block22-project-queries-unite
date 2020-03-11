USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT ut.travel_package_id,
( SELECT travel_package_name FROM travel_packages WHERE travel_package_id = ut.travel_package_id ),
ut.user_id,
( SELECT full_name FROM users WHERE id = ut.user_id ) AS user_name,
( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = ut.travel_package_id )  AS cost
FROM user_travel_packages AS ut
ORDER BY cost DESC, user_name ASC;

SELECT * FROM travel_package_info;
