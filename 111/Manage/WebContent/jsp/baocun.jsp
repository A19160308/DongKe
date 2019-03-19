<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="author" content="DeathGhost" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="../js/jquery.js"></script>
<script src="../js/verificationNumbers.js"
	tppabs="js/verificationNumbers.js"></script>
<script src="../js/Particleground.js" tppabs="js/Particleground.js"></script>

<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	 $(function () {		
		display();
	});	 
	function display() {
		$.ajax({
			url:'${pageContext.request.contextPath}/jsp/getAllMessage',
			type:"post",
			success:function(data){
				//alert(data.dataList)
				var htmlStr="";
				$.each(data.dataList,function(index,obj){
					htmlStr+="<tr>";
					htmlStr+="<td>"+obj.messageid+"</td>";
					htmlStr+="<td>"+obj.messageboard+"</td>";
					htmlStr+="<td>"+obj.messageusername+"</td>";
					htmlStr+="</tr>";
				}) 
				$("#listTbody").html(htmlStr);
			}
		})		
	}
	 function writemessage(){
	 		var adname=$("#adname").val();
			   $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/writeMessage",
						dataType:'json',
						data:{
							messageboard:adname,
						},	
			    		 success : function(data) {
			    			 window.location.href="${pageContext.request.contextPath}/jsp/messageorder.jsp"
			    				 display();
			    		}			    		
						});  
}
</script>
</head>
<body>
	<%-- <%@ include file="head.jsp" %> --%>
	<div style="margin-left: 500px">
		<dl class="admin_login">
			<dt>
				<strong>留言区</strong>
			</dt>
			<dt>
				<em><a href="${pageContext.request.contextPath }/index.jsp">返回首页</a></em>
			</dt>
			<dd class="user_icon">
				<textarea rows="3" cols="20" id="adname"></textarea>
			</dd>
			<dd>
				<button onclick="writemessage()">提交</button>
			</dd>
		</dl>
	</div>
	<table align="center" border="1">
		<tr>
			<td>留言板编号</td>
			<td>留言板内容</td>
			<td>会员姓名</td>
		</tr>
		<tbody id="listTbody"></tbody>
	</table>
</body>
</html>