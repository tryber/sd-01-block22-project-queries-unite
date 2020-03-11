USE queries_unite;
DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(IN initial_Date DATETIME, IN final_date DATETIME)
BEGIN
SELECT travel_package_id AS id, travel_package_name AS name, travel_package_price AS price, departure_date, return_date AS arrival_date
FROM travel_packages
WHERE departure_date >= initial_Date AND  return_date <= final_date;
END $$

DELIMITER ;
DROP PROCEDURE find_travel_packages_by_period;
CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
