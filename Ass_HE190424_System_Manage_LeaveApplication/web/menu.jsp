<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<html>
<head>
    <title>Hệ thống quản lý nghỉ phép</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f6f8fa;
            margin: 0;
        }
        .navbar {
            background: #007bff;
            color: white;
            padding: 12px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
        }
        .navbar a:hover { text-decoration: underline; }
        .content {
            text-align: center;
            margin-top: 80px;
        }
        .btn {
            background: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <h2>🏢 Quản lý nghỉ phép</h2>
        </div>
        <div class="user">
            <% if (user != null) { %>
                Xin chào, <b><%= user.getUsername() %></b> |
                <a href="logout" class="btn">Đăng xuất</a>
            <% } else { %>
                <a href="login" class="btn">Đăng nhập</a>
            <% } %>
        </div>
    </div>

    <div class="content">
        <h2>Chào mừng đến với hệ thống quản lý nghỉ phép</h2>
        <% if (user != null) { %>
            <p>Bạn có thể chọn chức năng:</p>
            <a href="leaveList" class="btn">Xem đơn nghỉ phép</a>
            <a href="applyLeave" class="btn">Gửi đơn nghỉ phép</a>
        <% } else { %>
            <p>Vui lòng đăng nhập để sử dụng hệ thống.</p>
        <% } %>
    </div>
</body>
</html>
