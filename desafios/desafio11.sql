USE queries_unite;

DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
    UPDATE travel_packages
    SET purchase_count = purchase_count + 1
    WHERE travel_package_id = NEW.travel_package_id;
END $$
DELIMITER ;

SELECT travel_package_id as id, purchase_count FROM queries_unite.travel_packages;
