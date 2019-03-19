<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>会员平台</title>
<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">

</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">会员平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">联系我们</a></li>
				<li class="layui-nav-item"><a href="">技术支持</a></li>

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
		<div class="layui-fluid">
			<script type="text/javascript">
/* 登陆部分 */
 function login(){
	 		var username=$("#username").val();
			var password=$("#password").val();
			   $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/login",
						dataType:'json',
						data:{
							username:username,
							userpassword:password
						},	
			    		 success : function(data) {	    			
			    			  var status=data.status;			    			
			    		     if(status=="登陆成功"){	
			    		    console.log(status);
			    			   alert(status);			    			  
			    			   var href = '${pageContext.request.contextPath}/jsp/userslogin.jsp';
		                       window.top.location.href = href;			    	           
			    		 }else if(status=="密码错误"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert(status);
			    		 }else if(status=="账号不存在"){
			    			 //$("#Error").html("账户不存在！");
			    			 alert(status);
			    		 } 			    		 
			    		},
			    		error:function(XMLHttpRequest, textStatus, errorThrown){
			    			alert(XMLHttpRequest);
			    			alert(textStatus);
			    			alert(errorThrown);
			    		}
						});  
}
 </script>

			<!-- /* 注册部分 */ -->
			<script type="text/javascript">
function register(){
	 		var username=$("#username").val();
			var password=$("#password").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/RegisterUser",
						dataType:'json',
						data:{
							"username":username,
							"userpassword":password
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	
			    			   alert(status);			    			  
			    			   var href = '${pageContext.request.contextPath}//jsp/userslogin.jsp';
		                       window.top.location.href = href;			    	           
			    		 }else if(status=="账号已经被注册"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert(status);
			    		 }		    		 
			    		}  
						}); 
}
</script>

			<fieldset class="layui-elem-field layui-field-title"
				style="text-align: right; margin-right: 500px;">
				<legend>会员登陆</legend>
			</fieldset>
			<!-- <form class="layui-form" action=""> -->
			<div class="layui-form-item"
				style="text-align: right; margin-right: 500px;">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label
							padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">账号</label>
						<div class="layui-input-inline">
							<input class="layui-input" id="username">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label
								padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">密码</label>
							<div class="layui-input-inline">
								<input type="password" placeholder="密码" class="layui-input"
									id="password">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button onclick="login()" class="layui-btn" lay-filter="demo1">登陆</button>
								<button onclick="register()" class="layui-btn" lay-filter="demo2">注册</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../layui/layui.js"></script>
		<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>