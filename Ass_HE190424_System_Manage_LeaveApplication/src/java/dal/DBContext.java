/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Admin
 */
public class DBContext {
    private final String url = "jdbc:sqlserver://MAGIIIIt:1433;"
            + "databaseName=Ass_HE190424_System_Manage_LeaveApplication;"
            + "encrypt=true;trustServerCertificate=true;";
    
    private final String user = "magi";
    private final String pass = "magi";
    
    public Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, user, pass);
    }
}
