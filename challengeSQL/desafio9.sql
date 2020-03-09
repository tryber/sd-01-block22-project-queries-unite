USE queries_unite;

DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(
	IN start_date VARCHAR(20),
  IN end_date VARCHAR(20)
)
BEGIN
  SELECT travel_package_id AS id,
travel_package_name AS name,
cost AS price,
departure_date,
arrival_date
FROM travel_packages
WHERE departure_date > start_date AND arrival_date < end_date;
END $$

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');

-- CONFIRMAR SE TEM QUE DEIXAR A DATA COM ESTES VALORES
