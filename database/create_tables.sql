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
	e_check_in						DATETIME				,
	e_check_out						DATETIME				,
	
	e_avatar_url					VARCHAR(2083)			,
	
	PRIMARY KEY (e_id)
	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE employee_gotowork_tb (
	date_at_work					DATE					NOT NULL,
	time_at_work					DATETIME				NOT NULL,
	time_leave_work					DATETIME,
	
	employee_id						INT	,	
	
	PRIMARY KEY (employee_id, date_at_work),
	FOREIGN KEY employee_gotowork_fk (employee_id) REFERENCES employee_tb (e_id)
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

/* Create Trigger 
 * When insert or update row in employee_gotowork_tb
 * Update e_check_out in employee_tb
 *
*/


CREATE TABLE employee_skill_tb (
	employee_id						INT						NOT NULL,
	e_skill							VARCHAR(128)			NOT NULL,
	
	PRIMARY KEY (employee_id, e_skill),
	FOREIGN KEY employee_skill_fk (employee_id) REFERENCES employee_tb (e_id)	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE customer_tb (
	c_id							BIGINT					UNSIGNED					NOT NULL		AUTO_INCREMENT,
	c_phone							VARCHAR(50)				,
	c_email							VARCHAR(128)			,
	c_firstname						VARCHAR(255)			,
	c_lastname						VARCHAR(255)			,
	
	PRIMARY KEY (c_id)
	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE work_type_tb (
	work_type_id			INT				UNSIGNED	NOT NULL	AUTO_INCREMENT,
	work_name				VARCHAR(255)				NOT NULL,
	work_category			VARCHAR(128),
	description				TEXT,
	work_type_price			FLOAT(10,2),
	
	
	/*work_id					BIGINT						UNSIGNED			NOT NULL,*/
	
	PRIMARY KEY (work_type_id)
	/*FOREIGN KEY work_name_tb_work_tb_fk (work_id) REFERENCES work_tb (work_id)*/
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

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
	work_type_id					INT						UNSIGNED,
	
	PRIMARY KEY (work_id),
	FOREIGN KEY work_tb_employee_tb_fk (employee_id) REFERENCES employee_tb (e_id)
	ON DELETE SET NULL,
	FOREIGN KEY work_tb_customer_tb_fk (customer_id) REFERENCES customer_tb (c_id)
	ON DELETE SET NULL,
	FOREIGN KEY work_tb_work_type_tb_fk (work_type_id) REFERENCES work_type_tb (work_type_id)
	ON DELETE SET NULL	
		
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;


