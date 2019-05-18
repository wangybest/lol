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
<title>detail.jsp</title>
<base href="<%=basePath%>">
</head>
<body>
	<center>
		<table border=1 background="images/cc.jpg" style="border-collapse: collapse">
			<caption>
				<font size=4 face=华文新魏>名片详细信息</font>
			</caption>
			<tr>
				<td>ID</td>
				<td> <s:property value="acard.id"/> </td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><s:property value="acard.name"/></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><s:property value="acard.telephone"/></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><s:property value="acard.email"/></td>
			</tr>
			<tr>
				<td>单位</td>
				<td><s:property value="acard.company"/></td>
			</tr>
			
			<tr>
				<td>地址</td>
				<td><s:property value="acard.address"/></td>
			</tr>
			
			<tr>
				<td>Logo</td>
				<td>
					<s:if test="acard.newFileName != null">
						<img alt="" width="250" height="250"
						src="logos/<s:property value="acard.newFileName"/>"/>
					</s:if>	
					<s:else>
						没有Logo
					</s:else>
				</td>
			</tr>
			
		</table>
	</center>
</body>
</html>