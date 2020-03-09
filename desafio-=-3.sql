ALTER TABLE queries_unite ADD COLUMN nickname VARCHAR(50) NOT NULL;
ALTER TABLE queries_unite MODIFY current_age TINYINT;
ALTER TABLE queries_unite CHANGE full_name origin_name VARCHAR(100) NOT NULL;
ALTER TABLE queries_unite DROP COLUMN current_job;
