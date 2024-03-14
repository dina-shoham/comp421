WITH appts AS (
	SELECT * 
	FROM Appointment
	WHERE preg_id = (SELECT preg_id FROM Appointment WHERE appt_id = '87') 
) 
SELECT t.prescription_date, t.test_type, VARCHAR(TRIM(t.test_result), 50) 
FROM appts a JOIN medical_test t ON a.appt_id = t.appt_id 
ORDER BY t.prescription_date DESC 
;

