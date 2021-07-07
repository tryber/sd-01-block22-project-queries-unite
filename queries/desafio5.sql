CREATE VIEW travel_package_info AS
SELECT TR.travel_package_id,
TR.package_name,
US.id,
US.full_name AS user_name,
TR.value
FROM purchases AS PU
INNER JOIN travel_packages AS TR
ON TR.travel_package_id = PU.travel_package_id
INNER JOIN users AS US
ON US.id = PU.id
ORDER BY TR.value DESC;
