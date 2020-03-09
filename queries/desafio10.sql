DELIMITER $$

CREATE FUNCTION average_amount_spent_given_age_range(min_age INT, max_age INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE average_amout DOUBLE;
  SELECT ROUND(AVG(TR.value), 2)
	FROM purchases AS PU
	INNER JOIN travel_packages AS TR
	ON TR.travel_package_id = PU.travel_package_id
	INNER JOIN users AS US
	ON US.id = PU.id
	WHERE US.current_age BETWEEN (min_age)
	AND (max_age);
  RETURN average_amout;
END

$$ DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
