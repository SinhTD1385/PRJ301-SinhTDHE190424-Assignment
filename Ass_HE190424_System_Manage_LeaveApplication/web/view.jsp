<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Request" %>
<%
    Request r = (Request) request.getAttribute("request");
    if (r == null) {
%>
    <h3>Không có thông tin để hiển thị!</h3>
<%
    return;
    }
%>
<html>
<head>
    <title>Chi tiết đơn nghỉ phép</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f6f8fa;
            margin: 40px;
        }
        .container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            width: 600px;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .label {
            font-weight: bold;
            color: #333;
            width: 40%;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 8px 14px;
            border-radius: 5px;
        }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chi tiết đơn nghỉ phép</h2>
        <table>
            <tr><td class="label">Mã đơn:</td><td><%= r.getRequestID() %></td></tr>
            <tr><td class="label">Nhân viên:</td><td><%= r.getEmployeeName() %></td></tr>
            <tr><td class="label">Email:</td><td><%= r.getEmail() %></td></tr>
            <tr><td class="label">Điện thoại:</td><td><%= r.getPhone() %></td></tr>
            <tr><td class="label">Phòng ban:</td><td><%= r.getDivisionName() %></td></tr>
            <tr><td class="label">Từ ngày:</td><td><%= r.getFromDate() %></td></tr>
            <tr><td class="label">Đến ngày:</td><td><%= r.getToDate() %></td></tr>
            <tr><td class="label">Lý do nghỉ:</td><td><%= r.getReason() %></td></tr>
            <tr><td class="label">Trạng thái:</td><td><%= r.getStatus() %></td></tr>
            <tr><td class="label">Ngày xử lý:</td><td><%= r.getProcessingDate() != null ? r.getProcessingDate() : "Chưa xử lý" %></td></tr>
            <tr><td class="label">Ghi chú xử lý:</td><td><%= r.getProcessingReason() != null ? r.getProcessingReason() : "—" %></td></tr>
        </table>
        <a href="list" class="btn">← Quay lại danh sách</a>
    </div>
</body>
</html>
