USE queries_unite;
SELECT l1.location_id, l1.city, l1.country, COUNT(trl.location_id) as travel_amount
FROM purchases p
INNER JOIN travel_packages_locations trl 
ON p.travel_package_id = trl.travel_package_id
INNER JOIN locations l1 ON l1.location_id = trl.location_id
GROUP BY location_id
ORDER BY 4 DESC, 1 ASC
LIMIT 3;
