<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
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
	.textSize{
		width: 100pt;
		height: 15pt
	}
</style>
<title>ע�ử��</title>
<script type="text/javascript">
	//���������󣬵��ø÷������ж��û����Ƿ����
	function nameIsNull(){
		var name=document.registForm.uname.value;
		if(name==""){
			alert("������������");
			document.registForm.uname.focus();
			return false;
		}
		document.registForm.flag.value="0";
		document.registForm.submit();
		return true;
	}
	//ע��ʱ���������
	function allIsNull(){
		var name=document.registForm.uname.value;
		var pwd=document.registForm.upass.value;
		var repwd=document.registForm.reupass.value;
		if(name==""){
			alert("������������");
			document.registForm.uname.focus();
			return false;
		}
		if(pwd==""){
			alert("���������룡");
			document.registForm.upass.focus();
			return false;
		}
		if(repwd==""){
			alert("������ȷ�����룡");
			document.registForm.reupass.focus();
			return false;
		}
		if(pwd!=repwd){
			alert("2�����벻һ�£����������룡");
			document.registForm.upass.value="";
			document.registForm.reupass.value="";
			document.registForm.upass.focus();
			return false;
		}
		document.registForm.flag.value="1";
		document.registForm.submit();
		return true;
	}
</script>
</head>
<body>
	<form action="user/regist.action" method="post" name="registForm">
		<input type="hidden" name="flag">
		<table 
		border=1 
		bgcolor="lightblue" 
		align="center">
			<tr>
				<td>������</td>
				<td>
					<input class="textSize" type="text" name="uname" value="${requestScope.uname }"   onblur="nameIsNull()" />
					<s:if test="#request.isExit=='false'">
						<font color=red size=5>��</font>
					</s:if>
					
					<s:if test="#request.isExit=='true'">
						<font color=green size=5>��</font>
					</s:if>
				</td>
			</tr>
			
			<tr>
				<td>���룺</td>
				<td><input class="textSize" type="password" maxlength="20" name="upass"/></td>
			</tr>
			
			<tr>
				<td>ȷ�����룺</td>
				<td><input class="textSize" type="password" maxlength="20" name="reupass"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="button" value="ע��" onclick="allIsNull()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>