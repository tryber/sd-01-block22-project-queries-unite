USE queries_unite;

SELECT * FROM location;
SELECT * FROM travel_package_info;
SELECT * FROM travel_packages;
SELECT * FROM travel_packages_locations;
SELECT * FROM user_travel_packages;
SELECT * FROM users;

DROP VIEW top_3_locations;

CREATE VIEW top_3_locations AS
SELECT tpl.location_id AS id,
( SELECT city FROM location WHERE location_id = tpl.location_id ) AS city,
( SELECT country FROM location WHERE location_id = tpl.location_id ) AS country,
COUNT(location_id) AS travel_amout
FROM travel_packages_locations AS tpl
GROUP BY tpl.location_id
ORDER BY travel_amout DESC, id ASC;



SELECT * FROM top_3_locations;
-- 