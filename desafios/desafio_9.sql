USE queries_unite;

DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(
IN initial_date VARCHAR(12),
IN final_date VARCHAR(12)
)
BEGIN
  SELECT travel_package_id AS id,
package_name AS name,
price,
start_date AS departure_date ,
end_date AS arrival_date
FROM travel_packages
WHERE departure_date > initial_date AND arrival_date < final_date;
END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
