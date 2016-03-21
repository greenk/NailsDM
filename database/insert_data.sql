
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '615-556-4210', 'binhsuse@gmail.com', 'binh', 'bui', '2008 Harvest Lane', 'Nashville', 'TN', '37218', '123456', '1', '0', 'http://kenhtiengviet.com/myavatar.png');
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '115-516-4210', 'binbbhsuse@gmail.com', 'bifnh', 'bubi', '20028 Harvest Lane', 'Nashville', 'TN', '37218', '123456', '1', '0', 'http://kenhtiengviet.com/myavatar2.png');
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '615-932-2892', 'lequynh@yahoo.com', 'quynh', 'le', '6800 Charlotte Pike', 'Nashville', 'TN', '37209', 'password1', '1', '0', 'http://kenhtiengviet.com/myavatar3.png');
		
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160312', '20160312 08:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160312', '20160314 10:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160313', '20160312 09:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160313', '20160312 08:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160312', '20160312 08:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160312', '20160312 08:00:00', '20160312 19:00:00');		
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160312', '20160312 10:00:00', '20160312 15:00:00');
		

INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (1, 'Acrylic');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (1, 'Manicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (1, 'Pedicure');

INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (2, 'Manicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (2, 'Pedicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (2, 'GEL');

INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (3, 'Manicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (3, 'Pedicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (3, 'GEL');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (3, 'Eyebrown');
		

INSERT INTO customer_tb ( c_phone, c_email, c_firstname, c_lastname )
		VALUES ('615-123-4560', 'customer_email1@ktv.com', 'John', 'Doe');
INSERT INTO customer_tb ( c_phone, c_email )
		VALUES ('123-456-7980', 'customer_email2@emdeon.com', 'Queen', 'Mary');
INSERT INTO customer_tb ( c_phone, c_email )
		VALUES ('223-456-1245', 'customer_email3@change.com', 'Peter', 'Michael');
INSERT INTO customer_tb ( c_phone, c_email )
		VALUES ('449-784-4560', 'customer_email3@mcnails.com', 'Bad', 'Girl');
INSERT INTO customer_tb ( c_phone, c_email )
		VALUES ('457-879-4578', 'customer_email4@ktv.com', 'Boy', 'Big');
INSERT INTO customer_tb ( c_phone, c_email )
		VALUES ('457-885-7841', 'customer_email5@yesterday.com', 'Women', 'Name');
		
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 70.12, 5.00, 70.12, 0.00, 5.00, 0.00, 1, 1);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-02-10 12:02:40', '2016-02-10 14:03:40', '2016-02-10 15:20:54', 50.00, 5.00, 50.00, 0.00, 5.00, 0.00, 1, 1);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-02-10 12:02:40', '2016-02-10 14:03:40', '2016-02-10 15:20:54', 45.00, 5.00, 0.00, 45.00, 0.00, 5.00, 1, 1);

INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 90.00, 5.00, 90.00, 0.00, 5.00, 0.00, 2, 1);		
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 85.00, 0.00, 00.00, 85.00, 0.00, 5.00, 2, 1);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id)
		VALUES ('2016-02-10 11:02:40', '2016-02-10 12:03:40', '2016-03-10 15:20:54', 25.00, 10.00, 00.00, 25.00, 0.00, 10.00, 2, 1);
		

INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (1, 'Pedicure', 'N');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (1, 'Manicure', 'Y');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (2, 'Pedicure', 'Y');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (2, 'Acrylic Fullset', 'N');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (3, 'Acrylic Fill in', 'Y');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (4, 'Acrylic Fill in', 'Y');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (5, 'Eye Brown, Acrylic Fullset', 'N');
INSERT INTO work_name_tb ( work_id, work_name, gel_option)
		VALUES (6, 'Acrylic Fill in, Pedicure', 'N');
		
		
	
		

		
		
		