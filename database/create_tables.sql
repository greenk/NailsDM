CREATE DATABASE IF NOT EXISTS music_city_nails_db;

USE music_city_nails_db;

CREATE TABLE employee_tbs (
	id							INT						NOT NULL				AUTO_INCREMENT,
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
	
	PRIMARY KEY (id)
	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE employee_gotowork_tbs (
	date_at_work					DATETIME				NOT NULL,
	time_at_work					DATETIME				NOT NULL,
	time_leave_work					DATETIME,
	
	employee_id						INT	,	
	
	PRIMARY KEY (employee_id, date_at_work),
	FOREIGN KEY employee_gotowork_fk (employee_id) REFERENCES employee_tbs (id)
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

/* Create Trigger 
 * When insert or update row in employee_gotowork_tb
 * Update 'e_check_out' and 'e_at_work' columns in employee_tb
 * We update the 'e_check_out' and 'e_at_work' columns to let the system know that this emloyee is at workplace and ready to work
*/
DELIMITER $$
CREATE TRIGGER after_insert_gotowork_update_employee_tb
AFTER INSERT ON employee_gotowork_tbs 
FOR EACH ROW
BEGIN
	UPDATE employee_tbs	
	SET	e_check_out = NEW.time_at_work, e_at_work = 1
	WHERE id = NEW.employee_id;
    
END$$
DELIMITER ;

/* After_update_gotowork_update_employee_tb
 * This trigger will fire when the row in employee_gotowork_tb is being updated
 * Note: Make sure we only update 'time_leave_work' column in employee_gotowork_tb
 * If the 'time_leave_work' is updated, the 'e_at_work' and 'e_working' will be reset to 0 which means this employee is not at workplace.
 */

DELIMITER $$
CREATE TRIGGER after_update_gotowork_update_employee_tb
AFTER UPDATE ON employee_gotowork_tbs 
FOR EACH ROW
BEGIN
	UPDATE employee_tbs	
	SET	e_at_work = 0, e_working = 0
	WHERE id = NEW.employee_id;
    
END$$
DELIMITER ;


CREATE TABLE employee_skill_tbs (
	employee_id						INT						NOT NULL,
	e_skill							VARCHAR(128)			NOT NULL,
	
	PRIMARY KEY (employee_id, e_skill),
	FOREIGN KEY employee_skill_fk (employee_id) REFERENCES employee_tbs (id)	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE customer_tbs (
	id							BIGINT					UNSIGNED					NOT NULL		AUTO_INCREMENT,
	c_phone							VARCHAR(50)				,
	c_email							VARCHAR(128)			,
	c_firstname						VARCHAR(255)			,
	c_lastname						VARCHAR(255)			,
	
	PRIMARY KEY (id)
	
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE work_type_tbs (
	id			INT				UNSIGNED	NOT NULL	AUTO_INCREMENT,
	work_name				VARCHAR(255)				NOT NULL,
	work_category			VARCHAR(128),
	description				TEXT,
	work_type_price			FLOAT(10,2),
	
	
	/*work_id					BIGINT						UNSIGNED			NOT NULL,*/
	
	PRIMARY KEY (id)
	/*FOREIGN KEY work_name_tb_work_tb_fk (work_id) REFERENCES work_tb (work_id)*/
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

CREATE TABLE work_tbs (
	id							BIGINT					UNSIGNED					NOT NULL 		AUTO_INCREMENT,
	work_created_date					DATETIME				NOT NULL,
	work_started_date					DATETIME				NOT NULL,
	work_finished_date						DATETIME				NOT NULL,
	total							FLOAT(10,2)				NOT NULL,
	total_tip						FLOAT(10,2)				NOT NULL,
	cash_amount						FLOAT(10,2)				NOT NULL,
	card_amount						FLOAT(10,2)				NOT NULL,
	cash_tip_amount					FLOAT(10,2)				NOT NULL,
	card_tip_amount					FLOAT(10,2)				NOT NULL,
	
	employee_id						INT						,
	customer_id						BIGINT					UNSIGNED,
	work_type_id					INT						UNSIGNED,
	
	PRIMARY KEY (id),
	FOREIGN KEY work_tb_employee_tb_fk (employee_id) REFERENCES employee_tbs (id)
	ON DELETE SET NULL,
	FOREIGN KEY work_tb_customer_tb_fk (customer_id) REFERENCES customer_tbs (id)
	ON DELETE SET NULL,
	FOREIGN KEY work_tb_work_type_tb_fk (work_type_id) REFERENCES work_type_tbs (id)
	ON DELETE SET NULL	
		
) ENGINE=InnoDB DEFAULT CHARSET= utf8 DEFAULT COLLATE utf8_general_ci;

/* After_update_work_tb_update_employee_tb
 * This trigger will fire when a row in work_tb is being updated 
 * We create this trigger to help update employee current status
 * If the 'finish_date' column is updated then 'e_at_work' is 1, 'e_working' is 0, e_check_out = finish_date.
 * If the 'started_date' column is updated then 'e_at_work' is 1, 'e_working' is 1, e_check_in = started_date 
 */

DELIMITER $$
CREATE TRIGGER after_update_work_tb_update_employee_tb
AFTER UPDATE ON work_tbs
FOR EACH ROW
BEGIN
	IF (NEW.work_finished_date > OLD.work_finished_date)  THEN
	
		UPDATE employee_tbs	
		SET	e_at_work = 1, e_working = 0, e_check_out = NEW.finish_date
		WHERE id = NEW.employee_id;	
	
	END IF;
	
	IF (NEW.work_started_date > OLD.work_started_date) THEN
	
		UPDATE employee_tbs	
		SET	e_at_work = 1, e_working = 1, e_check_in = NEW.started_date
		WHERE id = NEW.employee_id;
		
	END IF;
    
END$$
DELIMITER ;
