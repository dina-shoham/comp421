-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
-- CREATE TABLE MYTEST01
-- (
--     id INTEGER NOT NULL
--  ,value INTEGER
--  ,PRIMARY KEY(id)
--  );

CREATE TABLE Parent 
(
	person_id INTEGER NOT NULL,
	phone_num CHAR(12),
        name CHAR(30),
	blood_type CHAR(3),
	date_of_birth DATE,
	profession CHAR(20),
	email CHAR(40),
	quebec_health_id CHAR(12),
	address CHAR(100),
	PRIMARY KEY (person_id)
); 

CREATE TABLE HC_Institution 
(
	email CHAR(40) NOT NULL,
	address CHAR(100),
	website CHAR(60),
	name CHAR(30),
	phone_num CHAR(12),
	PRIMARY KEY (email)
);

CREATE TABLE Birthing_Center
(
	email CHAR(40) NOT NULL,
	PRIMARY KEY (email),
	FOREIGN KEY (email) REFERENCES HC_Institution
);

CREATE TABLE Community_Clinic
(
	email CHAR(40) NOT NULL,
	PRIMARY KEY (email),
	FOREIGN KEY (email) REFERENCES HC_Institution
);

CREATE TABLE Midwife
(
	practitioner_id CHAR(12) NOT NULL,
	phone_num CHAR(12),
        name CHAR(30),
	email CHAR(40),
	institution_email CHAR(60),
	PRIMARY KEY (practitioner_id),
	FOREIGN KEY (institution_email) REFERENCES HC_institution
);

CREATE TABLE Couple 
(
	couple_id INTEGER NOT NULL,
	num_pregnancy INTEGER NOT NULL,
	mother_id INTEGER, 
	PRIMARY KEY (couple_id, num_pregnancy),
	FOREIGN KEY (mother_id) REFERENCES Parent	
);

CREATE TABLE Father 
(
	person_id INTEGER NOT NULL,
	couple_id INTEGER NOT NULL, 
	num_pregnancy INTEGER NOT NULL,
	PRIMARY KEY (couple_id, person_id, num_pregnancy),
	FOREIGN KEY (person_id) REFERENCES Parent, 
	FOREIGN KEY (couple_id, num_pregnancy) REFERENCES Couple
);

CREATE TABLE Pregnancy 
(
	preg_id INTEGER NOT NULL,
	birth_time_frame CHAR(6), --YYYYMM
	due_date_period DATE, 
	due_date_ultrasound DATE,
	due_date_final DATE,
	is_home_birth BOOLEAN, 
	couple_id INTEGER, 
	num_pregnancy INTEGER, 
	primary_mw_id CHAR(12), 
	secondary_mw_id CHAR(12),
	birthing_center_email CHAR(40),
	PRIMARY KEY (preg_id),
        FOREIGN KEY (couple_id, num_pregnancy) REFERENCES Couple,
	FOREIGN KEY (primary_mw_id) REFERENCES Midwife, 
	FOREIGN KEY (secondary_mw_id) REFERENCES Midwife,
	FOREIGN KEY (birthing_center_email) REFERENCES Birthing_Center
);

CREATE TABLE Baby
(
	baby_id INTEGER NOT NULL, 
	blood_type CHAR(3),
	name CHAR(30),
	birth_date DATE,
	birth_time TIME,
	sex CHAR(10), --male, female, intersex, etc.
	preg_id INTEGER,
	PRIMARY KEY (baby_id),
	FOREIGN KEY (preg_id) REFERENCES Pregnancy
);	

CREATE TABLE Lab_Tech 
(
	person_id INTEGER NOT NULL,
	phone_num CHAR(12),
	name CHAR(30),
	PRIMARY KEY (person_id)
);

CREATE TABLE Info_Session 
(
	session_id INTEGER NOT NULL, 
	session_date DATE,
	session_time TIME,
	language CHAR(20),
	host_id CHAR(12),
	PRIMARY KEY (session_id),
	FOREIGN KEY (host_id) REFERENCES Midwife
);

CREATE TABLE Invitation 
(
	couple_id INTEGER NOT NULL,
	num_pregnancy INTEGER NOT NULL,
	session_id INTEGER NOT NULL,
	PRIMARY KEY (couple_id, num_pregnancy, session_id),
	FOREIGN KEY (couple_id, num_pregnancy) REFERENCES Couple,
	FOREIGN KEY (session_id) REFERENCES Info_Session
);

CREATE TABLE Appointment
(
	appt_id INTEGER NOT NULL,
	appt_date DATE,
	appt_time TIME,
	preg_id INTEGER,
	mw_id CHAR(12),
	PRIMARY KEY (appt_id),
	FOREIGN KEY (preg_id) REFERENCES Pregnancy,
	FOREIGN KEY (mw_id) REFERENCES Midwife
);

CREATE TABLE Appt_Note
(
	note_id INTEGER NOT NULL,
	timestamp TIMESTAMP, 
	observations VARCHAR(8000), 
	appt_id INTEGER,
	PRIMARY KEY (note_id),
	FOREIGN KEY (appt_id) REFERENCES Appointment
);

CREATE TABLE Medical_Test
(
	test_id INTEGER NOT NULL,
	appt_id INTEGER NOT NULL,
	test_type CHAR(40),
	prescription_date DATE,
	sample_date DATE,
	lab_work_date DATE,
	test_result CHAR(100),
	lt_id INTEGER,
	mother_id INTEGER,
	baby_id INTEGER,
	PRIMARY KEY (test_id),
	FOREIGN KEY (appt_id) REFERENCES Appointment,
	FOREIGN KEY (lt_id) REFERENCES Lab_Tech,
	FOREIGN KEY (mother_id) REFERENCES Parent, 
	FOREIGN KEY (baby_id) REFERENCES Baby,
	CHECK (prescription_date < lab_work_date)
);


