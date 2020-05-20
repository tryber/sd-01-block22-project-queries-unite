USE queries_unite;

DELIMITER $$
CREATE PROCEDURE find_travel_packages_by_period(IN arg1 DATETIME,IN arg2 DATETIME) 
BEGIN 
  SELECT travel_packages_id AS id, package_name AS name, package_price_total AS price, departure_date, return_date AS arrival_date 
  FROM queries_unite.travel_packages
  WHERE departure_date > arg1 AND return_date < arg2;
END $$ 

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
