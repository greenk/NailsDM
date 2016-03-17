CREATE DATABASE IF NOT EXISTS music_city_nails_db;

USE music_city_nails_db;

CREATE TABLE employee_tb (
	e_id							INT						NOT NULL				AUTO_INCREMENT,
	e_phone							VARCHAR(50)				NOT NULL,
	e_email							VARCHAR(128)			,
	e_first_name					VARCHAR(128)			NOT NULL,
	e_last_name						VARCHAR(128)			NOT NULL,
	e_street						VARCHAR(255)			,
	e_city							VARCHAR(255)			,
	e_state							VARCHAR(128)			,
	e_zip							VARCHAR(128)			,
	
	e_password						VARCHAR(255)			NOT NULL,
	e_at_work						BOOLEAN					NOT NULL,
	e_working						BOOLEAN					NOT NULL,
	
	e_avatar_url					VARCHAR(2083)			,
	
	PRIMARY KEY (e_id)
	
) ENGINE=InnoDB;

CREATE TABLE employee_skill_tb (
	employee_id						INT						NOT NULL,
	e_skill							VARCHAR(128)			NOT NULL,
	
	PRIMARY KEY (employee_id, e_skill),
	FOREIGN KEY employee_skill_fk (employee_id) REFERENCES employee_tb (e_id)	
) ENGINE=InnoDB;

CREATE TABLE customer_tb (
	c_id							BIGINT					UNSIGNED					NOT NULL		AUTO_INCREMENT,
	c_phone							VARCHAR(50)				,
	c_email							VARCHAR(128)			,
	
	PRIMARY KEY (c_id)
	
) ENGINE=InnoDB;

CREATE TABLE work_tb (
	work_id							BIGINT					UNSIGNED					NOT NULL 		AUTO_INCREMENT,
	created_date					DATETIME				NOT NULL,
	started_date					DATETIME				NOT NULL,
	finish_date						DATETIME				NOT NULL,
	total							FLOAT(10,2)				NOT NULL,
	total_tip						FLOAT(10,2)				NOT NULL,
	cash_amount						FLOAT(10,2)				NOT NULL,
	card_amount						FLOAT(10,2)				NOT NULL,
	cash_tip_amount					FLOAT(10,2)				NOT NULL,
	card_tip_amount					FLOAT(10,2)				NOT NULL,
	
	employee_id						INT						,
	customer_id						BIGINT					UNSIGNED,
	
	PRIMARY KEY (work_id),
	FOREIGN KEY work_tb_employee_tb_fk (employee_id) REFERENCES employee_tb (e_id)
	ON DELETE SET NULL,
	FOREIGN KEY work_tb_customer_tb_fk (customer_id) REFERENCES customer_tb (c_id)
	ON DELETE SET NULL
		
) ENGINE=InnoDB;

CREATE TABLE work_name_tb (
	work_id					BIGINT						UNSIGNED			NOT NULL,
	work_name				VARCHAR(255)				NOT NULL,
	gel_option				VARCHAR(64),					
	
	PRIMARY KEY (work_name, work_id),
	FOREIGN KEY work_name_tb_work_tb_fk (work_id) REFERENCES work_tb (work_id)
) ENGINE=InnoDB;
