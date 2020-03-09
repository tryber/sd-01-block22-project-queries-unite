CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(45) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(45) NOT NULL
  ) ENGINE = InnoDB;

CREATE TABLE travel_packages (
  travel_packages_id INT AUTO_INCREMENT PRIMARY KEY,
  package_name VARCHAR(50) NOT NULL,
  package_price_total DECIMAL(10,2) NOT NULL,
  purchase_count INT NOT NULL DEFAULT 0,
  departure_date DATE NOT NULL,
  return_date DATE NOT NULL
  ) ENGINE = InnoDB;

CREATE TABLE  locations (
  location_id INT AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL
  ) ENGINE = InnoDB;

CREATE TABLE travel_packages_locations (
travel_packages_locations_id INT AUTO_INCREMENT PRIMARY KEY,
travel_packages_id INT NOT NULL,
location_id INT NOT NULL,
FOREIGN KEY (travel_packages_id) 
REFERENCES travel_packages(travel_packages_id),
FOREIGN KEY (location_id) 
REFERENCES locations(location_id)
) ENGINE = InnoDB;

CREATE TABLE purchases (
purchase_id INT AUTO_INCREMENT PRIMARY KEY,
users_id INT NOT NULL,
travel_packages_id INT NOT NULL,
FOREIGN KEY (users_id) REFERENCES users(id),
FOREIGN KEY (travel_packages_id) REFERENCES travel_packages(travel_packages_id)
) ENGINE = InnoDB;

INSERT INTO users (full_name, current_age, current_job)
VALUES 
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');
INSERT INTO locations (country, city) 
VALUES
('África do Sul', 'Cape Town'),
('Indonésia', 'Bali'),
('Marrocos', 'Marrakesh'),
('França', 'Paris'),
('Estados Unidos', 'Nova Iorque');
INSERT INTO travel_packages (package_name, departure_date, return_date, package_price_total) 
VALUES
('Promoção 3 destinos', '2022/09/25', '2022/10/12', 12500.99),
('Vem Pro Verão', '2022/10/16', '2022/10/26', 9650.99),
('Cultura Francesa', '2022/07/12', '2022/07/20', 3900.99),
('Vem Pro Verão', '2022/02/19', '2022/03/26', 7725.99),
('Promoção 3 destinos', '2022/09/13', '2022/10/18', 13500.99);
INSERT INTO purchases (users_id, travel_packages_id) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(5, 5);
INSERT INTO travel_packages_locations (travel_packages_id, location_id) 
VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (3, 4), (4, 1), (4, 2), (5, 3), (5, 5), (5, 4);
