CREATE DATABASE IF NOT EXISTS queries_unite;
USE queries_unite;

CREATE TABLE users(
  user_id INT PRIMARY KEY auto_increment,
  full_name VARCHAR(50) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(50) NOT NULL
);

CREATE TABLE travel_packages(
  travel_package_id INT PRIMARY KEY auto_increment,
  travel_package_name VARCHAR(50),
  cost DECIMAL(7,2) NOT NULL,
  departure_date DATE NOT NULL,
  arrival_date DATE NOT NULL,
  purchase_count INT DEFAULT 0
);

CREATE TABLE locations(
  locations_id INT PRIMARY KEY auto_increment,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

CREATE TABLE purchases(
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  travel_package_id INT NOT NULL,
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages (travel_package_id)
);

CREATE TABLE travel_packages_locations(
  travel_package_id INT NOT NULL,
  locations_id INT NOT NULL,
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages (travel_package_id),
  FOREIGN KEY (locations_id) REFERENCES locations (locations_id)
);

INSERT INTO users
(full_name, current_age, current_job)
VALUES
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages
(travel_package_name, cost, departure_date, arrival_date)
VALUES
('Promoção 3 destinos', 12500.99, '2022-09-25', '2022-10-12'),
('Vem Pro Verão', 9650.99, '2022-10-16', '2022-10-26'),
('Cultura Francesa', 3900.99, '2022-07-12', '2022-07-20'),
('Vem Pro Verão', 7725.99, '2022-02-19', '2022-03-26'),
('Promoção 3 destinos', 13500.99, '2022-09-13', '2022-10-18');

INSERT INTO locations
(city, country)
VALUES
('Cape Town', 'África do Sul'),
('Bali', 'Indonésia'),
('Marrakesh', 'Marrocos'),
('Paris', 'França'),
('Nova Iorque', 'Estados Unidos');

INSERT INTO purchases
(user_id, travel_package_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(5, 5);

INSERT INTO travel_packages_locations
(travel_package_id, locations_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 4),
(4, 1),
(4, 2),
(5, 4),
(5, 3),
(5, 5),
(5, 4);
