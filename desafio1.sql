CREATE DATABASE IF NOT EXISTS queries_unite;
USE queries_unite;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(50) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE travel_packages (
  package_id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(30) NOT NULL,
  package_price DOUBLE(9,2) NOT NULL,
  departure_date DATE NOT NULL,
  return_date DATE NOT NULL,
  purchase_count INT DEFAULT 0
) ENGINE = InnoDB;

CREATE TABLE locations (
  locations_id INT PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE travel_packages_locations (
  package_id INT NOT NULL,
  location_id INT NOT NULL,
  PRIMARY KEY (package_id, location_id),
  FOREIGN KEY (package_id) REFERENCES travel_packages (package_id),
  FOREIGN KEY (location_id) REFERENCES locations (locations_id)
) ENGINE = InnoDB;

CREATE TABLE purchases (
  user_id INT NOT NULL,
  package_id INT NOT NULL,
  PRIMARY KEY (user_id, package_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (package_id) REFERENCES travel_packages (package_id)
) ENGINE = InnoDB;