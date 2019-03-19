<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		  String money=request.getParameter("money");
		  String name=request.getParameter("name");
	%>
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

<script type="text/javascript">
$(function(){
	ifLogin();
	
})
</script>

<script type="text/javascript">
function ifLogin() {	
	 if(null=='${username }'||""=='${username }'){
		alert("未检测到会员登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/userslogin.jsp"
	}else{
		alert(money+"  "+name);
		alert("恭喜您消费了"+money+"租用"+name+"成功");
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
			<legend>支付</legend>
		</fieldset>
		<script type="text/javascript">	 
	function display(money,name) {
		
	 
		alert("恭喜您"+"'${username }'"+"消费了"+money+"租用"+name+"成功");
		 /* var htmlStr="";
		htmlStr+="<p>";
		htmlStr+="恭喜您"+"'${username }'"+"消费了"+money+"租用"+name+"成功</p>";
		
		
		$("#listTbody").html(htmlStr);  */ 
		 
		
		
		/* $.ajax({
			url:'${pageContext.request.contextPath}/jsp/payShopping',
			type:"post",
			success:function(data){
				//alert(data.dataList)
				var htmlStr="";
				$.each(data.dataList,function(index,obj){
					htmlStr+="<tr>";
					htmlStr+="<td>"+"恭喜您"+"'${username }'"+"消费了"+"</td>";
					htmlStr+="<tr>";
					htmlStr+="<td>"+obj.shopcarprice+"</td>";
					htmlStr+="<tr>";
					htmlStr+="<td>"+"</td>";
					htmlStr+="<td>"+"购买"+obj.shopcarname+"成功"+"</td>";
					htmlStr+="</tr>";
				}) 
				$("#listTbody").html(htmlStr);
			}
		})		 */
	}
</script>

		
		<script type="text/javascript">

//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>

</body>
</html>
</html>