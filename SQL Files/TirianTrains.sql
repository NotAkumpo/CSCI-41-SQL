-- TABLE CREATION STATEMENTS
CREATE TABLE Train_Model (
	model_name VARCHAR(5) NOT NULL DEFAULT "X-000",
	max_speed_in_kph INT NOT NULL DEFAULT 120,
    total_seats INT NOT NULL DEFAULT 70,
    total_toilets INT NOT NULL DEFAULT 1,
    train_series VARCHAR(1) NOT NULL DEFAULT "X",
    PRIMARY KEY (model_name)
);

CREATE TABLE Train (
	train_id VARCHAR(6) NOT NULL DEFAULT 000000,
	`condition` VARCHAR(255) NOT NULL DEFAULT "Excellent",
	status VARCHAR(255) NOT NULL DEFAULT "Active",
	model_name VARCHAR(255) NOT NULL DEFAULT "X-000",
    PRIMARY KEY (train_id),
	FOREIGN KEY (model_name) REFERENCES train_model(model_name)
);


CREATE TABLE Passenger_Amenity (
    model_name VARCHAR(5) NOT NULL DEFAULT "X-000",
    amenity VARCHAR(255),
    PRIMARY KEY (model_name, amenity),
    FOREIGN KEY (model_name) REFERENCES Train_Model(model_name)
);

CREATE TABLE Maintenance_Report (
    maintenance_report_id VARCHAR(7) NOT NULL DEFAULT "X000000",
    date_done DATE NOT NULL DEFAULT "2010-02-01",
    train_condition VARCHAR(255) NOT NULL DEFAULT "Excellent",
    crew_in_charge VARCHAR(255) NOT NULL DEFAULT "J. Smith",
    train_id VARCHAR(6) NOT NULL DEFAULT 000000,
    PRIMARY KEY (maintenance_report_id),
    FOREIGN KEY (train_id) REFERENCES Train(train_id)
);

CREATE TABLE Task ( 
    maintenance_report_id VARCHAR(255) NOT NULL DEFAULT "X000000",
    task VARCHAR(255) NOT NULL DEFAULT "Routine Check",
    PRIMARY KEY (maintenance_report_id, task),
    FOREIGN KEY (maintenance_report_id) REFERENCES Maintenance_Report(maintenance_report_id)
);

CREATE TABLE Route (
    route_id VARCHAR(8) NOT NULL DEFAULT "XXXX-000",
    route_type VARCHAR(2) NOT NULL DEFAULT "XX",
    expected_duration TIME NOT NULL DEFAULT "00:00:00",
    starting_station VARCHAR(255) NOT NULL DEFAULT "XXXX",
    ending_station VARCHAR(255) NOT NULL DEFAULT "XXXX",
    number_of_trips INT NOT NULL DEFAULT 0,
    PRIMARY KEY (route_id)
);

CREATE TABLE Train_Route_Assignment (
    train_id VARCHAR(6) NOT NULL DEFAULT 000000,
    route_id VARCHAR(8) NOT NULL DEFAULT "XXXX-000",
    PRIMARY KEY (train_id, route_id),
    FOREIGN KEY (train_id) REFERENCES Train(train_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)   
);

CREATE TABLE Trip_Schedule (
    trip_schedule_id VARCHAR(5) NOT NULL DEFAULT 00000,
    date DATE NOT NULL DEFAULT "2010-01-01",
    PRIMARY KEY (trip_schedule_id)
);

CREATE TABLE Trip (
    trip_id VARCHAR(11) NOT NULL DEFAULT "XXXXX-00000",
    origin VARCHAR(255) NOT NULL DEFAULT "XXXX",
    destination VARCHAR(255) NOT NULL DEFAULT "XXXX",
    departure_time TIME NOT NULL DEFAULT "00:00:00",
    arrival_time TIME NOT NULL DEFAULT "00:00:00",
    train_number INT NOT NULL DEFAULT 00000,
    trip_type VARCHAR(3) NOT NULL DEFAULT "XXX",
    route_id VARCHAR(255) NOT NULL DEFAULT "XXXX-000",
    trip_schedule_id VARCHAR(5) NOT NULL DEFAULT 00000,
    PRIMARY KEY (trip_id),
    FOREIGN KEY (trip_schedule_id) REFERENCES Trip_Schedule(trip_schedule_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);

CREATE TABLE Local_Trip (
    ltr_trip_id VARCHAR(11) NOT NULL DEFAULT "XXXXX-00000", 
    PRIMARY KEY (ltr_trip_id),
    FOREIGN KEY (ltr_trip_id) REFERENCES Trip(trip_id)
);


CREATE TABLE Inter_Town_Trip (
    itr_trip_id VARCHAR(11) NOT NULL DEFAULT "XXXXX-00000",
    cost_in_lion_coins INT NOT NULL DEFAULT 0,
    duration_time TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY (itr_trip_id),
    FOREIGN KEY(itr_trip_id) REFERENCES Trip(trip_id)
);

CREATE TABLE Passenger (
    customer_id VARCHAR(11) NOT NULL DEFAULT "XX-00000000",
    name VARCHAR(255) NOT NULL DEFAULT "XXXX",
    birth_date DATE NOT NULL DEFAULT "2000-01-01",
    gender VARCHAR(1) NOT NULL DEFAULT "X",
    PRIMARY KEY (customer_id)
);

CREATE TABLE Train_Ticket (
    ticket_id VARCHAR(9) NOT NULL DEFAULT "XX0000000",
    date DATE NOT NULL DEFAULT "2010-01-01",
    total_cost_in_lion_coins INT NOT NULL DEFAULT 0,
    ticket_type VARCHAR(2) NOT NULL DEFAULT "XX",
    customer_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (customer_id) REFERENCES Passenger(customer_id)
);

CREATE TABLE Inter_Town_Ticket (
    it_ticket_id VARCHAR(9) NOT NULL,
    number_of_trips INT NOT NULL,
    PRIMARY KEY (it_ticket_id),
    FOREIGN KEY (it_ticket_id) REFERENCES Train_Ticket(ticket_id)
);


CREATE TABLE Local_Ticket (
    lt_ticket_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (lt_ticket_id),
    FOREIGN KEY (lt_ticket_id) REFERENCES Train_Ticket(ticket_id)
);

CREATE TABLE Trip_Ticket_Assignment (
    itr_trip_id VARCHAR(11) NOT NULL,
    it_ticket_id VARCHAR(9) NOT NULL,
    PRIMARY KEY (itr_trip_id, it_ticket_id),
    FOREIGN KEY (itr_trip_id) REFERENCES Inter_Town_Trip(itr_trip_id),
    FOREIGN KEY (it_ticket_id) REFERENCES Inter_Town_Ticket(it_ticket_id)
);


-- INSERT STATEMENTS
INSERT INTO Train_Model 
VALUES ("S-393", 200, 180, 15, "S");

INSERT INTO Train_Model 
VALUES ("A-265", 120, 70, 7, "A");

INSERT INTO Train_Model 
VALUES ("S-163", 180, 160, 10, "S");

INSERT INTO Train_Model 
VALUES ("A-475", 100, 50, 4, "A");

INSERT INTO Train_Model 
VALUES ("A-162", 100, 60, 6, "A");



INSERT INTO Train 
VALUES (000001, "Excellent", "Active", "S-393");

INSERT INTO Train 
VALUES (000002, "Excellent", "Active", "A-265");

INSERT INTO Train 
VALUES (000003, "Pristine", "Active", "S-163");

INSERT INTO Train 
VALUES (000004, "Very Good", "Active", "A-475");

INSERT INTO Train 
VALUES (000005, "Poor", "Inactive", "A-162");



INSERT INTO Passenger_Amenity 
VALUES ("S-393", "Tissues");

INSERT INTO Passenger_Amenity 
VALUES ("A-265", "Chicken Nuggets");

INSERT INTO Passenger_Amenity 
VALUES ("S-163", "Chicken Fingers");

INSERT INTO Passenger_Amenity 
VALUES ("A-475", "Taco Meat");

INSERT INTO Passenger_Amenity 
VALUES ("A-162", "Napkins");



INSERT INTO Maintenance_Report
VALUES ("C142382", "2024-10-10", "Excellent", "K. Ozo", 000001);

INSERT INTO Maintenance_Report
VALUES ("D194815", "2024-11-11", "Excellent", "T. Tan", 000002);

INSERT INTO Maintenance_Report
VALUES ("E142382", "2024-10-13", "Pristine", "K. Ozo", 000003);

INSERT INTO Maintenance_Report
VALUES ("F194815", "2024-11-13", "Very Good", "T. Tan", 000004);

INSERT INTO Maintenance_Report
VALUES ("G194815", "2024-11-20", "Poor", "T. Tan", 000005);



INSERT INTO Task
VALUES ("C142382", "Cleaning Toilet");

INSERT INTO Task
VALUES ("D194815", "Vacuuming Seats");

INSERT INTO Task
VALUES ("E142382", "Picking Up Trash");

INSERT INTO Task
VALUES ("F194815", "Washing Floor");

INSERT INTO Task
VALUES ("G194815", "Cleaning Windows");




INSERT INTO Route 
VALUES ("DLAV-162", "IR", "11:30:00", "Dancing Lawn", "Anvard", 12);

INSERT INTO Route 
VALUES ("MTDL-163", "IR", "13:00:00", "Mr. Tumms", "Dancing Lawn", 17);

INSERT INTO Route 
VALUES ("BDAE-017", "LR", "00:15:00", "Beaver's Dam", "Allies Enclave", 5);

INSERT INTO Route 
VALUES ("LPAE-018", "LR", "00:30:00", "The Lamp Post", "Allies Enclave", 20);

INSERT INTO Route 
VALUES ("TWLP-019", "LR", "04:15:00", "The Wardrobe", "The Lamp Post", 63);


INSERT INTO Train_Route_Assignment
VALUES (000001, "DLAV-162");

INSERT INTO Train_Route_Assignment
VALUES (000002, "MTDL-163");

INSERT INTO Train_Route_Assignment
VALUES (000003, "BDAE-017");

INSERT INTO Train_Route_Assignment
VALUES (000004, "LPAE-018");

INSERT INTO Train_Route_Assignment
VALUES (000005, "TWLP-019");




INSERT INTO Trip_Schedule
VALUES (00001, "2024-11-25");

INSERT INTO Trip_Schedule
VALUES (00002, "2024-11-26");

INSERT INTO Trip_Schedule
VALUES (00003, "2024-11-27");

INSERT INTO Trip_Schedule
VALUES (00004, "2024-11-28");

INSERT INTO Trip_Schedule
VALUES (00005, "2024-11-29");

INSERT INTO Trip VALUES ('TWTLP-00001', 'The Wardrobe', 'The Lamp Post', '06:51:00', '07:02:00', '00002', 'LTR', 'BDAE-017', '1');
INSERT INTO Trip VALUES ('TLPBD-00001', 'The Lamp Post', 'Beaver''s Dam', '12:45:00', '12:49:00', '00004', 'LTR', 'TWLP-019', '1');
INSERT INTO Trip VALUES ('MTAEX-00001', 'Mr. Tumms', 'Allie''s Enclave', '10:08:00', '11:03:00', '00003', 'ITR', 'MTDL-163', '3');
INSERT INTO Trip VALUES ('ANDLX-00001', 'Anvard', 'Dancing Lawn', '08:15:00', '09:00:00', '00001', 'ITR', 'DLAV-162', '4');


INSERT INTO Local_Trip VALUES ("TWTLP-00001");
INSERT INTO Local_Trip VALUES ("TLPBD-00001");

INSERT INTO Inter_Town_Trip VALUES ('ANDLX-00001', 6, 45);
INSERT INTO Inter_Town_Trip VALUES ('MTAEX-00001', 5, 55);



INSERT INTO Passenger 
VALUES ("AE-18237241", "Michelle Q.", "2002-01-01", "F");

INSERT INTO Passenger 
VALUES ("TT-17263191", "Kylie O.", "2002-08-03", "F");

INSERT INTO Passenger 
VALUES ("BE-17382456", "Alan C.", "2002-11-09", "M");

INSERT INTO Passenger 
VALUES ("CD-31257892", "Coco E.", "2002-06-24", "F");

INSERT INTO Passenger 
VALUES ("EL-92847593", "Tristana T.", "2002-10-21", "F");



INSERT INTO Train_Ticket
VALUES ("AE8192130", "2021-05-02", 26, "IT", "AE-18237241");

INSERT INTO Train_Ticket
VALUES ("AD2303061", "2021-05-02", 31, "IT", "TT-17263191");

INSERT INTO Train_Ticket
VALUES ("CP1723492", "2021-11-24", 5, "LT", "BE-17382456");

INSERT INTO Train_Ticket
VALUES ("CQ2156780", "2021-11-25", 5, "LT", "CD-31257892");

INSERT INTO Train_Ticket
VALUES ("CR3024695", "2021-11-26", 5, "LT", "EL-92847593");


INSERT INTO Inter_Town_Ticket
VALUES ("AE8192130", 3);

INSERT INTO Inter_Town_Ticket
VALUES ("AD2303061", 5);

INSERT INTO Local_Ticket
VALUES ("CP1723492");

INSERT INTO Local_Ticket
VALUES ("CQ2156780");

INSERT INTO Local_Ticket
VALUES ("CR3024695");


INSERT INTO Trip_Ticket_Assignment
VALUES ("ANDLX-00001", "AE8192130");

INSERT INTO Trip_Ticket_Assignment
VALUES ("MTAEX-00001", "AD2303061");


-- TRIP SCHEDULING FUNCTION STATEMENTS

-- DUMMY ROUTE
INSERT INTO tripscheduling_route VALUES ('XXXX-000', 'XX', '00:00:00', 'XXXX', 'XXXX', 0);


-- TRIP SCHEDULE INSERTS
INSERT INTO tripscheduling_tripschedule VALUES ('00001', '2024-11-10');
INSERT INTO tripscheduling_tripschedule VALUES ('00002', '2024-11-11');
INSERT INTO tripscheduling_tripschedule VALUES ('00003', '2024-11-12');
INSERT INTO tripscheduling_tripschedule VALUES ('00004', '2024-11-13');
INSERT INTO tripscheduling_tripschedule VALUES ('00005', '2024-11-14');
INSERT INTO tripscheduling_tripschedule VALUES ('00006', '2024-11-15');
INSERT INTO tripscheduling_tripschedule VALUES ('00007', '2024-11-16');
INSERT INTO tripscheduling_tripschedule VALUES ('00008', '2024-11-17');
INSERT INTO tripscheduling_tripschedule VALUES ('00009', '2024-11-18');
INSERT INTO tripscheduling_tripschedule VALUES ('00010', '2024-11-19');
INSERT INTO tripscheduling_tripschedule VALUES ('00011', '2024-11-20');
INSERT INTO tripscheduling_tripschedule VALUES ('00012', '2024-11-21');
INSERT INTO tripscheduling_tripschedule VALUES ('00013', '2024-11-22');
INSERT INTO tripscheduling_tripschedule VALUES ('00014', '2024-11-23');
INSERT INTO tripscheduling_tripschedule VALUES ('00015', '2024-11-24');
INSERT INTO tripscheduling_tripschedule VALUES ('00016', '2024-11-25');
INSERT INTO tripscheduling_tripschedule VALUES ('00017', '2024-11-26');
INSERT INTO tripscheduling_tripschedule VALUES ('00018', '2024-11-27');
INSERT INTO tripscheduling_tripschedule VALUES ('00019', '2024-11-28');
INSERT INTO tripscheduling_tripschedule VALUES ('00020', '2024-11-29');
INSERT INTO tripscheduling_tripschedule VALUES ('00021', '2024-11-30');
INSERT INTO tripscheduling_tripschedule VALUES ('00022', '2024-12-01');
INSERT INTO tripscheduling_tripschedule VALUES ('00023', '2024-12-02');
INSERT INTO tripscheduling_tripschedule VALUES ('00024', '2024-12-03');
INSERT INTO tripscheduling_tripschedule VALUES ('00025', '2024-12-04');
INSERT INTO tripscheduling_tripschedule VALUES ('00026', '2024-12-05');
INSERT INTO tripscheduling_tripschedule VALUES ('00027', '2024-12-06');

ALTER TABLE tripscheduling_trip 
MODIFY COLUMN departure_time TIME(0),
MODIFY COLUMN arrival_time TIME(0);


-- LOCAL TRIP INSERTS
INSERT INTO tripscheduling_trip VALUES ('BDAEX-00001', 'Beaver''s Dam', 'Allie''s Enclave', '08:39:00', '08:44:00', '18271', 'LTR', 'XXXX-000', '00014');
INSERT INTO tripscheduling_trip VALUES ('BDAEX-00002', 'Beaver''s Dam', 'Allie''s Enclave', '11:13:00', '11:18:00', '82734', 'LTR', 'XXXX-000', '00009');
INSERT INTO tripscheduling_trip VALUES ('AETWX-00001', 'Allie''s Enclave', 'The Wardrobe', '21:02:00', '21:10:00', '61741', 'LTR', 'XXXX-000', '00011');
INSERT INTO tripscheduling_trip VALUES ('AETWX-00002', 'Allie''s Enclave', 'The Wardrobe', '13:18:00', '13:26:00', '71823', 'LTR', 'XXXX-000', '00021');
INSERT INTO tripscheduling_trip VALUES ('TWTLP-00001', 'The Wardrobe', 'The Lamp Post', '06:51:00', '07:02:00', '91827', 'LTR', 'XXXX-000', '00026');
INSERT INTO tripscheduling_trip VALUES ('TLPBD-00001', 'The Lamp Post', 'Beaver''s Dam', '12:45:00', '12:49:00', '29183', 'LTR', 'XXXX-000', '00002');

INSERT INTO tripscheduling_localtrip VALUES ('BDAEX-00001');
INSERT INTO tripscheduling_localtrip VALUES ('BDAEX-00002');
INSERT INTO tripscheduling_localtrip VALUES ('AETWX-00001');
INSERT INTO tripscheduling_localtrip VALUES ('AETWX-00002');
INSERT INTO tripscheduling_localtrip VALUES ('TWTLP-00001');
INSERT INTO tripscheduling_localtrip VALUES ('TLPBD-00001');


-- INTERTOWN TRIP INSERTS
INSERT INTO tripscheduling_trip VALUES ('MTAEX-00001', 'Mr. Tumms', 'Allie''s Enclave', '10:08:00', '11:03:00', '72813', 'ITR', 'XXXX-000', '00023');
INSERT INTO tripscheduling_intertowntrip VALUES ('MTAEX-00001', 5, 55);
INSERT INTO tripscheduling_trip VALUES ('AEMTX-00001', 'Allie''s Enclave', 'Mr. Tumms', '13:51:00', '14:46:00', '91873', 'ITR', 'XXXX-000', '00016');
INSERT INTO tripscheduling_intertowntrip VALUES ('AEMTX-00001', 5, 55);

INSERT INTO tripscheduling_trip VALUES ('ACAEX-00001', 'Aslan''s Camp', 'Allie''s Enclave', '11:47:00', '12:47:00', '87345', 'ITR', 'XXXX-000', '00016');
INSERT INTO tripscheduling_intertowntrip VALUES ('ACAEX-00001', 7, 60);
INSERT INTO tripscheduling_trip VALUES ('AEACX-00001', 'Allie''s Enclave', 'Aslan''s Camp', '14:22:00', '15:22:00', '34817', 'ITR', 'XXXX-000', '00005');
INSERT INTO tripscheduling_intertowntrip VALUES ('AEACX-00001', 7, 60);

INSERT INTO tripscheduling_trip VALUES ('CPAEX-00001', 'Cauldron Pool', 'Allie''s Enclave', '06:12:00', '07:42:00', '97413', 'ITR', 'XXXX-000', '00012');
INSERT INTO tripscheduling_intertowntrip VALUES ('CPAEX-00001', 10, 90);
INSERT INTO tripscheduling_trip VALUES ('AECPX-00001', 'Allie''s Enclave', 'Cauldron Pool', '17:38:00', '19:08:00', '25671', 'ITR', 'XXXX-000', '00022');
INSERT INTO tripscheduling_intertowntrip VALUES ('AECPX-00001', 10, 90);

INSERT INTO tripscheduling_trip VALUES ('DLAEX-00001', 'Dancing Lawn', 'Allie''s Enclave', '12:01:00', '13:46:00', '83941', 'ITR', 'XXXX-000', '00010');
INSERT INTO tripscheduling_intertowntrip VALUES ('DLAEX-00001', 6, 105);
INSERT INTO tripscheduling_trip VALUES ('AEDLX-00001', 'Allie''s Enclave', 'Dancing Lawn', '15:15:00', '17:00:00', '43189', 'ITR', 'XXXX-000', '00003');
INSERT INTO tripscheduling_intertowntrip VALUES ('AEDLX-00001', 6, 105);

INSERT INTO tripscheduling_trip VALUES ('CPFCX-00001', 'Cauldron Pool', 'Father Christmas', '10:18:00', '11:38:00', '71938', 'ITR', 'XXXX-000', '00020');
INSERT INTO tripscheduling_intertowntrip VALUES ('CPFCX-00001', 8, 80);
INSERT INTO tripscheduling_trip VALUES ('FCCPX-00001', 'Father Christmas', 'Cauldron Pool', '13:41:00', '15:01:00', '34821', 'ITR', 'XXXX-000', '00019');
INSERT INTO tripscheduling_intertowntrip VALUES ('FCCPX-00001', 8, 80);

INSERT INTO tripscheduling_trip VALUES ('CPCTX-00001', 'Cauldron Pool', 'Cherry Tree', '09:14:00', '10:24:00', '21874', 'ITR', 'XXXX-000', '00011');
INSERT INTO tripscheduling_intertowntrip VALUES ('CPCTX-00001', 12, 70);
INSERT INTO tripscheduling_trip VALUES ('CTXCX-00001', 'Cherry Tree', 'Cauldron Pool', '16:17:00', '17:27:00', '56192', 'ITR', 'XXXX-000', '00009');
INSERT INTO tripscheduling_intertowntrip VALUES ('CTXCX-00001', 12, 70);

INSERT INTO tripscheduling_trip VALUES ('FCCTX-00001', 'Father Christmas', 'Cherry Tree', '11:24:00', '12:14:00', '78493', 'ITR', 'XXXX-000', '00004');
INSERT INTO tripscheduling_intertowntrip VALUES ('FCCTX-00001', 5, 50);
INSERT INTO tripscheduling_trip VALUES ('CTFCX-00001', 'Cherry Tree', 'Father Christmas', '14:52:00', '15:42:00', '12485', 'ITR', 'XXXX-000', '00006');
INSERT INTO tripscheduling_intertowntrip VALUES ('CTFCX-00001', 5, 50);

INSERT INTO tripscheduling_trip VALUES ('FCWCX-00001', 'Father Christmas', 'Witch''s Camp', '09:35:00', '10:15:00', '34871', 'ITR', 'XXXX-000', '00008');
INSERT INTO tripscheduling_intertowntrip VALUES ('FCWCX-00001', 7, 40);
INSERT INTO tripscheduling_trip VALUES ('WCFCX-00001', 'Witch''s Camp', 'Father Christmas', '17:00:00', '17:40:00', '84135', 'ITR', 'XXXX-000', '00008');
INSERT INTO tripscheduling_intertowntrip VALUES ('WCFCX-00001', 7, 40);

INSERT INTO tripscheduling_trip VALUES ('STWCX-00001', 'The Stone Table', 'Witch''s Camp', '11:30:00', '12:15:00', '67893', 'ITR', 'XXXX-000', '00018');
INSERT INTO tripscheduling_intertowntrip VALUES ('STWCX-00001', 9, 45);
INSERT INTO tripscheduling_trip VALUES ('WCSTX-00001', 'Witch''s Camp', 'The Stone Table', '13:45:00', '14:30:00', '93241', 'ITR', 'XXXX-000', '00018');
INSERT INTO tripscheduling_intertowntrip VALUES ('WCSTX-00001', 9, 45);

INSERT INTO tripscheduling_trip VALUES ('STDLX-00001', 'The Stone Table', 'Dancing Lawn', '06:45:00', '07:25:00', '51438', 'ITR', 'XXXX-000', '00005');
INSERT INTO tripscheduling_intertowntrip VALUES ('STDLX-00001', 4, 40);
INSERT INTO tripscheduling_trip VALUES ('DLSTX-00001', 'Dancing Lawn', 'The Stone Table', '18:20:00', '19:00:00', '81347', 'ITR', 'XXXX-000', '00005');
INSERT INTO tripscheduling_intertowntrip VALUES ('DLSTX-00001', 4, 40);

INSERT INTO tripscheduling_trip VALUES ('ANDLX-00001', 'Anvard', 'Dancing Lawn', '08:15:00', '09:20:00', '63148', 'ITR', 'XXXX-000', '00015');
INSERT INTO tripscheduling_intertowntrip VALUES ('ANDLX-00001', 6, 65);
INSERT INTO tripscheduling_trip VALUES ('DLANX-00001', 'Dancing Lawn', 'Anvard', '20:13:00', '21:18:00', '48213', 'ITR', 'XXXX-000', '00015');
INSERT INTO tripscheduling_intertowntrip VALUES ('DLANX-00001', 6, 65);