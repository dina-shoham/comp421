-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
--INSERT INTO MYTEST01 (id, value) VALUES(4, 1300);
-- A more complex syntax that saves you typing effort.
--INSERT INTO MYTEST01 (id, value) VALUES
-- (7, 5144)
--,(3, 73423)
--,(6, -1222)
--;

--PARENT 
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (1,'111-111-1111','Alison Dilaurentis','A','1995-01-01','Teacher','alison@dilaurentis.com','ABC123456789','111 First St');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (2,'111-111-1112','Hanna Marin','A+','1995-01-02','Fashion Designer','hm@gmail.com','ABC000000000','222 Second Ave');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (3,'111-111-1113','Aria Montgomery','B','1995-01-03','Author','aria@yahoo.ca','AAA123456789','3 Fourth St');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (4,'111-111-1114','Victoria Gutierrez','B+','1995-01-04','Politician','spencer.hastings@mail.mcgill.ca','ZYX987654321','45 65th Ave');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (5,'111-111-1115','Emily Fields','AB','1995-01-05','Swim Coach','e.fields@gmail.com','ABC111111111','99 A Street');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (6,'111-111-1116','Jenna Marshall','AB+','1995-01-06','Unemployed','jenna.marshall@yahoo.com','DEF000000000','100 B Street');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (7,'111-111-1117','Caleb Rivers','O','1995-01-07','Web developer','caleb@rivers.com',NULL,'222 Second Ave');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (8,'111-111-1118','Toby Cavanaugh','O+','1995-01-08','Contractor','tc100@gmail.com',NULL,'ABC 88 St');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (9,'111-111-1119','Ezra Fitz','O-','1995-01-09','Menace to society','ef1990@fitzgerald.com',NULL,'3 Fourth St');
INSERT INTO Parent(person_id,phone_num,name,blood_type,date_of_birth,profession,email,quebec_health_id,address) VALUES (10,'111-111-1120','Mike Montgomery','A-','1995-01-10','Nail Tech','mikey123@gmail.com',NULL,'8 95 Street');

--HC_INSTITUTION
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('health@lacsaintlouis.com','123 Lac St','lacsaintlouis.com','Lac-Saint-Louis','514-111-1111');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('rosewoodhealth@gmail.com','11 Rosewood Ave','rosewoodhealth.ca','Rosewood','514-222-2222');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('101@health.ca','25 6th St','health101.ca','Health 101','514-333-3333');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('baby@center.com','888 88th Ave','baby-center.ca','Baby Center','514-444-4444');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('plateau-MR@yahoo.ca','3000 Boul Saint Laurent','plateau-mr.org','Plateau Mont Royal','514-555-5555');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('clinic@gmail.com','A B Street','clinic1.com','Clinic','514-666-6666');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('clinic2@gmail.com','C D Street','clinic2.com','Clinic Two','514-777-7777');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('clinic3@yahoo.ca','101 University Ave','clinic3.com','Clinic Three','514-888-8888');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('birthing-center@gmail.com','99 99th Street','birthingcenter.com','Birthing Center Inc','514-999-9999');
INSERT INTO HC_Institution(email,address,website,name,phone_num) VALUES ('center.of.birth@gmail.com','123 Birth St','center-of-birth.com','Center of Birth','123-456-7890');

--BIRTHING_CENTER
INSERT INTO Birthing_Center(email) VALUES ('health@lacsaintlouis.com');
INSERT INTO Birthing_Center(email) VALUES ('rosewoodhealth@gmail.com');
INSERT INTO Birthing_Center(email) VALUES ('101@health.ca');
INSERT INTO Birthing_Center(email) VALUES ('birthing-center@gmail.com');
INSERT INTO Birthing_Center(email) VALUES ('center.of.birth@gmail.com');

--COMMUNITY_CLINIC
INSERT INTO Community_Clinic(email) VALUES ('baby@center.com');
INSERT INTO Community_Clinic(email) VALUES ('plateau-MR@yahoo.ca');
INSERT INTO Community_Clinic(email) VALUES ('clinic@gmail.com');
INSERT INTO Community_Clinic(email) VALUES ('clinic2@gmail.com');
INSERT INTO Community_Clinic(email) VALUES ('clinic3@yahoo.ca');

--MIDWIFE
INSERT INTO Midwife(practitioner_id,phone_num,name,email,institution_email) VALUES (2,'514-765-7654','Marion Girard','marion.girard@gmail.com','health@lacsaintlouis.com');
INSERT INTO Midwife(practitioner_id,phone_num,name,email,institution_email) VALUES (1,'403-111-1111','Jane Doe','jane.doe@gmail.com','plateau-MR@yahoo.ca');
INSERT INTO Midwife(practitioner_id,phone_num,name,email,institution_email) VALUES (3,'403-222-2222','John Doe','jdoe@gmail.com','baby@center.com');
INSERT INTO Midwife(practitioner_id,phone_num,name,email,institution_email) VALUES (4,'403-234-5678','Jonathan Doe','jonathan1999@gmail.com','rosewoodhealth@gmail.com');
INSERT INTO Midwife(practitioner_id,phone_num,name,email,institution_email) VALUES (5,'999-918-9188','Jamie Doe','doe.jamie@gmail.com','101@health.ca');

--COUPLE
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (1,1,1);
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (2,2,1);
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (3,1,2);
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (4,1,3);
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (5,1,4);
INSERT INTO Couple(couple_id,num_pregnancy,mother_id) VALUES (5,2,4);

--FATHER
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (7,1,1);
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (8,2,2);
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (8,3,1);
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (9,4,1);
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (10,5,1);
INSERT INTO Father(person_id,couple_id,num_pregnancy) VALUES (10,5,2);

--PREGNANCY
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (1,202207,'2022-07-10','2022-07-11',NULL,'TRUE',1,1,1,2,'health@lacsaintlouis.com');
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (2,202207,'2022-07-11','2022-07-12','2022-07-13','FALSE',2,2,1,3,NULL);
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (3,202107,'2021-07-12','2021-07-13','2021-07-14','FALSE',3,1,2,4,NULL);
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (4,202208,'2022-08-04','2022-08-05','2022-08-07','FALSE',4,1,3,5,NULL);
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (5,202110,'2021-10-03','2021-10-02','2021-10-01','TRUE',5,1,4,NULL,'rosewoodhealth@gmail.com');
INSERT INTO Pregnancy(preg_id,birth_time_frame,due_date_period,due_date_ultrasound,due_date_final,is_home_birth,couple_id,num_pregnancy,primary_mw_id,secondary_mw_id,birthing_center_email) VALUES (6,202208,'2022-08-01','2022-08-02','2022-08-01','FALSE',5,2,5,NULL,NULL);

--BABY
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (1,'A','John Smith',NULL,NULL,NULL,1);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (2,NULL,NULL,NULL,NULL,NULL,2);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (3,'AB','Mona Van Der Waal','2021-07-14','12:01','female',3);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (4,NULL,NULL,NULL,NULL,NULL,4);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (5,'O-','Cece Drake','2021-10-01','13:02','male',5);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (6,NULL,'Jane Doe',NULL,NULL,'female',6);
INSERT INTO Baby(baby_id,blood_type,name,birth_date,birth_time,sex,preg_id) VALUES (7,NULL,'John Doe',NULL,NULL,'male',6);

--LAB_TECH
INSERT INTO Lab_Tech(person_id,phone_num,name) VALUES (1,'111-222-3333','Max Rice');
INSERT INTO Lab_Tech(person_id,phone_num,name) VALUES (2,'111-222-3334','Sam Morris');
INSERT INTO Lab_Tech(person_id,phone_num,name) VALUES (3,'111-222-3335','Max Martin');
INSERT INTO Lab_Tech(person_id,phone_num,name) VALUES (4,'111-222-3336','Ben RD');
INSERT INTO Lab_Tech(person_id,phone_num,name) VALUES (5,'111-222-3337','Megan Kern');

--INFO_SESSION
INSERT INTO Info_Session(session_id,session_date,session_time,language,host_id) VALUES (111,'2021-01-01','12:00','english',1);
INSERT INTO Info_Session(session_id,session_date,session_time,language,host_id) VALUES (112,'2021-05-01','13:00','french',1);
INSERT INTO Info_Session(session_id,session_date,session_time,language,host_id) VALUES (113,'2021-01-01','14:00','english',2);
INSERT INTO Info_Session(session_id,session_date,session_time,language,host_id) VALUES (114,'2021-02-01','15:00','french',2);
INSERT INTO Info_Session(session_id,session_date,session_time,language,host_id) VALUES (115,'2021-03-01','16:00','english',3);

--INVITATION
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (1,1,111);
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (2,2,112);
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (3,1,113);
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (4,1,114);
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (5,1,115);
INSERT INTO Invitation(couple_id,num_pregnancy,session_id) VALUES (5,2,111);

--APPOINTMENT
INSERT INTO Appointment(appt_id,appt_date,appt_time,preg_id,mw_id) VALUES (87,'2022-05-01','10:00',1,1);
INSERT INTO Appointment(appt_id,appt_date,appt_time,preg_id,mw_id) VALUES (88,'2022-03-21','11:00',1,2);
INSERT INTO Appointment(appt_id,appt_date,appt_time,preg_id,mw_id) VALUES (89,'2022-03-23','12:00',6,2);
INSERT INTO Appointment(appt_id,appt_date,appt_time,preg_id,mw_id) VALUES (90,'2022-06-03','13:00',6,2);
INSERT INTO Appointment(appt_id,appt_date,appt_time,preg_id,mw_id) VALUES (91,'2022-06-04','14:00',4,3);

--APPT_NOTE
INSERT INTO Appt_Note(note_id,timestamp,observations,appt_id) VALUES (200,'2022-05-01-10:01:01','everything good',87);
INSERT INTO Appt_Note(note_id,timestamp,observations,appt_id) VALUES (201,'2022-05-01-10:10:10','test observation',87);
INSERT INTO Appt_Note(note_id,timestamp,observations,appt_id) VALUES (202,'2022-06-03-13:05:00','test 123',90);
INSERT INTO Appt_Note(note_id,timestamp,observations,appt_id) VALUES (203,'2022-06-04-14:03:00','text text text',91);
INSERT INTO Appt_Note(note_id,timestamp,observations,appt_id) VALUES (204,'2022-06-04-14:09:01','another observation',91);

--MEDICAL_TEST
INSERT INTO Medical_Test(test_id,appt_id,test_type,prescription_date,sample_date,lab_work_date,test_result,lt_id,mother_id,baby_id) VALUES (154,89,'blood iron','2022-06-02','2022-06-02','2022-06-03','below average',1,4,NULL);
INSERT INTO Medical_Test(test_id,appt_id,test_type,prescription_date,sample_date,lab_work_date,test_result,lt_id,mother_id,baby_id) VALUES (155,89,'ultrasound','2022-06-02','2022-06-03','2022-06-04','everything normal',1,4,NULL);
INSERT INTO Medical_Test(test_id,appt_id,test_type,prescription_date,sample_date,lab_work_date,test_result,lt_id,mother_id,baby_id) VALUES (156,90,'blood iron','2022-06-03','2022-06-04','2022-06-05','average',1,4,NULL);
INSERT INTO Medical_Test(test_id,appt_id,test_type,prescription_date,sample_date,lab_work_date,test_result,lt_id,mother_id,baby_id) VALUES (157,90,'xray','2022-06-03','2022-06-04','2022-06-05','everything good',1,NULL,6);
INSERT INTO Medical_Test(test_id,appt_id,test_type,prescription_date,sample_date,lab_work_date,test_result,lt_id,mother_id,baby_id) VALUES (158,87,'blood iron','2022-05-01','2022-05-02','2022-05-03','slightly high',1,NULL,1);

