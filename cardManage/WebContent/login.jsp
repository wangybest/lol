<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
//获取当前项目的路径，如：http://localhost:8080/项目名称。
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>   
  	<base href="<%=basePath%>"> 
  	<!-- 
  	base标记是一个基链接标记，是一个单标记。用以改变文件中所有链接标记的参数内定值，网页上的所有相对路径在链接时都将在前面加上基链接指向的地址。
  	比如:<base href="http://www.baidu.com">，那下面的href属性就会以上面设的为基准,方便使用相对路径
  	如:<a href="http://www.baidu.com/xxx.htm"></a>，现在就只需要写<a href="xxx.htm"></a>
  	 -->
    <title>后台登录</title>
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
	.errorMessage {font-weight:bold; color:red; }
	<!--errorMessage会自动更改错误消息的样式 -->
	</style>
	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.forms[0].submit();
	}
	//取消按钮
	function cancel(){
		document.forms[0].action = "";
	}
	</script>
  </head>
  <body>
  	<s:form action="user/login.action" method="post">
	<table>
		<tr>
			<td colspan="2"><img src="images/login.gif"></td>
		</tr>
		<tr>
			<td>姓名：</td>
			<td><s:textfield name="uname" cssClass="textSize"/></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><s:password name="upass" cssClass="textSize"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="登陆" onclick="gogo()" >
				<input type="button" value="取消" onclick="cancel()" >
			</td>
		</tr>
	</table>
	</s:form>
	<s:fielderror/>
  </body>
</html>
