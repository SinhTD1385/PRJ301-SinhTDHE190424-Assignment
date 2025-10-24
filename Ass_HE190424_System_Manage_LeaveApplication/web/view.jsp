<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Request, model.User" %>
<%
    Request r = (Request) request.getAttribute("requestDetail");
%>
<html>
<head>
    <title>Chi tiết đơn nghỉ phép</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #f7f9fc;
            margin: 0;
        }
        .container {
            background: white;
            width: 60%;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
        }
        h2 { color: #007bff; text-align: center; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; }
        td { padding: 10px; vertical-align: top; }
        tr:nth-child(even) { background: #f9f9f9; }
        .label { width: 25%; font-weight: bold; color: #333; }
        .value { width: 75%; }
        .back-btn {
            display: block;
            margin: 30px auto 0 auto;
            padding: 10px 18px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }
        .back-btn:hover { background: #0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>📄 Chi tiết đơn nghỉ phép</h2>
    <% if (r != null) { %>
        <table>
            <tr><td class="label">Mã đơn:</td><td class="value"><%= r.getRequestID() %></td></tr>
            <tr><td class="label">Người tạo:</td><td class="value"><%= r.getCreatedBy().getUsername() %></td></tr>
            <tr><td class="label">Từ ngày:</td><td class="value"><%= r.getFromDate() %></td></tr>
            <tr><td class="label">Đến ngày:</td><td class="value"><%= r.getToDate() %></td></tr>
            <tr><td class="label">Lý do nghỉ:</td><td class="value"><%= r.getReason() %></td></tr>
            <tr><td class="label">Trạng thái:</td><td class="value"><%= r.getStatus() %></td></tr>

            <% if (r.getProcessedBy() != null) { %>
                <tr><td class="label">Người xử lý:</td><td class="value"><%= r.getProcessedBy().getUsername() %></td></tr>
                <tr><td class="label">Ngày xử lý:</td><td class="value"><%= r.getProcessingDate() %></td></tr>
                <tr><td class="label">Lý do xử lý:</td><td class="value"><%= r.getProcessingReason() %></td></tr>
            <% } %>
        </table>
    <% } else { %>
        <p style="text-align:center; color:red;">Không tìm thấy thông tin đơn nghỉ phép!</p>
    <% } %>
    <a href="list" class="back-btn">⬅ Quay lại danh sách</a>
</div>
</body>
</html>
