package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    String url = "jdbc:sqlserver://MAGIIII:1433;"
            + "databaseName=Ass_System_Manage_LeaveApplication;"
            + "encrypt=true;trustServerCertificate=true;";
    String user = "magi";
    String pass = "magi";

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("Connected to SQL Server!");
        } catch (Exception e) {
            System.out.println("Failed to connect to SQL Server!");
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(url, user, pass);
        }
        return connection;
    }
}
