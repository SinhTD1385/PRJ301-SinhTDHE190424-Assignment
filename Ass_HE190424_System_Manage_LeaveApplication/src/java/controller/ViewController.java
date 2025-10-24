package controller;

import dal.ViewDBContext;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Request;

@WebServlet("/view")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");
        if (idParam == null) {
            resp.sendRedirect("list");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ViewDBContext db = new ViewDBContext();
            Request request = db.getRequestById(id);

            if (request != null) {
                req.setAttribute("request", request);
                req.getRequestDispatcher("view.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Không tìm thấy đơn nghỉ phép!");
                req.getRequestDispatcher("list.jsp").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("list");
        }
    }
}
