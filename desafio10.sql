USE queries_unite;
DELIMITER $$

CREATE FUNCTION average_amount_spent_given_age_range(min_age INT, max_age INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
DECLARE avarage_amount DOUBLE;
SELECT AVG(sum_price)
FROM (
SELECT ( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id) AS sum_price
FROM user_travel_packages AS utp 
WHERE ( SELECT current_age FROM users WHERE id = utp.user_id ) BETWEEN min_age AND max_age
) AS user_recipe
INTO avarage_amount;
RETURN avarage_amount;
END $$

DELIMITER ;

SELECT  average_amount_spent_given_age_range(30,50);
