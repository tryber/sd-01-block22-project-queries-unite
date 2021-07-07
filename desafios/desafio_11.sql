USE queries_unite;
DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages AS T
SET T.purchase_count = (purchase_count + 1)
WHERE T.travel_package_id = NEW.travel_package_id;
END; $$
DELIMITER ;

SELECT
travel_package_id,
purchase_count
FROM queries_unite.travel_packages;
