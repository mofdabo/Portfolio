import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JavaDemoTransaction {

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

        Statement st = connection.createStatement();
        try {
            connection.setAutoCommit(false);
            st.executeUpdate("INSERT INTO student (sid, name, major, qpa) VALUES ('145', 'Marios', 'CS', 3)");
            st.executeUpdate("INSERT INTO student (sid, name, major, qpa) VALUES ('156', 'Andreas', 'CS', 3)");
            connection.commit();
        } catch (SQLException e1) {
            try {
                connection.rollback();
            } catch (SQLException e2) {
                System.out.println(e2.toString());
            }
        }


    }
}