CREATE VIEW top_3_locations AS
SELECT LO.location_id AS id,
LO.city,
LO.country,
COUNT(LO.country) AS travel_amount
FROM queries_unite.travel_packages_locations AS TPL
INNER JOIN queries_unite.locations AS LO
ON LO.location_id = TPL.location_id
INNER JOIN queries_unite.travel_packages AS TR
ON TPL.travel_package_id = TR.travel_package_id
GROUP BY LO.location_id
ORDER BY 4 DESC
LIMIT 3;
