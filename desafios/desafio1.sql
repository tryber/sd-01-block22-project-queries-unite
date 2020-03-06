CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users (
id INT PRIMARY KEY auto_increment,
fullname VARCHAR(100) NOT NULL,
current_age INT NOT NULL,
current_job VARCHAR(100) NOT NULL 
);

CREATE TABLE locations (
location_id INT PRIMARY KEY auto_increment,
country VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);

CREATE TABLE travel_packages (
travel_package_id INT PRIMARY KEY auto_increment,
package_name VARCHAR(255) NOT NULL,
value DOUBLE NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL
);

CREATE TABLE travel_packages_locations (
travel_package_id INT NOT NULL,
location_id INT NOT NULL,
FOREIGN KEY (travel_package_id) REFERENCES travel_packages(travel_package_id),
FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE purchases (
purchase_id INT PRIMARY KEY auto_increment,
id INT NOT NULL,
travel_package_id INT NOT NULL,
FOREIGN KEY (id) REFERENCES users(id),
FOREIGN KEY (travel_package_id) REFERENCES travel_packages(travel_package_id)
);