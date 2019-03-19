<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>教师管理平台</title>
<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
$(function(){
	
	creatTab();
})
</script>


</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">教师管理平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">联系我们</a></li>
				<li class="layui-nav-item"><a href="">技术支持</a></li>

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> '${adname }'
				</a></li>
				<li class="layui-nav-item"><a
					href="${pageContext.request.contextPath}/index.jsp">返回首页</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a href="tea_manage.jsp">学生信息管理</a></li>
					<li class="layui-nav-item"><a href="adcontrolusers.jsp">教师信息管理</a></li>
					<li class="layui-nav-item"><a href="adcontrolcoach.jsp">植物学科出题管理</a></li>
					<li class="layui-nav-item"><a href="adcontrolep.jsp">待开发</a></li>
					<li class="layui-nav-item"><a href="">待开发</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-fluid">



			<fieldset class="layui-elem-field layui-field-title"
				style="text-align: right; margin-right: 500px;">
				<legend>新增学生</legend>
			</fieldset>
			<script type="text/javascript">
function register(){
	 		var username=$("#username").val();
			var password=$("#password").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/plant/registerStu",
						dataType:'json',
						data:{
							username:username,
							userpassword:password
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status==1){			    		    	 
			    			   alert("新增学生成功！");			    			  
			    			   var href = '${pageContext.request.contextPath}/jsp/tea_manage.jsp';
		                       window.top.location.href = href;			    	           
			    		 }else if(status==0){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert("学生已经存在！！");
			    		 }		    		 
			    		}  
						}); 
}
</script>
			<!-- <form class="layui-form" action=""> -->
			<div class="layui-form-item"
				style="text-align: right; margin-right: 500px;">


				<div class="layui-form-item">
					<div class="layui-inline">
						<label
							padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">学生姓名：</label>
						<div class="layui-input-inline">
							<input class="layui-input" id="username">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-inline">
							<label
								padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">学生学号：</label>
							<div class="layui-input-inline">
								<input type="password" placeholder="密码" class="layui-input"
									id="password">
							</div>
						</div>

					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button onclick="register()" class="layui-btn" lay-filter="demo1">增加</button>
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