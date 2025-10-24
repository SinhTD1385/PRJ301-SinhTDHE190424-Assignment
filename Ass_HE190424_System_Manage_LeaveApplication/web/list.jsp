<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Request, model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
    List<Request> requests = (List<Request>) request.getAttribute("requests");
%>
<html>
<head>
    <title>Danh sách đơn nghỉ phép</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }
        .container {
            width: 85%;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
        }
        th, td {
            padding: 10px 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) { background: #f9f9f9; }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .edit { background-color: #28a745; }
        .delete { background-color: #dc3545; }
        .edit:hover { background-color: #218838; }
        .delete:hover { background-color: #c82333; }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        a.home {
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
        }
        a.home:hover { background: #0056b3; }
        
        .view{
            background-color: #17a2b8;
        }
        
        .view:hover{
            background-color: #138496;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="topbar">
        <h2>📋 Danh sách đơn nghỉ phép của <%= user.getUsername() %></h2>
        <a href="menu.jsp" class="home">⬅ Về menu</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Từ ngày</th>
            <th>Đến ngày</th>
            <th>Lý do</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>

        <% if (requests != null && !requests.isEmpty()) {
            for (Request r : requests) { %>
                <tr>
                    <td><%= r.getRequestID() %></td>
                    <td><%= r.getFromDate() %></td>
                    <td><%= r.getToDate() %></td>
                    <td><%= r.getReason() %></td>
                    <td><%= r.getStatus() %></td>
                    <td>
                        <form action="edit" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= r.getRequestID() %>"/>
                            <button type="submit" class="btn edit">✏ Edit</button>
                        </form>

                        <form action="list" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= r.getRequestID() %>"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" class="btn delete">🗑 Remove</button>
                        </form>
                            
                        <form action="view" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= r.getRequestID() %>"/>
                            <button type="submit" class="btn view">👁 Details</button>
                        </form>

                    </td>
                </tr>
        <% } } else { %>
            <tr><td colspan="6">Chưa có đơn nghỉ phép nào</td></tr>
        <% } %>
    </table>
</div>
</body>
</html>
