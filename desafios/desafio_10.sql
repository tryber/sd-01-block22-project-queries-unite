USE queries_unite;

DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(value1 INT, value2 INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
DECLARE answer DOUBlE;
 SELECT
AVG(T.price)
FROM queries_unite.travel_packages AS T
INNER JOIN queries_unite.purchases AS P
ON P.travel_package_id = T.travel_package_id
INNER JOIN queries_unite.users AS U
ON U.users_id = P.users_id AND U.current_age > value1 AND U.current_age < value2
INTO answer;
RETURN answer;
END $$
DELIMITER ;
SELECT average_amount_spent_given_age_range(30, 50);
