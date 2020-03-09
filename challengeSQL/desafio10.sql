USE queries_unite;

DELIMITER $$

CREATE FUNCTION average_amount_spent_given_age_range(
min_age INT,
max_age INT
)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE average_amout INT;
SELECT ROUND(AVG(T_P.cost), 2)
FROM purchases AS P
INNER JOIN travel_packages AS T_P
ON T_P.travel_package_id = P.travel_package_id
INNER JOIN users AS U
ON U.user_id = P.user_id
WHERE U.current_age BETWEEN min_age AND max_age INTO average_amout;
  RETURN average_amout;
END $$

DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
