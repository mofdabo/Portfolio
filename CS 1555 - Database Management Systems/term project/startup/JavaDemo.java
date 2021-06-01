import java.sql.*;

public class JavaDemo {
    private static final String username = "mod20";
    private static final String password = "123456";
    private static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";


    public static void main(String args[]) throws SQLException {

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
        String query1 =
                "SELECT SID, Name, Major FROM STUDENT";
        ResultSet res1 = st.executeQuery(query1);
        String rid;
        String rname, rmajor;
        while (res1.next()) {
            rid = res1.getString("SID");
            rname = res1.getString("Name");
            rmajor = res1.getString(3);
            System.out.println(rid + " " + rname + " " + rmajor);
        }
    }
}