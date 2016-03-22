
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url, e_check_in, e_check_out)
		VALUES ( '615-556-4210', 'binhsuse@gmail.com', 'binh', 'bui', '2008 Harvest Lane', 'Nashville', 'TN', '37218', '123456', '1', '0', 'http://kenhtiengviet.com/myavatar.png' );
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '115-516-4210', 'binbbhsuse@gmail.com', 'bifnh', 'bubi', '20028 Harvest Lane', 'Nashville', 'TN', '37218', '123456', '1', '0', 'http://kenhtiengviet.com/myavatar2.png');
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '615-932-2892', 'lequynh@yahoo.com', 'quynh', 'le', '6800 Charlotte Pike', 'Nashville', 'TN', '37209', 'password1', '1', '0', 'http://kenhtiengviet.com/myavatar3.png');
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '615-912-2292', 'letruc@yahoo.com', 'truc', 'thanh', '7200 Charlotte Pike', 'Nashville', 'TN', '37219', 'password1', '1', '0', 'http://kenhtiengviet.com/myavatar3.png');
		
INSERT INTO employee_tb ( e_phone, e_email, e_first_name, e_last_name, e_street, e_city, e_state, e_zip, e_password, e_at_work, e_working, e_avatar_url)
		VALUES ( '515-212-2592', 'nguyenbao@yahoo.com', 'bao', 'nguyen', '3005 Lebanon Pike', 'Nashville', 'TN', '37225', 'password1', '1', '0', 'http://kenhtiengviet.com/myavatar3.png');
		
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160312', '20160312 08:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160311', '20160311 10:00:00', '20160311 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160313', '20160312 09:00:00', '20160313 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (1, '20160310', '20160310 08:00:00', '20160310 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160312', '20160312 08:00:00', '20160312 19:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160313', '20160313 08:00:00', '20160313 19:00:00');		
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (2, '20160314', '20160314 10:00:00', '20160314 15:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (3, '20160314', '20160314 10:00:00', '20160314 15:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (4, '20160314', '20160314 10:00:00', '20160314 15:00:00');
INSERT INTO employee_gotowork_tb ( employee_id, date_at_work, time_at_work, time_leave_work)
		VALUES (5, '20160314', '20160314 10:00:00', '20160314 15:00:00');
		

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
		
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (4, 'Manicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (4, 'Pedicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (4, 'GEL');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (4, 'Design');

INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (5, 'Manicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (5, 'Pedicure');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (5, 'GEL');
INSERT INTO employee_skill_tb ( employee_id, e_skill)
		VALUES (5, 'Design');
		

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
		
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 15.00, 5.00, 15.00, 0.00, 5.00, 0.00, 1, 1, 1);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 25.00, 5.00, 25.00, 0.00, 5.00, 0.00, 1, 1, 15);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-02-10 12:02:40', '2016-02-10 14:03:40', '2016-02-10 15:20:54', 50.00, 5.00, 50.00, 0.00, 5.00, 0.00, 1, 2, 10);		
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-02-10 12:02:40', '2016-02-10 14:03:40', '2016-02-10 15:20:54', 45.00, 5.00, 0.00, 45.00, 0.00, 5.00, 1, 2, 2);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-02-10 12:02:40', '2016-02-10 15:30:40', '2016-02-10 17:25:54', 40.00, 5.00, 0.00, 40.00, 0.00, 5.00, 1, 3, 4);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-02-11 12:02:40', '2016-02-11 14:03:40', '2016-02-11 15:20:54', 20.00, 5.00, 0.00, 20.00, 0.00, 5.00, 1, 2, 3);

INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 40.00, 5.00, 40.00, 0.00, 5.00, 0.00, 2, 1, 17);		
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-03-10 12:02:40', '2016-03-10 14:03:40', '2016-03-10 15:20:54', 25.00, 5.00, 00.00, 25.00, 0.00, 5.00, 2, 4, 5);
INSERT INTO work_tb ( created_date, started_date, finish_date, total, total_tip, cash_amount, card_amount, cash_tip_amount, card_tip_amount, employee_id, customer_id, work_type_id)
		VALUES ('2016-02-10 11:02:40', '2016-02-10 12:03:40', '2016-03-10 15:20:54', 7.00, 00.00, 00.00, 7.00, 0.00, 00.00, 2, 5, 6);
		

INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Spa Manicure', 'regular polish and manicure service', 15.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'SeaSalt Manicure', 'regular polish and manicure with sea salt', 20.00 );
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Deluxe Manicure', 'regular polish and manicure with sea salt, hot tower', 25.00);	
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Gel Manicure', 'regular manicure and gel polish', 40.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Gel polish change', 'Gel polish changing', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Polish change', 'changing regular color', 7.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Hand', 'Other service', 'asking nail technician for detail and price', 00.00);

		
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Full set', 'regular full set', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Fill in', 'fill arcrylic ', 15.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Pink and White Full set', 'cover your nail with pink and white powder', 50.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Pink and White Fill in', 'fill pink and white', 35.00);		
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'White tip Full set', 'french tip finish with your acrylic nails', 30.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Gel Polish on top', 'polishing gel color on your acrylic nails', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Hand', 'Other', 'asking nail technician for more detail and price', 00.00);

INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Feet', 'Spa Pedicure', 'regular pedicure', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Feet', 'SeaSalt Pedicure', 'regular pedicure with seasalt', 30.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Feet', 'Deluxe Pedicure', 'regular pedicure with seasalt, hot tower, massage', 40.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Feet', 'Gel polish change', 'using gel color on your toes', 35.00);

INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Feet', 'Full set', 'cover your toes with powder', 35.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Feet', 'Fill in', 'fill in', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Feet', 'Gel Polish on top', 'polishing gel color on your acrylic nails', 25.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Acrylic Feet', 'Other', 'asking nail technician for more detail and price', 00.00);		

INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Waxing', 'Eyebrowns', 'cleaning your eyebrowns', 10.00);
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Waxing', 'Chin', 'cleaning your chin', 12.00);		
INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Waxing', 'Other', 'asking a cosmotologist for more detail and price', 00.00);		

INSERT INTO work_name_tb ( work_category, work_name, description, work_type_price)
		VALUES ('Other', 'Other service', 'asking nail technician for more detail and price', 00.00);				
		
	
		

		
		
		