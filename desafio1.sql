CREATE DATABASE IF NOT EXISTS queries_unite;
USE queries_unite;
CREATE TABLE users(
    users_id INT PRIMARY KEY auto_increment,
    full_name VARCHAR(80) NOT NULL,
    current_age INT NOT NULL,
    current_job VARCHAR(80) NOT NULL
) engine = InnoDB;
CREATE TABLE locations(
    location_id INT PRIMARY KEY auto_increment,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL
) engine = InnoDB;
CREATE TABLE travel_packages(
    travel_package_id INT PRIMARY KEY auto_increment,
    name VARCHAR(30) NOT NULL,
    start_date DATETIME NOT NULL,
    return_date DATETIME NOT NULL,
    value_total decimal(15,2) NOT NULL,
    purchase_count INT NOT NULL DEFAULT 0
) engine = InnoDB;

CREATE TABLE purchases(
    purchase_id INT PRIMARY KEY auto_increment,
    users_id INT NOT NULL,
    travel_package_id INT NOT NULL,
    FOREIGN KEY (users_id) references users(users_id),
    FOREIGN KEY (travel_package_id) references travel_packages(travel_package_id)
) engine = InnoDB;
CREATE TABLE travel_packages_locations(
	travel_packages_locations_id INT PRIMARY KEY auto_increment,
    location_id INT NOT NULL,
    travel_package_id INT NOT NULL,
    FOREIGN KEY (location_id) references locations(location_id),
    FOREIGN KEY (travel_package_id) references travel_packages(travel_package_id)
) engine = InnoDB;
INSERT INTO users (full_name, current_age, current_job)
       VALUES ('Rafael Martins', 33,'Arquiteto'),
              ('Amanda Rocha', 25,'Desenvolvedora de Software'),
              ('Jonas Cabral', 18, 'Pintor'),
              ('Carol Domingues', 37, 'Contadora'),
              ('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO locations (city, country)
       VALUES ('Cape Town', 'África do Sul'),
              ('Bali', 'Indonésia'),
              ('Marrakesh', 'Marrocos'),
              ('Paris', 'França'),
              ('Nova Iorque', 'Estados Unidos');

INSERT INTO travel_packages (name, start_date, return_date, value_total)
		VALUES ("Promoção 3 destinos", '2022/09/25','2022/10/12', 12500.99),
			   ('Vem Pro Verão', '2022/10/16','2022/10/26', '9650.99'),
               ('Cultura Francesa', '2022/07/12','2022/07/20', '3900.99'),
			   ('Vem Pro Verão', '2022/02/19','2022/03/26', '7725.99'),
               ('Promoção 3 destinos', '2022/09/13','2022/10/18', '13500.99');
INSERT INTO purchases (users_id, travel_package_id)
       VALUES (1, 1),
              (2, 2),
              (3, 3),
              (4, 4),
              (5, 3),
              (5, 5);
INSERT INTO travel_packages_locations (location_id, travel_package_id)
       VALUES (1, 1),
			  (2, 1),
              (3, 1),
              (4, 2),
              (5, 2),
              (4, 3),
              (1, 4),
              (2, 4),
              (3, 5),
			  (5, 5),
              (4, 5);
