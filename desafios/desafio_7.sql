USE queries_unite;
CREATE VIEW top_3_locations AS

SELECT
(
SELECT location_id FROM queries_unite.locations
WHERE queries_unite.locations.location_id = queries_unite.travel_packages_locations.location_id
) AS id,
(
SELECT city FROM queries_unite.locations
WHERE queries_unite.locations.location_id = queries_unite.travel_packages_locations.location_id
) AS city,

(
SELECT country FROM queries_unite.locations
WHERE queries_unite.locations.location_id = queries_unite.travel_packages_locations.location_id
)AS country,
COUNT(location_id) AS travel_amount
FROM queries_unite.travel_packages_locations
WHERE location_id <> 0
GROUP BY city
ORDER BY 4 DESC
LIMIT 3;
