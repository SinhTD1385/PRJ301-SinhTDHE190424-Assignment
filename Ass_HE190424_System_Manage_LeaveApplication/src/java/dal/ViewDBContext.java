package dal;

import java.sql.*;
import model.Request;

public class ViewDBContext extends DBContext {

    public Request getRequestById(int id) {
        Request r = null;
        try {
            String sql = """
                SELECT r.RequestID, r.FromDate, r.ToDate, r.Reason, r.Status,
                       r.ProcessingReason, r.ProcessingDate,
                       e.FullName, e.Email, e.Phone, d.Name AS DivisionName
                FROM Requests r
                JOIN Users u ON r.CreatedByUserID = u.UserID
                JOIN Employees e ON u.EmployeeID = e.EmployeeID
                JOIN Divisions d ON e.DivisionID = d.DivisionID
                WHERE r.RequestID = ?
            """;

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Request();
                r.setRequestID(rs.getInt("RequestID"));
                r.setFromDate(rs.getDate("FromDate"));
                r.setToDate(rs.getDate("ToDate"));
                r.setReason(rs.getString("Reason"));
                r.setStatus(rs.getString("Status"));
                r.setProcessingReason(rs.getString("ProcessingReason"));
                r.setEmployeeName(rs.getString("FullName"));
                r.setEmail(rs.getString("Email"));
                r.setPhone(rs.getString("Phone"));
                r.setDivisionName(rs.getString("DivisionName"));
                r.setProcessingDate(rs.getTimestamp("ProcessingDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
}
