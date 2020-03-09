DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages AS TR
SET TR.purchase_count = (purchase_count + 1)
WHERE TR.travel_package_id = NEW.travel_package_id;
END 

$$ DELIMITER ;
