CREATE TABLE clone_troopers LIKE queries_unite.users;
ALTER TABLE queries_unite.clone_troopers ADD COLUMN nickname VARCHAR(50) NOT NULL;
ALTER TABLE queries_unite.clone_troopers MODIFY current_age TINYINT;
ALTER TABLE queries_unite.clone_troopers CHANGE full_name origin_name VARCHAR(1000) NOT NULL UNIQUE;
ALTER TABLE queries_unite.clone_troopers DROP COLUMN current_job;
