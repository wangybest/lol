<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateCard.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <s:form action="card/updateCard.action" method="post" enctype="multipart/form-data">
		<table border=1 style="border-collapse: collapse">
			<caption>
				<font size=4 face=华文新魏>修改名片</font>
			</caption>
			<tr>
				<td>ID<font color="red">*</font></td>
				<td><s:textfield name="id" 
				cssStyle="border-width: 1pt; border-style: dashed; border-color: red"
				 value="%{acard.id}" 
				readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>名称<font color="red">*</font></td>
				<td><s:textfield name="name" value="%{acard.name}"/> </td>
			</tr>
			<tr>
				<td>电话<font color="red">*</font></td>
				<td><s:textfield name="telephone" value="%{acard.telephone}"/></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><s:textfield name="email" value="%{acard.email}"/></td>
			</tr>
			<tr>
				<td>单位</td>
				<td><s:textfield name="company" value="%{acard.company}"/></td>
			</tr>
			
			<tr>
				<td>Logo</td>
				<td>
					<s:file name="logo"/><br>
					<s:if test="acard.newFileName != null">
						<img alt="" width="50" height="50"
						src="logos/<s:property value="acard.newFileName"/>"/>
					</s:if>
					<s:hidden name="oldFileName" value="%{acard.newFileName}"/>	
				</td>
			</tr>
			
			<tr>
				<td align="center"><s:submit value="提交"/></td>
				<td align="left"><s:reset value="重置"/></td>
			</tr>
		</table>
	</s:form>
  </body>
</html>
