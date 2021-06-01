import java.sql.*;
import java.util.Properties;

public class JavaDemoWOInjection {
    private static boolean loggedIn;
    private static final String username = "mod20";
    private static final String password = "\m66S69m98";
    private static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";

    public static void main(String args[]) throws
            SQLException {

        Connection connection = null;
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection(url, username, password);
            connection.setAutoCommit(true);
            connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
        } catch (Exception e) {
            System.out.println(
                    "Error connecting to database. Printing stack trace: ");
            e.printStackTrace();
        }

        String username = "admin";
        String password = "1' OR '1'='1";//TODO CHANGE THIS
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user_account WHERE username=? AND password=?");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            loggedIn = true;
            System.out.println("Successfully logged in");
        } else {
            System.out.println("Username and/or password not recognized");
        }


    }
}