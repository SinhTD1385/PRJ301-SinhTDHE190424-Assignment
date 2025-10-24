package controller;

import dal.ViewDBContext;
import model.Request;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/view")
public class ViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id_raw = req.getParameter("id");
        if (id_raw == null) {
            resp.sendRedirect("list");
            return;
        }

        int id = Integer.parseInt(id_raw);
        ViewDBContext db = new ViewDBContext();
        Request request = db.getRequestById(id);

        if (request == null) {
            req.setAttribute("message", "Không tìm thấy đơn nghỉ phép!");
        }

        req.setAttribute("requestDetail", request);
        req.getRequestDispatcher("view.jsp").forward(req, resp);
    }
}
