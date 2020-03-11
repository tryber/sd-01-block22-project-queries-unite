USE queries_unite;
DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON user_travel_packages
FOR EACH ROW
BEGIN
	UPDATE  travel_packages SET purchase_count = purchase_count + 1 WHERE travel_package_id = NEW.travel_package_id;
END $$

DELIMITER ;

SELECT
    travel_package_id AS id,
    purchase_count
FROM queries_unite.travel_packages;
