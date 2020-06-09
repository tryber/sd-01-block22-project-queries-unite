USE queries_unite;

DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(value1 INT, value2 INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
DECLARE amount DOUBlE;
SELECT AVG(tr.value) FROM travel_packages tr 
INNER JOIN purchases p ON tr.travel_package_id = p.travel_package_id 
INNER JOIN users u ON u.id = p.id
WHERE u.current_age BETWEEN value1 AND value2 INTO amount;
RETURN amount;
END $$
DELIMITER ;
SELECT average_amount_spent_given_age_range(30, 50);
