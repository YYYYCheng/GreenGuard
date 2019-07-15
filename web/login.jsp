<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>登录界面</title>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/css.css" />
</head>
<body>
<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
    <h1>绿播</h1>
    <input class=input_1 id=username size=15  name="username"  placeholder=用户名><br />
    <input class=input_1 id=password type=text size=15 name="password" placeholder=密码><br />
<br><br>
    <input class=input_3 type="submit" onclick="login()" value="登录" />
    <input class=input_3 type="button"  onclick=document.form1.reset() value="重置" />
</form>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
