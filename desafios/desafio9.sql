USE queries_unite;
DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(first_date VARCHAR(255), second_date VARCHAR(255))
BEGIN
SELECT tr.travel_package_id as id, tr.package_name as name, tr.value as price, tr.start_date as departure_date, tr.end_date as arrival_date
FROM travel_packages tr WHERE tr.start_date BETWEEN date_format(str_to_date(first_date, '%d/%m/%Y'), '%Y-%m-%d') AND date_format(str_to_date(second_date, '%d/%m/%Y'), '%Y-%m-%d')
AND tr.end_date BETWEEN date_format(str_to_date(first_date, '%d/%m/%Y'), '%Y-%m-%d') AND date_format(str_to_date(second_date, '%d/%m/%Y'), '%Y-%m-%d');
END
$$
DELIMITER ;

CALL find_travel_packages_by_period ('17/07/2022', '25/10/2022');
