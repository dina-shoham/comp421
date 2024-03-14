WITH primaries (appt_time, name, quebec_health_id) AS (
	SELECT ap.appt_time, pa.name, pa.quebec_health_id 
	FROM Appointment ap 
	JOIN Pregnancy p ON ap.preg_id = p.preg_id
	JOIN Couple c ON p.couple_id = c.couple_id
	JOIN Parent pa ON c.mother_id = pa.person_id 
	JOIN Midwife mw ON p.primary_mw_id = mw.practitioner_id 
	WHERE mw.practitioner_id = 2
--	AND ap.appt_date = DATE '2022-03-23'
), secondaries (appt_time, name, quebec_health_id) AS (
	SELECT ap.appt_time, pa.name, pa.quebec_health_id 
	FROM Appointment ap 
	JOIN Pregnancy p ON ap.preg_id = p.preg_id
	JOIN Couple c ON p.couple_id = c.couple_id
	JOIN Parent pa ON c.mother_id = pa.person_id 
	JOIN Midwife mw ON p.secondary_mw_id = mw.practitioner_id 
	WHERE mw.practitioner_id = 2
--	AND ap.appt_date = DATE '2022-03-23'
)
SELECT appt_time, 'P' AS p_or_b, name, quebec_health_id FROM primaries 
UNION 
SELECT appt_time, 'B' AS p_or_b, name, quebec_health_id FROM secondaries 
ORDER BY appt_time
;
