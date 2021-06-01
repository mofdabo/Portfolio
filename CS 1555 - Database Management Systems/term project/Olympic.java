// Mouhammadou Dabo (mod20)

import java.util.*;
//import java.util.Date;
import java.io.*;
import java.text.*;
import java.sql.*;

public class Olympic
{
	private static final String username = "mod20";
	private static final String password = "123456";
    private static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";

    private static String start_option;

    private static boolean run;
    private static boolean login;

    private static Connection connect;
    private static ResultSet rs;
    private static Statement st;

    private static BufferedReader br;
    //private static DateFormat df;

    private static int user_id;
    private static int role_id;


    public static void main(String args[]) throws SQLException, IOException
    {
    	br = new BufferedReader(new InputStreamReader(System.in));
    	//df = new SimpleDateFormat("dd-MMM-yyyy");

    	start_app();

    	while(run)
    	{
    		login_to_system();
    		user_program();
    	}

    	br.close();
    }

    // set up a connection to the database
    private static void start_app() throws IOException
    {
    	run = true;
    	login = false;
		connect = null;
        
        try 
        {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            connect = DriverManager.getConnection(url, username, password);
            connect.setAutoCommit(true);
            connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
        } 
        catch (Exception e) 
        {
            System.out.println("Error connecting to database. Printing stack trace: ");
            e.printStackTrace();
        }
    }

    // start up screen; allows user to login, create an account, or exit the program
    private static void login_to_system() throws SQLException, IOException
    {
    	System.out.println("Welcome to Mo's Olympic Games Database");
    	System.out.println("");

 		boolean start_screen = true;
 		while(start_screen)
 		{
 			System.out.println("Would you like to: ");
 			System.out.println("	1. Login");
 			System.out.println("	2. Exit");
			System.out.println("");
 			
 			String option = br.readLine();
 			System.out.println("");

 			if(option.equals("1") || option.equals("2"))
 			{
 				start_option = option;
 				start_screen = false;
 			}
 			else
 			{
 				System.out.println("Please enter a valid option.");
 				System.out.println("");
 			}
 		}

 		// allows the user to login to the database
 		if(start_option.equals("1"))
 		{
 			boolean try_login = true;
 			while(try_login)
 			{
 				System.out.print("Please enter your username: ");
 				String u_name = br.readLine();
 				System.out.print("Please enter your password: ");
 				String p_word = br.readLine();
 				System.out.println("");

 				boolean user_exists = login(u_name, p_word);

 				// if the user is found in the database
 				if(user_exists)
 				{
 					System.out.println("You have been succesfully logged in.");
 					System.out.println("");
 					login = true;
 					try_login = false;
 				}
 				else
 				{
 					System.out.println("Account not found.");
 					System.out.println("Would you like to: ");
 					System.out.println("	1. Try to login again");
 					System.out.println("	2. Exit");
 					System.out.println("");
 					
 					String option = br.readLine();
 					System.out.println("");

 					if(option.equals("1"))
 					{
 						login = false;
 						try_login = true;
 					}
 					else
 					{
 						try_login = false;
 						System.out.println("Exiting the program.");
 						exit();
 					}
 				}
 			}
 		}
 		// Exit the program
 		else
 		{
 			System.out.println("Exiting the program.");
 			exit();
 		}
    } 

    private static void user_program() throws IOException
    {
    	while(login)
    	{
    		main_menu();
    	}
    }

    private static void main_menu() throws IOException
    {
    	// if the user is an organizer
    	if(role_id == 1)
    	{
    		System.out.println("ORGANIZER MENU:");
    		System.out.println("	1. Organizer Options");
    		System.out.println("	2. Default Options");
    		System.out.println("	3. Log out");
    		System.out.println("");

    		String option = br.readLine();
    		System.out.println("");

    		if(option.equals("1"))
    		{
    			organizer_options();
    		}
    		else if(option.equals("2"))
    		{
    			default_options();
    		}
			else if(option.equals("3"))
    		{
    			logout();
    		}
    		else
    		{
    			System.out.println("Please enter a valid option.");
    			System.out.println("");
    		}
    	}	
    	// if the user is a coach
    	else if(role_id == 2)
    	{
    		System.out.println("COACH MENU:");
    		System.out.println("	1. Coach Options");
    		System.out.println("	2. Default Options");
    		System.out.println("	3. Log out");
    		System.out.println("");

    		String option = br.readLine();
    		System.out.println("");

    		if(option.equals("1"))
    		{
    			coach_options();
    		}
    		else if(option.equals("2"))
    		{
    			default_options();
    		}
			else if(option.equals("3"))
    		{
    			logout();
    			System.out.println("Logging off.");;
    		}
    		else
    		{
    			System.out.println("Please enter a valid option.");
    			System.out.println("");
    		}
    	}
    	// if the user is a guest
    	else
    	{
    		System.out.println("GUEST MENU:");
    		System.out.println("	1. Default Options");
    		System.out.println("	2. Log out");

    		System.out.println("");

    		String option = br.readLine();
    		System.out.println("");

    		if(option.equals("1"))
    		{
    			default_options();
    		}
			else if(option.equals("2"))
    		{
    			logout();
    		}
    		else
    		{
    			System.out.println("Please enter a valid option.");
    			System.out.println("");
    		}
    	}
    }

    // options for organizers
    private static void organizer_options() throws IOException
    {
		System.out.println("ORGANIZER OPTIONS:");
		System.out.println("	1. Create User");
		System.out.println("	2. Drop User");
		System.out.println("	3. Create Event");
		System.out.println("	4. Add Event Outcome");
		System.out.println("	5. Return to Organizer Menu");
		System.out.println("	6. Log out");
		System.out.println("");

		String option = br.readLine();

		if(option.equals("1"))
		{
			create_user();
		}
		else if(option.equals("2"))
		{
			drop_user();
		}
		else if(option.equals("3"))
		{
			create_event();
		}
		else if(option.equals("4"))
		{
			add_event_outcome();
		}
		else if(option.equals("5"))
		{
			System.out.println("Returning back to the Organizer Menu.");
			System.out.println("");
		}
		else if(option.equals("6"))
		{
    		logout();
		}
		else
    	{
    		System.out.println("Please enter a valid option.");
   			System.out.println("");
   		}
	}

	// options for coaches
    private static void coach_options() throws IOException
    {
    	System.out.println("COACH OPTIONS:");
		System.out.println("	1. Create Team");
		System.out.println("	2. Register Team");
		System.out.println("	3. Add Participant");
		System.out.println("	4. Add Team Member");
		System.out.println("	5. Drop Team Member");
		System.out.println("	6. Return to Coach Menu");
		System.out.println("	7. Log out");
		System.out.println("");

		String option = br.readLine();

		if(option.equals("1"))
		{
			create_team();
		}
		else if(option.equals("2"))
		{
			register_team();
		}
		else if(option.equals("3"))
		{
			add_participant();
		}
		else if(option.equals("4"))
		{
			add_team_member();
		}
		else if(option.equals("5"))
		{
			drop_team_member();
		}
		else if(option.equals("6"))
		{
			System.out.println("Returning back to the Coach Menu.");
			System.out.println("");
		}
		else if(option.equals("6"))
		{
    		logout();
		}
		else
    	{
    		System.out.println("Please enter a valid option.");
   			System.out.println("");
   		}
    }

    // options for all users
    private static void default_options() throws IOException
    {
    	System.out.println("DEFAULT OPTIONS:");
		System.out.println("	1. Display Sport");
		System.out.println("	2. Display Event");
		System.out.println("	3. Country Ranking");
		System.out.println("	4. Top Athletes");
		System.out.println("	5. Connected Athletes");
		System.out.println("	6. Log out");
		System.out.println("");

		String option = br.readLine();

		if(option.equals("1"))
		{
			display_sport();
		}
		else if(option.equals("2"))
		{
			display_event();
		}
		else if(option.equals("3"))
		{
			country_ranking();
		}
		else if(option.equals("4"))
		{
			top_athletes();
		}
		else if(option.equals("5"))
		{
			connected_athletes();
		}
		else if(option.equals("6"))
		{
			logout();
		}
		else
    	{
    		System.out.println("Please enter a valid option.");
   			System.out.println("");
   		}
    }

    // Organizer Methods
    // Given a username, passkey, role id, add a new user to the system.
    private static void create_user() throws IOException
    {
		System.out.println("CREATE USER:");
		
		System.out.print("	Please enter a username: ");
		String user_name = br.readLine();
		System.out.print("	Please enter a password: ");
		String pass_word = br.readLine();
		System.out.print("	Please enter user's role id: ");
		int role = Integer.parseInt(br.readLine());
		System.out.println("");

		//String date = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
		if(user_name != null && pass_word != null)
		{
			try
			{
				st = connect.createStatement();
				//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
				connect.setAutoCommit(false);
				st.executeUpdate("INSERT INTO user_account (user_id, username, passkey, role_id, last_login) values (user_account_seq.nextval, '" + user_name + "', '" + pass_word + "'," + role + ", systimestamp)");
				connect.commit();

				System.out.println("User has been successfully created!");
				System.out.println("");
			}
			catch (SQLException e1)
			{
				System.out.println("Error creating user! Preparing to rollback.");
				try
				{
					connect.rollback();
					e1.printStackTrace();
				}
				catch (SQLException e2)
				{
					System.out.println("Error rolling back database. Printing stack trace: ");
					e2.printStackTrace();
				}
			}
			//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
		}
    }

    // This function should remove the user from the system.
    private static void drop_user() throws IOException
    {
    	System.out.println("DELETE USER:");

		System.out.print("	Please enter the user's id number: ");    	
		int user =Integer.parseInt(br.readLine());
		System.out.println("");

    	if(user_id != user && user > 0)
    	{
			try
			{
				st = connect.createStatement();
				//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
				
				connect.setAutoCommit(false);

				st.executeQuery("DELETE FROM user_account where user_id = " + user);
				connect.commit();
				/*
				int max_id;
				rs = st.executeQuery("SELECT max (user_id) FROM user_account");
    			rs.next();
    			max_id = rs.getInt(1);

    			st.executeQuery("ALTER SEQUENCE user_account_seq RESTART WITH " + max_id);
				connect.commit();
				*/

				System.out.println("User has been successfully removed!");
				System.out.println("");
			}
			catch (SQLException e1)
			{
				System.out.println("Error deleting user! Preparing to rollback.");
				try
				{
					connect.rollback();
					e1.printStackTrace();
				}
				catch (SQLException e2)
				{
					System.out.println("Error rolling back database. Printing stack trace: ");
					e2.printStackTrace();
				}
			}

			//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
		}
		else
		{
			System.out.println("Please enter a valid user id!");
		}
    }

    // Given a sport ID and a venue ID, add a new event to the system, where it has to specify whether
	// it is a men's or women's event along with its expected events occupancy.
    private static void create_event() throws IOException
    {
    	System.out.println("CREATE AN EVENT:");

    	System.out.print("	Please enter the sport id: ");
    	int sport_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the venue id: ");
    	int venue_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the date of the event (dd-MMM-yyyy): ");
    	String date = br.readLine();
    	System.out.print("	Please enter the gender for the sport (m/w): ");
    	String gender = br.readLine();
    	System.out.println("");

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
			connect.setAutoCommit(false);
			st.executeQuery("INSERT INTO event (event_id, sport_id, venue_id, gender, event_time) values (event_seq.nextval," + sport_id + "," + venue_id + ",'" + gender + "','" + date + "')");
			connect.commit();

			System.out.println("Event has been successfully added!");
		}
		catch (SQLException e1)
		{
			System.out.println("Error creating event! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
	}

    // Given an Olympic game, event, participant and position, add the outcome of the result to the scoreboard.
    private static void add_event_outcome() throws IOException
    {
    	System.out.println("ADD EVENT OUTCOME:");

    	System.out.print("	Please enter the Olympic id: ");
    	int olympic_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the team id: ");
    	int team_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the event id: ");
    	int event_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the participant's id: ");
    	int participant_id = Integer.parseInt(br.readLine());
    	System.out.print("	Please enter the position placed: ");
    	int position = Integer.parseInt(br.readLine());
    	System.out.println("");

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
			
			connect.setAutoCommit(false);
			st.executeQuery("INSERT INTO scoreboard (olympic_id, event_id, team_id, participant_id, position) values (" + olympic_id + "," + event_id + "," + team_id + "," + participant_id + "," + position);
			connect.commit();

			System.out.println("Event outcome has been successfully added to the scoreboard!");
			System.out.println("");
		}
		catch (SQLException e1)
		{
			System.out.println("Error adding event outcome! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }


    // Coach Methods
    private static void create_team() throws IOException
    {
    	System.out.println("CREATE TEAM");

    	System.out.print("Please enter the city of the Olympic Game: ");
    	String city = br.readLine();
    	System.out.print("Please enter the year of the Olympic Game: ");
    	String year = br.readLine();
    	System.out.print("Please enter the sport you are participating in: ");
    	String sport = br.readLine();
    	System.out.print("Please enter your team's country: ");
    	String country = br.readLine();
    	System.out.print("Please enter the name of your team: ");
    	String team_name = br.readLine();
    	System.out.println("");

		try
		{
			st = connect.createStatement(); 
    		//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
			
			int olympic_id;
			int country_id;
			int sport_id;
			
			rs = st.executeQuery("SELECT olympic_id from olympics where host_city = '" + city + "'");
    		rs.next();
    		olympic_id = rs.getInt("olympic_id");
    		

    		rs = st.executeQuery("SELECT country_id from country where country = '" + country + "'");
    		rs.next();
    		country_id = rs.getInt("country_id");
    		
    		rs = st.executeQuery("SELECT sport_id from sport where sport_name = '" + sport + "'");
    		rs.next();
    		sport_id = rs.getInt("sport_id");
    		
    		connect.setAutoCommit(false);
    		st.executeQuery("INSERT INTO team (team_id, olympic_id, team_name. country_id, sport_id, coach_id) values (team_seq.nextval, " + olympic_id + ",'" + team_name+  "'," + country_id + "," + sport_id + "," + user_id + ")");
    		connect.commit();

    		System.out.println("Team has been successfully created!");
    		System.out.println("");
		}

		catch (SQLException e1)
		{
			System.out.println("Error creating team! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    	
    }

    private static void register_team() throws IOException
    {
    	System.out.println("REGISTER TEAM");

    	System.out.print("Please enter your team id: ");
    	int team = Integer.parseInt(br.readLine());
    	System.out.print("Please enter the event id: ");
    	int event = Integer.parseInt(br.readLine());
    	System.out.println("");

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
			
			connect.setAutoCommit(false);
			st.executeQuery("INSERT INTO event_participation (event_id, team_id) values (" + event + "," + team + ", 'e')");
			connect.commit();

			System.out.println("Team has been successfully registered!");
		}
		catch (SQLException e1)
		{
			System.out.println("Error registering team! Preparing to rollback.");
			try
			{
				connect.rollback();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }

    private static void add_participant() throws IOException
    {
    	System.out.println("ADD PARTICIPANT");

    	System.out.print("Please enter the participant's first name: ");
    	String first_name = br.readLine();
    	System.out.print("Please enter the participant's last name: ");
    	String last_name = br.readLine();
    	System.out.print("Please enter the participant's nationality: ");
    	String nationality = br.readLine();
    	System.out.print("Please enter the participant's birth place: ");
    	String birth_place = br.readLine();
    	System.out.println("");

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);

			int num_rows;
			
			rs = st.executeQuery("SELECT count(*) from participant");
    		
    		rs.next(); 
   			num_rows = rs.getInt(1);

    		num_rows++;

			connect.setAutoCommit(false);
			st.executeQuery("INSERT INTO participant (participant_id, fname, lname, nationality, birth_place) values (" + num_rows + ", '" + first_name + "', '" + last_name + "', '" + nationality + "', '" + birth_place + ")");
			connect.commit();

			System.out.println("Participant has been successfully added!");
			System.out.println("");
		}
		catch (SQLException e1)
		{
			System.out.println("Error registering team! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }

    private static void add_team_member() throws IOException
    {
    	
    	System.out.println("ADD TEAM MEMBER");

    	System.out.print("Please enter your team id: ");
    	int team = Integer.parseInt(br.readLine());
    	System.out.print("Please enter the participant's id: ");
    	int participant = Integer.parseInt(br.readLine());
    	System.out.println("");

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
			
			connect.setAutoCommit(false);
			st.executeQuery("INSERT INTO team_member (team_id, participant_id) values (" + team + "," + participant + ")");
			connect.commit();

			System.out.println("Team member has been successfully added!");
			System.out.println("");
		}
		catch (SQLException e1)
		{
			System.out.println("Error registering team! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }

    private static void drop_team_member() throws IOException
    {
    	System.out.println("DROP TEAM MEMBER");

    	System.out.print("Please enter the participant's id: ");
    	int participant = Integer.parseInt(br.readLine());

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);

			connect.setAutoCommit(false);
			st.executeQuery("DELETE FROM participant WHERE participant_id = " + participant + ")");
			connect.commit();

			System.out.println("Team has been successfully registered!");
			System.out.println("");
		}
		catch (SQLException e1)
		{
			System.out.println("Error registering team! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }

    // Other Methods
    // Login to the system
    private static boolean login(String u_name, String p_word) throws SQLException, IOException
    {
    	boolean user_exists = false;
    	
    	st = connect.createStatement();
 
 		try
		{			
			rs = st.executeQuery("SELECT user_id, username, passkey, role_id FROM user_account");

			while(rs.next())
			{
				int temp_userid = rs.getInt("user_id");
				String temp_username = rs.getString("username");
				String temp_password = rs.getString("passkey");
				int temp_roleid = rs.getInt("role_id");

				if(u_name.equals(temp_username) && p_word.equals(temp_password))
				{
					user_id = temp_userid;
					role_id = temp_roleid;
					user_exists = true;
				}
			}
		} 
		catch (SQLException e1)
		{
			System.out.println("Error getting data from database. Printing stack trace: ");
			e1.printStackTrace();
		}

		return user_exists;
    }

    // Given a sport name, it displays the Olympic year it was added, events of that sport, gender, the
	// medals winners and their countries.
    private static void display_sport()
    {
    	System.out.println("DISPLAY SPORT");

    	//System.out.print("	Please enter the name of the sport: ");
    	//String sport = sc.nextLine();

    	//st = connect.createStatement();
   		//rs = st.executeQuery("SELECT s.dob, (sport_name || ' ' || sb.event_id) AS events, e.gender, (p.fname || ' ' || p.lname) AS name, country_code, medal_title FROM (((((sport s JOIN event e ON s.sport_id = e.sport_id) JOIN SCOREBOARD sb on e.event_id = sb.event_id) JOIN participant p ON sb.participant_id = p.participant_id) JOIN medal m ON sb.medal_id = m.medal_id) JOIN country c ON p.nationality = c.country) WHERE sport_name = '" + sport + "' order by position asc, events asc");
    }

    private static void display_event()
    {
    	System.out.println("DISPLAY EVENT");
    	System.out.println("");
    }

    private static void country_ranking()
    {
    	System.out.println("COUNTRY RANKING");
    	System.out.println("");
    }

    private static void top_athletes()
    {
    	System.out.println("TOP ATHLETES");
    	System.out.println("");
    }

    private static void connected_athletes()
    {
    	System.out.println("CONNECTED ATHLETES");
    	System.out.println("");
    }

    // update's the last login date and time
    private static void logout()
    {
    	last_login();
    	login = false;
    	System.out.println("Logging off.");
    	System.out.println("");
    }

    // exits the program
    private static void exit()
    {
    	login = false;
    	run = false;
    	System.out.println("Thank you for using Mo's Olympic Games Database!");
    }

    // helper functions
    private static void last_login()
    {
    	//Date date_obj = new Date();
    	//String date = df.format(date_obj);

		try
		{
			st = connect.createStatement();
			//connect.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITED);
		
			connect.setAutoCommit(false);
			st.executeQuery("UPDATE user_account SET last_login = systimestamp WHERE user_id = " + user_id);
			connect.commit();
		}
		catch (SQLException e1)
		{
			System.out.println("Error updating last login! Preparing to rollback.");
			try
			{
				connect.rollback();
				e1.printStackTrace();
			}
			catch (SQLException e2)
			{
				System.out.println("Error rolling back database. Printing stack trace: ");
				e2.printStackTrace();
			}
		}

		//connect.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
    }

 }
