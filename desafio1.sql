CREATE DATABASE IF NOT EXISTS queries_unite;
USE queries_unite;

CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(45) UNIQUE NOT NULL,
  current_age INT UNSIGNED NOT NULL,
  current_job VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO users (full_name, current_age, current_job)
VALUES ('Rafael Martins', 33, 'Arquiteto'), ('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'), ('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

CREATE TABLE IF NOT EXISTS travel_packages (
  travel_package_id INT NOT NULL AUTO_INCREMENT,
  travel_package_name VARCHAR(45) NOT NULL,
  travel_package_price DOUBLE UNSIGNED NOT NULL,
  departure_date DATETIME NOT NULL,
  return_date DATETIME NOT NULL,
  purchase_count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (travel_package_id)
) ENGINE = InnoDB;

INSERT INTO travel_packages (travel_package_name, travel_package_price, departure_date, return_date)
VALUES ('Promoção 3 destinos', 12500.99, '2022/09/25', '2022/10/12'),  ('Vem Pro Verão', 9650.99, '2022/10/16', '2022/10/26'),
('Cultura Francesa', 3900.99, '2022/07/12', '2022/07/20'), ('Vem Pro Verão', 7725.99, '2022/02/19', '2022/03/26'),
('Promoção 3 destinos', 13500.99, '2022/09/13', '2022/10/18');

CREATE TABLE IF NOT EXISTS location (
  location_id INT NOT NULL AUTO_INCREMENT,
  country VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  PRIMARY KEY (location_id)
) ENGINE = InnoDB;

INSERT INTO location (country, city)
VALUES ('África do Sul', 'Cape Town'), ('Indonésia', 'Bali'), ('Marrocos', 'Marrakesh'), ('França', 'Paris'), ('Estados Unidos', 'Nova Iorque');

CREATE TABLE IF NOT EXISTS user_travel_packages (
  user_id INT NOT NULL,
  travel_package_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES queries_unite.users(id),
  FOREIGN KEY (travel_package_id) REFERENCES queries_unite.travel_packages(travel_package_id)
) ENGINE = InnoDB;

INSERT INTO user_travel_packages (user_id, travel_package_id);

CREATE TABLE IF NOT EXISTS travel_packages_locations (
  travel_package_id INT NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (travel_package_id) REFERENCES queries_unite.travel_packages(travel_package_id),
  FOREIGN KEY (location_id) REFERENCES queries_unite.location(location_id)
) ENGINE = InnoDB;

INSERT INTO travel_packages_locations (travel_package_id, location_id)
VALUES (1,1), (1,2), (1,3), (2,4), (2,5), (3,4), (4,1), (4,2), (3,4), (5,3), (5,5), (5,4);
