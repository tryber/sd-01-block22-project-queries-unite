USE queries_unite;

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
    BEFORE INSERT ON purchases
    FOR EACH ROW
BEGIN
    UPDATE travel_packages SET purchase_count = purchase_count + 1
    WHERE travel_packages_id = NEW.travel_packages_id;
END; $$
DELIMITER ;

SELECT
    travel_packages_id,
    purchase_count
FROM travel_packages;
