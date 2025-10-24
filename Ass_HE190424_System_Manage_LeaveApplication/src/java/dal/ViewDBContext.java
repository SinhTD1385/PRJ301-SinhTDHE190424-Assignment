package dal;

import java.sql.*;
import model.Request;
import model.User;

public class ViewDBContext extends DBContext {

    public ViewDBContext() {
        super(); // 🔹 gọi DBContext() để mở kết nối
    }

    public Request getRequestById(int requestId) {
        Request r = null;
        try {
            String sql = """
                SELECT r.RequestID, r.FromDate, r.ToDate, r.Reason, r.Status,
                       r.ProcessingReason, r.ProcessingDate,
                       c.UserID AS CreatedByID, c.Username AS CreatedBy,
                       p.UserID AS ProcessedByID, p.Username AS ProcessedBy
                FROM Requests r
                     INNER JOIN Users c ON r.CreatedByUserID = c.UserID
                     LEFT JOIN Users p ON r.ProcessedByUserID = p.UserID
                WHERE r.RequestID = ?
                """;

            if (connection == null || connection.isClosed()) {
                System.out.println("⚠️ Connection is NULL or closed. Reconnecting...");
                connection = getConnection(); // ✅ mở lại kết nối
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, requestId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                r = new Request();
                r.setRequestID(rs.getInt("RequestID"));
                r.setFromDate(rs.getDate("FromDate"));
                r.setToDate(rs.getDate("ToDate"));
                r.setReason(rs.getString("Reason"));
                r.setStatus(rs.getString("Status"));
                r.setProcessingReason(rs.getString("ProcessingReason"));
                r.setProcessingDate(rs.getTimestamp("ProcessingDate"));

                User createdBy = new User();
                createdBy.setUserID(rs.getInt("CreatedByID"));
                createdBy.setUsername(rs.getString("CreatedBy"));
                r.setCreatedBy(createdBy);

                if (rs.getString("ProcessedBy") != null) {
                    User processedBy = new User();
                    processedBy.setUserID(rs.getInt("ProcessedByID"));
                    processedBy.setUsername(rs.getString("ProcessedBy"));
                    r.setProcessedBy(processedBy);
                }
            }

            rs.close();
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }
}
