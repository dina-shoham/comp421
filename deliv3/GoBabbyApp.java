import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

class simpleJDBC {
	public static Connection con = null; 
	public static Statement statement = null; 
	public static String pid = null;
	public static Boolean prompting = false;
	public static String date = null; 
	public static String appt_num = null; 
	public static String menu_choice = null;

	public static class Appt {
		public int id;
		public String name;
		public String qhid; 	

		public Appt (int id, String name, String qhid) {
			this.id = id;
			this.name = name;
			this.qhid = qhid;	
		} 	

	}	
	
	public static ArrayList<Appt> appts = new ArrayList<Appt>(); 

	public static void main ( String [ ] args ) throws SQLException {
		// JDBC setup - code largely derived from JDBC tutorial 
		// Register the driver.  You must register the driver before you can use it.
		try { 
			DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; 
		} catch (Exception cnfe) { 
			System.out.println("Class not found"); 
		}
		
		String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";
		String user = System.getenv("SOCSUSER");
		String pw = System.getenv("SOCSPASSWD"); 
		
		if(user == null && (user = System.getenv("SOCSUSER")) == null) {
			System.err.println("Error! You do not have a password to connect to the database!");
			System.exit(1);
		}
		if(pw == null && (pw = System.getenv("SOCSPASSWD")) == null) {
			System.err.println("Error! You do not have a password to connect to the database!");
			System.exit(1);
		}
		con = DriverManager.getConnection(url, user, pw);
		statement = con.createStatement( );

		// prompt practitioner id
		promptPID();
	}

	public static String promptUser(String prompt) {
		Scanner scanner = new Scanner(System.in);
		System.out.println(prompt);
		String result = scanner.nextLine(); 
		return result;
	}

	public static void promptPID() {
		// prompt practitioner id
		prompting = true; 
		while(prompting) {
			pid = promptUser("Please enter your practitioner id or press [E] to exit:");	
			// check if exiting 
			checkIfExit(pid);	

			// verify practitioner id 
			prompting = verifyPID(pid); 
		}		
		
		// prompt appointment date 
		promptDate(); 	
	}

	public static void checkIfExit(String str) {
		if (str.equals("E") || str.equals("e")) {
			System.out.println("Exiting program");
			try {
				statement.close();
				con.close();
				System.exit(1);
			} catch(SQLException e) {
				System.out.println("Error: " + e);
			}
		} else {
			return;
		}
	}

	public static boolean verifyPID(String pid) {
		try {
			String querySQL = "SELECT name FROM midwife WHERE practitioner_id = " + pid;
			java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
			if(rs.next() == false) {
				System.out.println("No midwife found.");
				promptPID();	
			}
			while (rs.next()) {
				String name = rs.getString(1);
				System.out.println ("Welcome " + name);
			}
			return false; // no longer prompting
		} catch (SQLException e) {
			System.out.println("Invalid practitioner ID, try again.");
			return true; // continue prompting		
		}
	}


	public static void promptDate() {
		prompting = true; 
		while(prompting) {
			date = promptUser("Please enter the date for the appointment list (YYYY-MM-DD) or press [E] to exit:");
			appts.clear();
			checkIfExit(date);
			prompting = verifyDate(date); 
		}
		promptAppt();
	}

	public static void promptAppt() {
		prompting = true; 

		appt_num = promptUser("Enter the appointment number that you would like to work on "
			+ "or press [E] to exit, or press [D] to go back to another date.");
		
		checkIfExit(appt_num);
			
		if (appt_num.equals("D") || appt_num.equals("d")) {
			appt_num = "";
			promptDate();
		}
			
		int appt_num_int = Integer.parseInt(appt_num);
		if (appt_num_int <= 0 || appt_num_int > appts.size()) {
			System.out.println("Invalid appointment number."); 
			promptAppt();
		}

		apptMenu(appts.get(appt_num_int - 1));
	}

	public static void apptMenu(Appt appt) {
		System.out.println("For " + appt.name + " " + appt.qhid + "\n");
		System.out.println("1. Review notes \n2. Review tests \n3. Add a note \n4. Prescribe a test \n5. Go back to the appointments.");
		menu_choice = promptUser("Enter your choice: ");  
		switch(menu_choice) {
			case ("1"):
				reviewNotes(appt);
				break;
			case ("2"): 
				reviewTests(appt);
				break;
			case ("3"): 
				addNote(appt);
				break;
			case ("4"): 
				prescribeTest(appt);
				break;
			case ("5"): 
				promptAppt();
				break;
			default: 
				System.out.println("Invalid selection.");
				apptMenu(appt);
		}
	}

	public static void reviewNotes(Appt appt) {
		try { 
			String querySQL = "SELECT VARCHAR(TRIM(VARCHAR_FORMAT(n.timestamp, 'YYYY-MM-DD HH24:MI:SS')), 30), VARCHAR(TRIM(n.observations), 50)" 
					+ " FROM Appointment a" 
					+ " JOIN Appt_Note n ON a.appt_id = n.appt_id" 
					+ " JOIN Pregnancy p ON p.preg_id = a.preg_id" 
					+ " WHERE p.preg_id = (SELECT preg_id FROM Appointment a WHERE a.appt_id = '" + appt.id + "')" 
					+ " ORDER BY n.timestamp DESC"	
					;
			java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
			while (rs.next()) {
				String timestamp = rs.getString(1);
				String observations = rs.getString(2);
				
				System.out.println (timestamp + "  " + observations);
			}
		} catch (SQLException e) {
			System.out.println("No results found.");
		}
		apptMenu(appt);
	}	
	
	public static void reviewTests(Appt appt) {
		try {
			String querySQL = "WITH appts AS (" 
					 + " SELECT *" 
					 + " FROM Appointment"
					 + " WHERE preg_id = (SELECT preg_id FROM Appointment WHERE appt_id = '" + appt.id + "')" 
					 + " )" 
					 + " SELECT t.prescription_date, t.test_type, VARCHAR(TRIM(t.test_result), 50)" 
					 + " FROM appts a JOIN medical_test t ON a.appt_id = t.appt_id" 
					 + " ORDER BY t.prescription_date DESC"
					 ;
			java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
                        while (rs.next()) {
                                String date = rs.getString(1);
                                String test_type = rs.getString(2);
				String test_results = rs.getString(3);
				if (test_results.equals(null)) {
					test_results = "PENDING";
				}

                                System.out.println (date + " [" + test_type + "] " + test_results);
                        }
                } catch (SQLException e) {
                        System.out.println("No results found.");
                }
                apptMenu(appt);
	}	

	public static void addNote(Appt appt) {
		String obs = promptUser("Please type your observation: ");
		int noteID = ThreadLocalRandom.current().nextInt(); 
	    	
		try {
			String insertSQL = "INSERT INTO Appt_Note VALUES ("+ noteID + ", CURRENT_TIMESTAMP, '" + obs + "', '" + appt.id + "')"; 
			statement.executeUpdate ( insertSQL ) ;
                } catch (SQLException e) {
                        System.out.println("Could not add observation.");
                }
                apptMenu(appt);
	}	
	
	public static void prescribeTest(Appt appt) {
		String testType = promptUser("Please enter the type of test: ");
		int testID = ThreadLocalRandom.current().nextInt(); 
		LocalDateTime testDate = LocalDateTime.now();	
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-DD");
	       	dtf.format(testDate);

		try {
			String insertSQL = "INSERT INTO Medical_Test(test_id, appt_id, test_type, prescription_date, sample_date) "
					   + " VALUES ("+ testID + ", " + appt.id + ", '" + testType + "', '" + testDate + "', '" + testDate + "')"; 
			statement.executeUpdate ( insertSQL ) ;
                } catch (SQLException e) {
                        System.out.println("Could not add observation.");
                }
                apptMenu(appt);
	}
	
	public static boolean verifyDate(String date) {
		try {
			// primary appointments:
			String querySQL = "WITH primaries (appt_id, appt_time, name, quebec_health_id) AS ( " 
				+ " 	SELECT ap.appt_id, ap.appt_time, pa.name, pa.quebec_health_id " 
				+ " 	FROM Appointment ap " 
				+ " 	JOIN Pregnancy p ON ap.preg_id = p.preg_id " 
				+ " 	JOIN Couple c ON p.couple_id = c.couple_id " 
				+ " 	JOIN Parent pa ON c.mother_id = pa.person_id " 
				+ " 	JOIN Midwife mw ON p.primary_mw_id = mw.practitioner_id "
				+ " 	WHERE mw.practitioner_id = " + pid
				+ " 	AND ap.appt_date = DATE '" + date + "'"
				+ " 	AND ap.mw_id = mw.practitioner_id"
				+ " ), secondaries (appt_id, appt_time, name, quebec_health_id) AS ( "
				+ " 	SELECT ap.appt_id, ap.appt_time, pa.name, pa.quebec_health_id "
				+ " 	FROM Appointment ap  "
				+ " 	JOIN Pregnancy p ON ap.preg_id = p.preg_id "
				+ " 	JOIN Couple c ON p.couple_id = c.couple_id "
				+ " 	JOIN Parent pa ON c.mother_id = pa.person_id " 
				+ " 	JOIN Midwife mw ON p.secondary_mw_id = mw.practitioner_id "
				+ " 	WHERE mw.practitioner_id = " + pid
				+ " 	AND ap.appt_date = DATE '" + date + "'"
				+ " 	AND ap.mw_id = mw.practitioner_id"
				+ " ) "
				+ " SELECT appt_id, appt_time, 'P' AS p_or_b, name, quebec_health_id FROM primaries "
				+ " UNION "
				+ " SELECT appt_id, appt_time, 'B' AS p_or_b, name, quebec_health_id FROM secondaries "
				+ " ORDER BY appt_time "
			;
			java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
			int i = 1;
			while (rs.next()) {
				int id = rs.getInt(1);
				String time = rs.getString(2);
				String porb = rs.getString(3);
				String name = rs.getString(4);
				String qhid = rs.getString(5); 
				
				Appt appt = new Appt(id, name, qhid);
				appts.add(appt); 
				
				System.out.println (i + ": " + time + " " + porb + " " + name + " " + qhid);
				i++;
			}
			if (i == 1) {
				System.out.println("No appointments for this date.");
				return true;
			}
			return false; // no longer prompting
		} catch (SQLException e) {
			System.out.println("Invalid date, try again.");
			return true; // continue prompting		
		}
	}

}
