<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0px auto;
	height: auto;
	width: 800px;
	border: 1px solid #006633;
}

#header {
	height: 90px;
	width: 800px;
	background-image: url(images/cc.jpg);
	margin: 0px 0px 3px 0px;
}

#header h1 {
	text-align: center;
	font-family: 华文彩云;
	color: #000000;
	font-size: 30px；
}

#navigator {
	height: 25px;
	width: 800px;
	font-size: 14px;
	background-image: url(images/cc.jpg);
}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;
}
#navigator li a {
	color: #000000;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 98px;
	height: 22px;
	text-align: center;
	background-color: PaleGreen;
	margin-left: 2px;
}
#navigator li a:hover {
	background-color: #006633;
	color: #FFFFFF;
}
#navigator ul li ul {
   visibility: hidden;
   position: absolute;
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}

#content {
	height: auto;
	width: 780px;
	padding: 10px;
}

#content iframe {
	height: 300px;
	width: 780px;
}

#footer {
	height: 30px;
	width: 780px;
	line-height: 2em;
	text-align: center;
	background-color: PaleGreen;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎<s:property value="#session.userName"/>进入名片管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a>名片管理</a>
				<ul>
					<li><a href="addCard.jsp" target="center">添加名片</a></li>
					<li><a href="card/queryCard.action?act=deleteSelect" target="center">删除名片</a></li>
					<li><a href="card/queryCard.action?act=updateSelect" target="center">修改名片</a></li>
					<li><a href="card/queryCard.action" target="center">查询名片</a></li>
				</ul>
			</li>
			<li><a>个人中心</a>
				<ul>
					<li><a href="updatePWD.jsp" target="_top">修改密码</a></li>
					<li><a href="userInfo.jsp" target="center">基本信息</a></li>
				</ul>
			</li>
			<li><a href="user/exit.action">安全退出</a></li>
		</ul>
		
	</div>
	<div id="content">
		<iframe src="card/queryCard.action"  name="center" frameborder="0"></iframe>
	</div>
	<div id="footer">Copyright ©清华大学出版社</div>
</body>
</html>


