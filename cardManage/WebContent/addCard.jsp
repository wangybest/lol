<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%  
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>addCard.jsp</title>
<link href="css/common.css" type="text/css" rel="stylesheet">
</head>    
<body>
	<s:form action="card/addCard.action" method="post" enctype="multipart/form-data">
		<table border=1 style="border-collapse: collapse">
			<caption>
				<font size=4 face=华文新魏>添加名片</font>
			</caption>
			<tr>
				<td>姓名<font color="red">*</font></td>
				<td><s:textfield name="name"/> </td>
			</tr>
			<tr>
				<td>电话<font color="red">*</font></td>
				<td><s:textfield name="telephone"/></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><s:textfield name="email"/></td>
			</tr>
			<tr>
				<td>单位</td>
				<td><s:textfield name="company"/></td>
			</tr>
			<tr>
				<td>职务</td>
				<td><s:textfield name="post"/></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><s:textfield name="address"/></td>
			</tr>
			<tr>
				<td>logo</td>
				<td><s:file name="logo"/></td>
			</tr>
			<tr>
				<td align="center"><s:submit value="提交"/></td>
				<td align="left"><s:reset value="重置"/></td>
			</tr>
		</table>
	</s:form>
	<s:fielderror/>
</body>
</html>
