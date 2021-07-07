USE queries_unite;

DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(
IN initial_date DATE,
IN final_date DATE
)
BEGIN
SELECT travel_package_id AS id,
package_name AS name,
price,
start_date AS departure_date ,
end_date AS arrival_date
FROM travel_packages
WHERE DATE(start_date) > initial_date AND DATE(end_date) < final_date;
END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
