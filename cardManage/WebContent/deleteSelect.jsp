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
    <title>deleteSelect.jsp</title>
	<link href="css/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
    		background-color: #F08080;
    	}
	</style>
	<script type="text/javascript">
  		function confirmDelete(){
  			var n = document.deleteForm.ids.length;
  			var count = 0;//统计没有选中的个数
  			for(var i = 0; i < n; i++){
  				if(!document.deleteForm.ids[i].checked){
  					count++;
  				}else{
  					break;
  				}
  			}
  			if(n > 1){//多个名片
  				//所有的名片都没有选择
  				if(count == n){
  					alert("请选择删除的名片！");
  	  				count = 0;
  	  				return false;
  				}
  			}else{//一个名片
  				//就一个名片并且还没有选择
  	  			if(!document.deleteForm.ids.checked){
  	  					alert("请选择删除的名片！");
  	  					return false;
  	  			}
  			}	
  		
  			if(window.confirm("真的删除吗？really?")){
  				document.deleteForm.action="card/deleteCard.action?act=button";
  				document.deleteForm.submit();
  				return true;
  			}
  			return false;
  		}
  		function checkDel(id){
  			if(window.confirm("是否删除该名片？")){
  				window.location.href = "/cardManage/card/deleteCard.action?act=link&id="+id;
  			}
  		}
  		function changeColor(obj){
  			obj.className = "bgcolor";
  		}
  		function changeColor1(obj){
  			obj.className = "";
  		}
  </script>
</head>
<body>
	<br>
	<s:form action="card/deleteCard.action?act=button" name="deleteForm">
	<table border="1" bordercolor="PaleGreen">
		<tr>
			<th width="250px">ID</th>
			<th width="200px">名称</th>
			<th width="200px">单位</th>
			<th width="200px">详情</th>
			<th width="200px">操作</th>
		</tr>
		<!-- allCards为action中的变量 -->
		<s:iterator value="allCards" var="c">
			<tr  onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
				<td>
				
					<input type="checkbox" name="ids" value="<s:property value="id"/>"/>
					<s:property value="id"/>
				</td>
				<td><s:property value="name"/></td>
				<td><s:property value="company"/></td>
				<td><a href="card/selectACard.action?id=<s:property value="id"/>" target="_blank">详情</a></td>
				<td>
					<a href="javascript:checkDel('<s:property value="id"/>')">删除</a>
				</td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="5">
				<input type="button" value="删除" onclick="confirmDelete()">
			</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
			&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;
			第${pageCur}页&nbsp;&nbsp;
			<s:url id="url_pre" value="card/queryCard.action">
			   <s:param name="pageCur" value="pageCur-1"></s:param>
			   <s:param name="act" value="'deleteSelect'"></s:param>
			</s:url>
			<s:url id="url_next" value="card/queryCard.action">
			   <s:param name="pageCur" value="pageCur+1"></s:param>
			   <s:param name="act" value="'deleteSelect'"></s:param>
			</s:url>
			<!-- OGNL语言默认会调用-1的方法 -->
			<s:a href="%{url_pre}">上一页</s:a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<s:a href="%{url_next}">下一页</s:a>
			</td>
		</tr> 
	</table>
	</s:form>
</body>
</html>