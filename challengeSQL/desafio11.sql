USE queries_unite;

DROP TABLE purchases;

CREATE TABLE purchases(
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  travel_package_id INT NOT NULL,
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages (travel_package_id)
);

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
  BEFORE INSERT ON purchases
  FOR EACH ROW
BEGIN
  UPDATE travel_packages
  SET purchase_count = purchase_count + 1
  WHERE travel_package_id = NEW.travel_package_id;
END; $$
DELIMITER ;

INSERT INTO purchases
(user_id, travel_package_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(5, 5);

SELECT travel_package_id AS id,
purchase_count 
FROM queries_unite.travel_packages;
