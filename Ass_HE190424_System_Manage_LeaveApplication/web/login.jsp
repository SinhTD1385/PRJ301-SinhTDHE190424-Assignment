<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Đăng nhập hệ thống nghỉ phép</title>
    <style>
        body {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            font-family: "Segoe UI", sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-box {
            background: white;
            width: 360px;
            padding: 30px 35px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            text-align: center;
            animation: fadeIn 0.8s ease;
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            font-weight: 500;
            margin-top: 10px;
            color: #444;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #4facfe;
            box-shadow: 0 0 4px #4facfe;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            border: none;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .msg {
            margin-top: 15px;
            font-size: 14px;
            font-weight: 500;
        }

        .msg.success {
            color: #0a8a0a;
            background: #e9ffe9;
            padding: 8px;
            border-radius: 5px;
        }

        .msg.error {
            color: #c0392b;
            background: #ffe9e9;
            padding: 8px;
            border-radius: 5px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="login-box">
        <h2>Đăng nhập hệ thống nghỉ phép</h2>
        <form action="login" method="post">
            <label>Tên đăng nhập</label>
            <input type="text" name="username" required>

            <label>Mật khẩu</label>
            <input type="password" name="password" required>

            <button type="submit">Đăng nhập</button>
        </form>

        <%
            String msg = (String) request.getAttribute("message");
            if (msg != null) {
                if (msg.contains("thành công")) {
        %>
                    <div class="msg success"><%= msg %></div>
        <%
                } else {
        %>
                    <div class="msg error"><%= msg %></div>
        <%
                }
            }
        %>
    </div>
</body>
</html>
