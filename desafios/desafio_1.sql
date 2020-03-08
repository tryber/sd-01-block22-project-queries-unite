CREATE DATABASE
IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
    id_users INT PRIMARY KEY auto_increment,
    full_name VARCHAR
(100) NOT NULL,
    current_age INT NOT NULL,
    current_job VARCHAR
(50)
);

CREATE TABLE travel_packages(
    id_travel_packages INT PRIMARY KEY auto_increment,
    package_name VARCHAR
(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE purchases(
    id_purchases INT PRIMARY KEY auto_increment,
    id_users INT NOT NULL,
    id_travel_packages INT NOT NULL,
	FOREIGN KEY
(id_users) references users
(id_users),
    FOREIGN KEY
(id_travel_packages) references travel_packages
(id_travel_packages),
    purchase_count INT DEFAULT 0
);

CREATE TABLE locations(
    id_locations INT PRIMARY KEY auto_increment,
    city_name VARCHAR
(50) NOT NULL,
    country_name VARCHAR
(50) NOT NULL
);

CREATE TABLE travel_packages_locations(
    id_travel_packages_locations INT PRIMARY KEY auto_increment,
    id_locations INT NOT NULL,
    id_travel_packages INT NOT NULL,
    FOREIGN KEY
(id_locations) references locations
(id_locations),
    FOREIGN KEY
(id_travel_packages) references travel_packages
(id_travel_packages)
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
    (package_name, start_date, end_date, price)
VALUES
    ('Promoção 3 destinos', '2022/09/25', '2022/10/12', 12500.99),
    ('Vem Pro Verão', '2022/10/16', '2022/10/26', 9650.99),
    ('Cultura Francesa', '2022/07/12', '2022/07/20', 3900.99),
    ('Vem Pro Verão', '2022/02/19', '2022/03/26', 7725.99),
    ('Promoção 3 destinos', '2022/09/13', '2022/10/18', 13500.99);

INSERT INTO locations
    (country_name, city_name)
VALUES
    ('África do Sul', 'Cape Town'),
    ('Indonésia', 'Bali'),
    ('Marrocos', 'Marrakesh'),
    ('França', 'Paris'),
    ('Estados Unidos', 'Nova Iorque');

INSERT INTO purchases
    (id_users, id_travel_packages)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 3),
    (5, 1);

INSERT INTO travel_packages_locations
    (id_travel_packages, id_locations)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 4),
    (4, 1),
    (4, 2),
    (5, 3),
    (5, 5),
    (5, 4);
