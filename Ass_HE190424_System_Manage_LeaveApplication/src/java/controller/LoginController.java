package controller;

import dal.LoginDBContext;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDBContext db = new LoginDBContext();
        User u = db.getUserByLogin(username, password);

        if (u != null) {
            request.setAttribute("message", "Đăng nhập thành công!");
        } else {
            request.setAttribute("message", "Sai tài khoản hoặc mật khẩu!");
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
