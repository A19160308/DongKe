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
					<li class="layui-nav-item"><a href="uploadFile.jsp">植物学科出题管理</a></li>
					<li class="layui-nav-item"><a href="">待开发</a></li>
					<li class="layui-nav-item"><a href="">待开发</a></li>
				</ul>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="text-align: right; margin-right: 500px;">
			<legend>文件图片上传</legend>
		</fieldset>
		<div class="layui-fluid">
			<div style="margin: 0 auto;">
				<div style="margin: 0 415px; width: 703px;">
					<table id="tab" class="layui-table" lay-filter="demo"></table>'
				</div>
			</div>	
		</div>
		<div align="center" style="margin-left: 300px">

<%--   <%@ include file="listfiles.jsp"%>  --%>
    <div align="center" >
    		
                      
          <script>
             function x(form)
             {
                if(form.file1.value == ""||form.file2.value == "")
                {
                   alert("输入不能为空");
                   return false;
                }
                return true;
             }
         </script>   
             <form action="${pageContext.request.contextPath}/UploadHandleServlet" enctype="multipart/form-data" method="post" onsubmit="return x(this)" >
           <br/><br/>    <h2>请您上传文件和图片！</h2>
             <br/><br/>
             请输入 植物名称：<input type="text" name="plantname" >
              <br/><br/>
                              上传大图片：<input type="file" name="big_file1" ><br/><br/> 
                              上传小图片1：<input type="file" name="file1" ><br/><br/> 
         	上传小图片2：<input type="file" name="file2" ><br/><br/>  
         	 上传小图片3：<input type="file" name="file3" ><br/><br/>   
         	  上传文件(图注)：<input type="file" name="big_file" ><br/><br/>           
                 <input type="submit" value="开始上传" id="btn1" onclick="checkform()">    
             </form>

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