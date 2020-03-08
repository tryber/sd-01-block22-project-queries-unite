USE queries_unite;
SELECT l1.location_id, l1.city, l1.country, 
(SELECT (COUNT(*) - 1)
FROM travel_packages_locations trl WHERE trl.location_id = l1.location_id)
AS travel_amount FROM 
locations l1
GROUP BY l1.location_id;

SELECT * FROM travel_packages;
SELECT * FROM travel_packages_locations;
SELECT purchase_count FROM travel_packages;
