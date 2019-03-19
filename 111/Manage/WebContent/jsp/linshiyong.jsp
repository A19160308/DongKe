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
				<li class="layui-nav-item"
					style="text-align: right; margin-right: 400px;"><a href="">技术支持</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> '${adname }'
				</a></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a href="">店长登陆</a></li>
					<li class="layui-nav-item"><a href="first.jsp">会员管理</a></li>
					<li class="layui-nav-item"><a href="">健身教练管理</a></li>
					<li class="layui-nav-item"><a href="">健身器材管理</a></li>
					<li class="layui-nav-item"><a href="">留言管理</a></li>
				</ul>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="text-align: right; margin-right: 500px;">
			<legend>会员管理</legend>
		</fieldset>
		<div class="layui-fluid"></div>
		<script src="../layui/layui.js"></script>
		<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>



















<script type="text/javascript">
			function creatTab(){//查询题目选择
				
				$.post('${pageContext.request.contextPath}/jsp/getAllCoach',function(data){
					/* console.log('--'+data.dataList[0].coachimgpath); */
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						 /*  console.log('=='+data.data); */
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'coachid', width:150, title: '教练编号 ',fixed:"left"}
						      ,{field:'coachname', width:150, title: '教练姓名'}
						      ,{field:'coachimgpath', width:150, title: '主要负责项目'}
						      ,{field:'sign', width:150, title: '标志'}
						      ,{fixed: 'right', width:200,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;
								    if(bb.event === 'add'){
								    	layer.confirm('确定招募新教练吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.coachid;
								    			$.post("http://localhost:8080/Manage/jsp/addcoach",{},function(obj){								    				
								    				window.location.href = 'addcoach.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }
				
								    if(bb.event === 'delete'){
								    	layer.confirm('你确定要解雇该教练吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.coachid;
								    			$.post("http://localhost:8080/Manage/jsp/adDeleteCoach",{"coachid":aa},function(obj){								    				
								    					window.location.href = 'adcontrolcoach.jsp';
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
								    			var aa = data.coachid;
								    			$.post("http://localhost:8080/Manage/jsp/modifyCoach",{"coachid":aa},function(obj){	
								    				window.location.href = 'modifycoach.jsp';
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


















<script type="text/javascript">
function insertcoach(){
	 		var coachname=$("#coachname").val();
			var coachprice=$("#coachprice").val();
			var coachimgpath=$("#coachimgpath").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/insertCoach",
						dataType:'json',
						data:{
							coachname:coachname,
							coachprice:coachprice,
							coachimgpath:coachimgpath
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	 
			    			   alert("新增成功");			    			  
			    			   var href = 'adcontrolcoach.jsp';
			    			   window.location.href = href ;			    	           
			    		 }else if(status=="账号已经被注册"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert("用户已经被注册");
			    		 }		    		 
			    		}  
						}); 
}
</script>



















<script type="text/javascript">
$(function(){
	$("#coachname").val("${coachname}");
	$("#coachprice").val("${coachprice}");
	$("#coachimgpath").val("${coachimgpath}");
})
 

</script>
</head>



<script type="text/javascript">



function insertcoach(){
	
	 		var coachname=$("#coachname").val();
			var coachprice=$("#coachprice").val();
			var coachimgpath=$("#coachimgpath").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/insertcoach",
						dataType:'json',
						data:{
							coachname:coachname,
							coachprice:coachprice,
							coachimgpath:coachimgpath
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	 
			    			   alert("编辑成功");			    			  
			    			   var href = 'adcontrolcoach.jsp';
			    			   window.location.href = href ;			    	           
			    		 }else if(status=="账号已经被注册"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert("用户已经被注册");
			    		 }		    		 
			    		}  
						}); 
} 
</script>
















<script type="text/javascript">
			function creatTab(){//查询题目选择
				
				$.post('${pageContext.request.contextPath}/jsp/getAllEp',function(data){
					/* console.log('--'+data.dataList[0].coachimgpath); */
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						 /*   console.log('=='+data.data);  */
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'epid', width:150, title: '健身器材编号 ',fixed:"left"}
						      ,{field:'epname', width:150, title: '健身器材姓名'}
						      ,{field:'epimgpath', width:150, title: '支持项目'}
						      ,{field:'sign', width:150, title: '标志'}
						      ,{fixed: 'right', width:200,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;
								    if(bb.event === 'add'){
								    	layer.confirm('确定增加新器材吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.epid;
								    			$.post("http://localhost:8080/Manage/jsp/addep",{},function(obj){								    				
								    				window.location.href = 'addep.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }
				
								    if(bb.event === 'delete'){
								    	layer.confirm('你确定要下架该器材吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.epid;
								    			$.post("http://localhost:8080/Manage/jsp/adDeleteEp",{"epid":aa},function(obj){								    				
								    					window.location.href = 'adcontrolep.jsp';
								    			});
								    		}, function(){
								    		  layer.msg('已取消', {
								    		    time: 1000
								    		  });
								    		});
								    }  
								    if(bb.event === 'modify'){
								    	layer.confirm('你确定要编辑该器材信息吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.epid;
								    			$.post("http://localhost:8080/Manage/jsp/modifyEp",{"epid":aa},function(obj){	
								    				window.location.href = 'modifyep.jsp';
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





<script type="text/javascript">



function insertcoach(){
	
	 		var epname=$("#epname").val();
			var epprice=$("#epprice").val();
			var epimgpath=$("#epimgpath").val();
			  $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/insertep",
						dataType:'json',
						data:{
							epname:epname,
							epprice:epprice,
							epimgpath:epimgpath
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	 
			    			   alert("编辑成功");			    			  
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






<script type="text/javascript">

/* 登陆部分 */
 function login(){
	 		var adname=$("#adname").val();
			var password=$("#password").val();
			   $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/Adlogin",
						dataType:'json',
						data:{
							adname:adname,
							adpassword:password
						},	
			    		 success : function(data) {
			    			  var status=data.status;			    			
			    		     if(status=="登陆成功"){			    		    	 
			    			   alert(status);			    			  
			    			   var href = '${pageContext.request.contextPath}/index.jsp';
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
			    			   alert(status);			    			  
			    			   var href = '${pageContext.request.contextPath}/index.jsp';
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
							username:username,
							userpassword:password
						},						
			    		 success : function(data) {
			    			 var status=data.status;			    			
			    		     if(status=="注册成功"){			    		    	 
			    			   alert(status);			    			  
			    			   var href = '${pageContext.request.contextPath}/index.jsp';
		                       window.top.location.href = href;			    	           
			    		 }else if(status=="账号已经被注册"){			    			
			    			 //$("#Error").html("密码错误！");
			    			 alert(status);
			    		 }		    		 
			    		}  
						}); 
}
</script>



<script type="text/javascript">
			function creatTab(){//查询题目选择
				
				$.post('${pageContext.request.contextPath}/jsp/getAllCoach',function(data){
					console.log('--'+data.dataList[0].coachimgpath);
					data["data"]=data.dataList;
					layui.use('table', function(){
						  var table = layui.table;
						  console.log('=='+data.data);
						 	table.render({
						    elem: '#tab'
						    ,data:data.data
						    ,cols: [[
						      {field:'coachid', width:150, title: '教练编号 ',fixed:"left"}
						      ,{field:'coachname', width:150, title: '教练姓名'}
						      ,{field:'coachprice', width:150, title: '教练价格/小时'}
						      ,{field:'coachimgpath', width:150, title: '教练负责项目' ,templet:"<div><img src='../"+data.data[0].coachimgpath+"' alt='图片加载失败'></div>"  }
						      ,{field:'sign', width:150, title: '标志'}
						      ,{fixed: 'right', width:150,title:'操作', align:'center', toolbar: '#barDemo'}
						    ]]
						 	  ,page: true 
						  }); 
						 	 table.on('tool(demo)', function(bb){
								    var data = bb.data;
								    if(bb.event === 'edit'){
								    	layer.confirm('你确定要选择这个教练吗？', {
								    		  btn: ['确定','取消'] //按钮
								    		}, function(){
								    			//写请求
								    			var aa = data.coachid;
								    			var name = data.coachname;
								    			$.post("http://localhost:8080/Manage/jsp/deleteCoach",{"coachid":aa},function(obj){
								    				
								    					
								    					window.location.href = 'coachorder.jsp';
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