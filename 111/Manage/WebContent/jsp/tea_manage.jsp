<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>教师管理平台</title>
 <script type="text/javascript" src="../js/jquery.js"></script> 
<script type="text/javascript" src="../layui/layui.js"></script>
<link rel="stylesheet" href="../layui/css/layui.css">
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
					href="">返回首页</a></li>
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
			<legend>学生信息管理</legend>
		</fieldset>
		<div class="layui-fluid">
			<div style="margin: 0 auto;">
				<div style="margin: 0 415px; width: 753px;">
					<table id="tab" class="layui-table" lay-filter="demo"></table>
				</div>
			</div>
			<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="add">增加</a>    
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	</script>
			<script type="text/javascript">
			function creatTab(){//查询题目选择				
				$.post('${pageContext.request.contextPath}/plant/getAllStu',function(data){
					/* console.log('--'+data.dataList[0].coachimgpath); */
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						 /*  console.log('=='+data.data); */
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'stu_name', width:100, title: '学生姓名 ',fixed:"left"}
						      ,{field:'stu_password', width:150, title: '学生学号(密码)'}
						      ,{field:'stu_score', width:120, title: '学生成绩'}
						      ,{field:'flag', width:80, title: '标志'}
						      ,{field:'stu_id', width:90, title: '学生编号'}
						      ,{fixed: 'right', width:210,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;
								    if(bb.event === 'add'){
								    	layer.confirm('确定新增加学生吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			//var aa = data.stu_name;
								    			$.post("http://localhost:8080/Manage/plant/addStu",{},function(obj){								    				
								    				window.location.href = 'addStu.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }				
								    if(bb.event === 'delete'){
								    	layer.confirm('你确定要删除该学生吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.stu_id;
								    			$.post("http://localhost:8080/Manage/plant/deleteStu",{"stu_id":aa},function(obj){								    				
								    					window.location.href = 'tea_manage.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }
								    if(bb.event === 'edit'){
								    	layer.confirm('进入编辑页面？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.stu_id;
								    			$.post("http://localhost:8080/Manage/plant/editStu",{"stu_id":aa},function(obj){								    				
								    					window.location.href = 'editStu.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }
								 								    
								});
						});
				});
			}
		</script>
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