<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  <body>
    没注册的用户，请<a href="register.jsp">注册</a>！<br>
    已注册的用户，去<a href="login.jsp">登录</a>！
  </body>
</html>
