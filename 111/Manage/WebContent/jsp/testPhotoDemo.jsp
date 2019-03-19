<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>

<link rel="stylesheet" href="../layui/css/layui.css" />
<title>测试出题界面！！</title>
<style>
/* table {
    height:500px;
    line-height: 500px;
}
	} */
</style>
<script
	src="${pageContext.request.contextPath}/js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
</head>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>店长平台</title>
<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>

<!-- <script type="text/javascript">
$(function(){
	ifLogin();
	display();
})
</script> -->

<script type="text/javascript">
function ifLogin() {	
	 if(null=='${username }'||""=='${username }'){
		alert("未检测到会员登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/userslogin.jsp"
	}else{
	} 
}

</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">

		<fieldset class="layui-elem-field layui-field-title"
			style="text-align: right; margin-right: 500px;">
			<legend>留言</legend>
		</fieldset>
		<script type="text/javascript">	 
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
		<div style="margin-left: 500px">
			<dl class="admin_login">
				<dt>
					<strong>留言区</strong>
				</dt>
				<dd class="user_icon">
					<textarea rows="6" cols="50" id="adname"></textarea>
				</dd>
				<dd>
					<button onclick="writemessage()">提交</button>
				</dd>
			</dl>
		</div>
		<table align="center" border="1" bgcolor="#4EEE94" width="600px">
			<tr>
				<td>留言板编号</td>
				<td>留言板内容</td>
				<td>会员姓名</td>
			</tr>
			<tbody id="listTbody"></tbody>
		</table>
		
</body>
</html>
</html>