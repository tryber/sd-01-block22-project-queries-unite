USE queries_unite;
DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(
IN departure DATE,
IN arrival DATE
)
BEGIN
    SELECT
    t.travel_package_id as id,
    t.name,
    t.value_total as price,
    t.start_date as departure_date,
    t.return_date as arrival_date
    FROM queries_unite.travel_packages t
    WHERE t.start_date > departure
    AND t.return_date < arrival;
END $$

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
