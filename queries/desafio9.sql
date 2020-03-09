DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(IN start_date_value VARCHAR(20), IN end_date_value VARCHAR(20))
BEGIN
SELECT travel_package_id AS 'id',
package_name AS 'name',
value AS 'value',
start_date AS departure_date,
end_date AS arrival_date
FROM travel_packages
WHERE start_date > start_date_value
AND end_date < end_date_value;
END

$$ DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
