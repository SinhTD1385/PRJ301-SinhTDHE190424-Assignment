package controller;

import dal.ListDBContext;
import model.Request;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            // Chưa đăng nhập -> chuyển về login.jsp
            req.setAttribute("message", "Vui lòng đăng nhập trước!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // Đã đăng nhập -> hiển thị danh sách
        ListDBContext db = new ListDBContext();
        List<Request> requests = db.getRequestsByUser(user.getId());

        req.setAttribute("requests", requests);
        req.getRequestDispatcher("list.jsp").forward(req, resp);
    }
}

