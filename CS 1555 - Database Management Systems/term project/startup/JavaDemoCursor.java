import java.sql.*;

public class JavaDemoCursor {
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

        Statement st = connection.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = st.executeQuery("SELECT * FROM STUDENT");
        int pos = resultSet.getRow();      // Get cursor position, pos = 0
        boolean b = resultSet.isBeforeFirst();    // true
        int rid;
        String rname, rmajor;
        resultSet.next();                  // Move cursor to the first row
        pos = resultSet.getRow();          // Get cursor position, pos = 1

        System.out.println(pos);
        rid = resultSet.getInt("SID");
        rname = resultSet.getString("Name");
        rmajor = resultSet.getString(3);
        System.out.println(rid + " " + rname + " " + rmajor);

        b = resultSet.isFirst();    // true
        resultSet.last();           // Move cursor to the last row
        pos = resultSet.getRow();   // If table has 10 rows, pos = 10

        System.out.println(pos);
        rid = resultSet.getInt("SID");
        rname = resultSet.getString("Name");
        rmajor = resultSet.getString(3);
        System.out.println(rid + " " + rname + " " + rmajor);

        b = resultSet.isLast();     // true
        resultSet.afterLast();      // Move cursor past last row
        pos = resultSet.getRow();   // If table has 10 rows,
        // value would be 11
        b = resultSet.isAfterLast();   // true

    }
}