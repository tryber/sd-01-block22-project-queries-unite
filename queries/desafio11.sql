DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages
SET TR.purchase_count = (purchase_count + 1)
WHERE TR.travel_package_id = NEW.travel_package_id;
END 

$$ DELIMITER ;

SELECT travel_package_id AS id,
purchase_count 
FROM queries_unite.travel_packages;
