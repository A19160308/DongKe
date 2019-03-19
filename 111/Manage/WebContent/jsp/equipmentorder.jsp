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
	creatTab();
})
</script>

<script type="text/javascript">
function ifLogin() {	
	 if(null=='${username }'||""=='${username }'){
		alert("未检测到会员登陆，请先登录");
		window.location.href="${pageContext.request.contextPath}/jsp/userslogin.jsp"
	}else{
		/* alert("当前店长"+"    "+"${adname}"); */
		/* window.location.href="${pageContext.request.contextPath}/jsp/adcontrolusers.jsp" */
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
			<legend>健身器材预定</legend>
		</fieldset>
		<div class="layui-fluid">

			<div style="margin: 0 auto;">

				<div style="margin: 0 415px; width: 802px;">
					<table id="tab" class="layui-table" lay-filter="demo"></table>
				</div>
			</div>
			<script type="text/html" id="barDemo">
   
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">预定</a>


	</script>
			<script type="text/javascript">
			function creatTab(){//查询题目选择	
				$.post('${pageContext.request.contextPath}/jsp/getAllEp',function(data){
					/* console.log('--'+data.dataList[0].coachimgpath); */
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'epid', width:150, title: '器材编号 ',fixed:"left"}
						      ,{field:'epname', width:150, title: '器材名称'}
						      ,{field:'epprice', width:150, title: '价格/小时'}
						      ,{field:'epimgpath', width:150, title: '适用项目'}
						      ,{field:'sign', width:100, title: '标志'}
						      ,{fixed: 'right', width:100,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;
								    if(bb.event === 'delete'){
								    	layer.confirm('你确定要预定该器械吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.epid;
								    			$.post("http://localhost:8080/Manage/jsp/deleteEquipment",{"epid":aa},function(obj){								    				
								    					window.location.href = '${pageContext.request.contextPath}/jsp/equipmentorder.jsp';
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
</html>