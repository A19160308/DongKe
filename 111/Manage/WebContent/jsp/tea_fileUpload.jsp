<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>教师管理平台</title>

<!-- 引用控制层插件样式 -->

<link rel="stylesheet" href="../control/css/zyUpload.css" type="text/css">

<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>

<!-- 引用核心层插件 -->

<script src="../core/zyFile.js"></script>

<!-- 引用控制层插件 -->

<script src="../control/js/zyUpload.js"></script>

<!-- 引用初始化JS -->

<script src="../core/jq22.js"></script>






<link rel="stylesheet" href="../layui/css/layui.css">
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">
$(function(){
	creatTab();
})
</script>
</head>
<body >
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">教师管理平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">联系我们</a></li>
				<li class="layui-nav-item"
					style="text-align: right; margin-right: 400px;"><a href="">技术支持</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">'${tea_name}'
						
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
					<li class="layui-nav-item"><a href="tea_message.jsp">教师信息管理</a></li>
					<li class="layui-nav-item"><a href="">植物学科出题管理</a></li>
					<li class="layui-nav-item"><a href="">待开发</a></li>
					<li class="layui-nav-item"><a href="">待开发</a></li>
				</ul>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="text-align: right; margin-right: 650px;">
			<legend>学生信息管理</legend>

		</fieldset>
		</div>
		<script src="../layui/layui.js"></script>
		<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
			<h1 style="text-align:center;">Html5 Upload示例</h1>
<div id="demo" class="demo"></div>
			
</body>
</html>