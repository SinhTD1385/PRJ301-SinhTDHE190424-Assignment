<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Đăng nhập hệ thống</title>
    <style>
        body { font-family: Arial; background-color: #eef3f7; text-align: center; }
        .box {
            background: white;
            width: 320px;
            margin: 100px auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input, button { width: 100%; padding: 10px; margin-top: 10px; }
        button { background: #007bff; color: white; border: none; border-radius: 4px; }
        .error { color: red; margin-top: 10px; }
        a { color: #007bff; text-decoration: none; display: block; margin-top: 10px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Đăng nhập hệ thống</h2>
    <form action="login" method="post">
        <input type="hidden" name="next" value="<%= request.getParameter("next") %>">
        <input type="text" id="txt_username" name="username" placeholder="Tên đăng nhập" required>
        <input type="password" id="txt_password" name="password" placeholder="Mật khẩu" required>
        <button type="submit">Đăng nhập</button>
    </form>
    <div class="error">
        <%
            String msg = (String) request.getAttribute("message");
            if (msg != null) out.print(msg);
        %>
    </div>
    <a href="index.html">⬅ Quay lại menu</a>
</div>
</body>
</html>
