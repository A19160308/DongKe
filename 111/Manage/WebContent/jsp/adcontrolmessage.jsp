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
$(function(){
	ifadLoginMessage();
	creatTab();
})
</script>

<script type="text/javascript">
function ifadLogin() {	
	 if(null=='${adname }'||""=='${adname }'){
		alert("未检测到店长登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/adlogin.jsp"
	}else{
		/* alert("当前店长"+"    "+"${adname}"); */
		/* window.location.href="${pageContext.request.contextPath}/jsp/adcontrolusers.jsp" */
	} 
}



function ifadLoginCoach() {
	
	 if(null=='${adname }'||""=='${adname }'){
		alert("未检测到店长登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/adlogin.jsp"
	}else{
		/* alert("当前店长"+"    "+"${adname}"); */
		/* window.location.href="${pageContext.request.contextPath}/jsp/adcontrolcoach.jsp" */
	} 
}


function ifadLoginMessage() {
	
	 if(null=='${adname}'||""=='${adname }'){
		alert("未检测到店长登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/adlogin.jsp"
	}else{
		
		/* window.location.href="${pageContext.request.contextPath}/jsp/adcontrolep.jsp" */
	} 
}
</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">店长平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">联系我们</a></li>
				<li class="layui-nav-item"
					style="text-align: right; margin-right: 400px;"><a href="">技术支持</a></li>
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
					<li class="layui-nav-item"><a href="adcontrolmessage.jsp">留言管理</a></li>
				</ul>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="text-align: right; margin-right: 500px;">
			<legend>留言管理</legend>
		</fieldset>
		<div class="layui-fluid">

			<div style="margin: 0 auto;">

				<div style="margin: 0 415px; width: 653px;">
					<table id="tab" class="layui-table" lay-filter="demo"></table>
				</div>
			</div>
			<script type="text/html" id="barDemo">  
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
 	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="modify">编辑</a>

	</script>
			<script type="text/javascript">
			function creatTab(){//查询题目选择	
				$.post('${pageContext.request.contextPath}/jsp/getAllMessage',function(data){
					/* console.log('--'+data.dataList[0].coachimgpath); */
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						 /*  console.log('=='+data.data); */
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'messageid', width:100, title: '留言编号 ',fixed:"left"}
						      ,{field:'messageboard', width:300,title: '留言内容'}
						      ,{field:'messageusername', width:100,title: '会员姓名'}					
						      ,{fixed: 'right', width:150,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;							
								    if(bb.event === 'delete'){
								    	layer.confirm('你确定要删除该评论吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.messageid;
								    			$.post("http://localhost:8080/Manage/jsp/deleteMessage",{"messageid":aa},function(obj){								    				
								    					window.location.href = 'adcontrolmessage.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }  
								    if(bb.event === 'modify'){
								    	layer.confirm('你确定要编辑该教练信息吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.messageid;
								    			$.post("http://localhost:8080/Manage/jsp/modifymessage",{"messageid":aa},function(obj){	
								    				window.location.href = 'modifymessage.jsp';
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