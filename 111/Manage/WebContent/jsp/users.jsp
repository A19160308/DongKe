<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
  
 
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户结果</title>

<link href="js/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
<script src="js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 表格 -->
	<div align="center">
		<table class="table table-hover" id="professionPaylist"
			style="margin-left: 60px; width: 1000px; margin-top: 10px; font-size: 12px;">
			<thead>
				<tr>
					<td><b>用户</b></td>
					<td><b>密码</b></td>

				</tr>
			</thead>
			<tbody class="listbody">

				<c:if test="${!empty list}">
					<c:forEach items="${list}" var="list">
						<tr>
							<td><b>${list.username }</b></td>
							<td><b>${list.userpasswd }</b></td>

						</tr>
					</c:forEach>
				</c:if>


			</tbody>
		</table>

	</div>
	<!-- 表格结束 -->

</body>
</html>