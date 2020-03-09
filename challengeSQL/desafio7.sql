USE queries_unite;

CREATE VIEW top_3_locations AS
SELECT l.locations_id AS id,
l.city,
l.country,
COUNT(l.country) AS travel_amount
FROM queries_unite.travel_packages_locations AS t_p_l
INNER JOIN queries_unite.locations AS l
ON l.locations_id = t_p_l.locations_id
INNER JOIN queries_unite.travel_packages AS t
ON t_p_l.travel_package_id = t.travel_package_id
GROUP BY l.locations_id
ORDER BY 4 DESC LIMIT 3;

SELECT * FROM top_3_locations;
