<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<html>
<head><title>Danh sách</title></head>
<body>
    <h2>Xin chào, <%= user.getFullName() %>!</h2>
    <p>Bạn đã đăng nhập thành công.</p>
    <a href="logout">Đăng xuất</a>
</body>
</html>
