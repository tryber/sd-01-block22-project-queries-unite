USE queries_unite;
DELIMITER $$

CREATE FUNCTION average_amount_spent_given_age_range(
age_min int,
age_max int
)
RETURNS DOUBLE READS SQL DATA
BEGIN
DECLARE average_value DOUBLE;
SELECT AVG(valor) FROM
(SELECT sum(tp.value_total) as valor
FROM queries_unite.users u
INNER JOIN queries_unite.purchases p
ON p.users_id = u.users_id
INNER JOIN queries_unite.travel_packages tp
ON tp.travel_package_id = p.travel_package_id
WHERE u.current_age > age_min 
AND u.current_age < age_max
group by p.purchase_id) as valores
INTO average_value;
RETURN average_value;
END $$
DELIMITER ;
SELECT average_amount_spent_given_age_range(30,50);
