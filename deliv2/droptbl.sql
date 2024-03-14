-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
--DROP TABLE MYTEST01;
DROP TABLE Parent; 
DROP TABLE Midwife;
DROP TABLE Lab_Tech;
DROP TABLE Couple;
DROP TABLE Father;
DROP TABLE Info_Session;
DROP TABLE Invitation;
DROP TABLE Pregnancy;
DROP TABLE Baby;
DROP TABLE Appointment;
DROP TABLE Appt_Note;
DROP TABLE Medical_Test;
DROP TABLE HC_Institution;
DROP TABLE Birthing_Center;
DROP TABLE Community_Clinic;
