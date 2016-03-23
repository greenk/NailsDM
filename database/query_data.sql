/* Test function */

/* Test after_insert_gotowork_update_employee_tb trigger */
/* INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160315', '2016-03-12 08:00:00', NULL); */

/* Test after_update_gotowork_update_employee_tb trigger */
/*	
	UPDATE employee_gotowork_tb
	SET time_leave_work = '2016-03-12 19:30:00'
	WHERE employee_id = 1 AND date_at_work = '20160312';
*/

/* Test after_update_work_tb_update_employee_tb trigger */
/*

INSERT INTO work_tb ( created_date, customer_id, work_type_id)
		VALUES ('2016-03-15 11:02:40', 1, 1);
UPDATE work_tb
	SET started_date = '2016-03-15 11:30:40', employee_id = 1
	WHERE work_id = 11;

UPDATE work_tb
	SET finish_date = '2016-03-15 12:21:40', total = 50.00, total_tip = 00.00, cash_amount = 50.00
	WHERE work_id = 11;
	
UPDATE work_tb
	SET total = 60.00, cash_amount = 60.00
	WHERE work_id = 11;
*/