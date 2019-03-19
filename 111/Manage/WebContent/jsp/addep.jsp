<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>店长平台</title>
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
			<div class="layui-logo">店长平台</div>
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
					<li class="layui-nav-item"><a href="adlogin.jsp">店长登陆</a></li>
					<li class="layui-nav-item"><a href="adcontrolusers.jsp">会员管理</a></li>
					<li class="layui-nav-item"><a href="adcontrolcoach.jsp">健身教练管理</a></li>
					<li class="layui-nav-item"><a href="adcontrolep.jsp">健身器材管理</a></li>
					<li class="layui-nav-item"><a href="">留言管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-fluid">

			<script type="text/javascript">
function insertcoach(){
	 		var epname=$("#epname").val();
			var epprice=$("#epprice").val();
			var epimgpath=$("#epimgpath").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/insertEp",
						dataType:'json',
						data:{
							epname:epname,
							epprice:epprice,
							epimgpath:epimgpath
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	 
			    			   alert("新增成功");			    			  
			    			   var href = 'adcontrolep.jsp';
			    			   window.location.href = href ;			    	           
			    		 }else if(status=="账号已经被注册"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert("用户已经被注册");
			    		 }		    		 
			    		}  
						}); 
}
</script>

			<fieldset class="layui-elem-field layui-field-title"
				style="text-align: right; margin-right: 500px;">
				<legend>招募教练</legend>
			</fieldset>


			<!-- <form class="layui-form" action=""> -->
			<div class="layui-form-item"
				style="text-align: right; margin-right: 500px;">


				<div class="layui-form-item">
					<div class="layui-inline">
						<label
							padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">器材名称</label>
						<div class="layui-input-inline">
							<input class="layui-input" id="epname">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-inline">
							<label
								padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">器材价格/小时</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="epprice">
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-inline">
								<label
									padding: 20px 20px; width: 80px; font-weight: 400; line-height: 20px;style="text-align: right; margin-right: 600px;">适用项目</label>
								<div class="layui-input-inline">
									<input class="layui-input" id="epimgpath">
								</div>
							</div>


							<div class="layui-form-item">
								<div class="layui-input-block">
									<button onclick="insertcoach()" class="layui-btn" lay-submit=""
										lay-filter="demo1">立即提交</button>
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