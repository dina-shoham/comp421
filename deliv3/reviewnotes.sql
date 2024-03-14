SELECT VARCHAR(TRIM(VARCHAR_FORMAT(n.timestamp, 'YYYY-MM-DD HH24:MI:SS')), 30), VARCHAR(TRIM(n.observations), 50)  
FROM Appointment a 
JOIN Appt_Note n ON a.appt_id = n.appt_id 
JOIN Pregnancy p ON p.preg_id = a.preg_id 
WHERE p.preg_id = (SELECT preg_id FROM Appointment a WHERE a.appt_id = '87')  
ORDER BY n.timestamp DESC 
;
