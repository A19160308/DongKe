<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>

<link rel="stylesheet" href="../layui/css/layui.css" />
<title>Insert title here</title>
<style>
/* table {
    height:500px;
    line-height: 500px;
}
	} */
</style>
<script
	src="../js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
</head>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>店长平台</title>
<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>

<script type="text/javascript">
$(function(){
	ifLogin();
	display();
})
</script>

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
		<div class="layui-header">
			<div class="layui-logo">会员平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">联系我们</a></li>
				<li class="layui-nav-item"
					style="text-align: right; margin-right: 400px;"><a href="">技术支持</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> '${username }'
				</a></li>
				<li class="layui-nav-item"><a
					href="${pageContext.request.contextPath}/index.jsp">返回首页</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a href="userslogin.jsp">会员登陆</a></li>
					<li class="layui-nav-item"><a href="coachorder.jsp">健身教练预定</a></li>
					<li class="layui-nav-item"><a href="equipmentorder.jsp">健身器材预定</a></li>
					<li class="layui-nav-item"><a href="messageorder.jsp">留言区</a></li>
					<li class="layui-nav-item"><a href="shoppingcarorder.jsp">订单管理</a></li>
				</ul>
			</div>
		</div>
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
		<script type="text/javascript">

//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>
</html>