package dal;

import java.sql.*;
import java.util.*;
import model.Request;

public class ListDBContext extends DBContext {

    // Lấy danh sách đơn nghỉ phép theo User
    public List<Request> getRequestsByUser(int userId) {
        List<Request> list = new ArrayList<>();
        try {
            String sql = "SELECT RequestID, FromDate, ToDate, Reason, Status " +
                         "FROM Requests WHERE CreatedByUserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Request r = new Request();
                r.setRequestID(rs.getInt("RequestID"));
                r.setFromDate(rs.getDate("FromDate"));
                r.setToDate(rs.getDate("ToDate"));
                r.setReason(rs.getString("Reason"));
                r.setStatus(rs.getString("Status"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Xoá đơn
    public void deleteRequest(int id) {
        try {
            String sql = "DELETE FROM Requests WHERE RequestID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
