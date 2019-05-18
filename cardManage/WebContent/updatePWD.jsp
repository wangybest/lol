<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
<style type="text/css">
	table{
		text-align: center;
	}
	.textSize{
		width: 120px;
		height: 25px;
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	body {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		margin: 10px 10px auto;
		background-image: url(images/cc.jpg);
	}
</style>
<title>修改密码</title>
<script type="text/javascript">
	//注册时检查输入项
	function allIsNull(){
		var pwd=document.updateForm.upass.value;
		var repwd=document.updateForm.reupass.value;
		if(pwd==""){
			alert("请输入新密码！");
			document.updateForm.upass.focus();
			return false;
		}
		if(repwd==""){
			alert("请输入确认新密码！");
			document.updateForm.reupass.focus();
			return false;
		}
		if(pwd!=repwd){
			alert("2次密码不一致，请重新输入！");
			document.updateForm.upass.value="";
			document.updateForm.reupass.value="";
			document.updateForm.upass.focus();
			return false;
		}
		document.updateForm.submit();
		return true;
	}
</script>
</head>
<body>
	<form action="user/updatePwd.action" method="post" name="updateForm">
		<table>
			<tr>
				<td>姓名：</td>
				<td>
					<s:property value="#session.userName"/>
				</td>
			</tr>
			
			<tr>
				<td>新密码：</td>
				<td><input class="textSize" type="password" maxlength="20" name="upass"/></td>
			</tr>
			
			<tr>
				<td>确认新密码：</td>
				<td><input class="textSize" type="password" maxlength="20" name="reupass"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="button" value="修改密码" onclick="allIsNull()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
