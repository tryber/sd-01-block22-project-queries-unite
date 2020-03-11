-- o valor médio gasto em compras de pacotes nessa faixa etária

SELECT AVG(sum_price)
FROM (
SELECT ( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id) AS sum_price
FROM user_travel_packages AS utp 
HAVING ( SELECT current_age FROM users WHERE id = utp.user_id ) BETWEEN 30 AND 50
) AS user_recipe;

SELECT utp.user_id, ( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id) AS sum_price
FROM user_travel_packages AS utp 
HAVING ( SELECT current_age FROM users WHERE id = utp.user_id ) BETWEEN 30 AND 50;

SELECT AVG(sum_price)
FROM (
SELECT ROUND(SUM(( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id)),2) AS sum_price
FROM user_travel_packages AS utp 
GROUP BY utp.user_id
HAVING ( SELECT current_age FROM users WHERE id = utp.user_id ) BETWEEN 30 AND 50
) AS user_recipe;

SELECT utp.user_id, ROUND(SUM(( SELECT travel_package_price FROM travel_packages WHERE travel_package_id = utp.travel_package_id)),2) AS sum_price
FROM user_travel_packages AS utp 
GROUP BY utp.user_id
HAVING ( SELECT current_age FROM users WHERE id = utp.user_id ) BETWEEN 30 AND 50;