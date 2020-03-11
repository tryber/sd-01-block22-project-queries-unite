USE queries_unite;

DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(arg1 INT, arg2 INT) 
RETURNS INT READS SQL DATA
BEGIN
  DECLARE age_range_total DOUBLE;
  SELECT AVG(package_price_total)
  FROM travel_packages	 AS TP
  INNER JOIN purchases AS P
  ON TP.travel_packages_id = P.travel_packages_id
  INNER JOIN users AS U
  ON U.id = P.users_id
  WHERE U.current_age > arg1
  AND U.current_age < arg2
  INTO age_range_total;
  RETURN age_range_total;
END $$

DELIMITER ;

SELECT average_amount_spent_given_age_range(30,50);
