<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="../layui/jquery.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../layui/index-student.js"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
</head>
<body>
	<div id="stuid" style="display: none;">${stuId }</div>
	<div id="stuname" style="display: none;">${stuName }</div>
	<div style="margin: 0 auto; height: 100%;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 32px;">
			<legend>查询题目</legend>
		</fieldset>
	</div>
	<div style="margin: 0 auto; width: 600px; height: 100px">
		<div class="img" id="result" name="result" style="color: red;">点击查询选题结果</div>
	</div>
	<div style="margin: 0 auto; width: 600px; height: 400px">
		<table id="tab" class="layui-table" lay-filter="demo"></table>
	</div>

	</div>
	<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">选择</a>
		</script>
	<script type="text/javascript">
			var aa= $('#aa', parent.document);
			layui.use('table', function(){
				  var table = layui.table;
				  var bb=JSON.parse(aa.text());
				  bb["data"]=bb.topicInfos;
				 table.render({
				    elem: '#tab'
				    ,data:bb.data
				    ,cols: [[
				      {field:'topic', width:100, title: '题目',fixed:"left"}
				      ,{field:'yaoqiu', width:100, title: '要求'}
				      ,{field:'number', width:100, title: '人数'}
				      ,{field:'teacher', width:100, title: '出题教师'}
				      ,{fixed: 'right', width:193, align:'center', toolbar: '#barDemo'}
				    ]]
				  });
				 table.on('tool(demo)', function(bb){
					    var data = bb.data;
					    console.log(data);
					    if(bb.event === 'detail'){
					    	layui.use('layer', function(bb){
					    	 var layer = layui.layer;
					    	 var content="<div style='margin-top:20px; margin-left:30px;'><ul class='layui-timeline'><li class='layui-timeline-item'><i class='layui-icon layui-timeline-axis'></i><div class='layui-timeline-content layui-text'><div class='layui-timeline-title'>题目："+data.topic+"</div></div></li><li class='layui-timeline-item'><i class='layui-icon layui-timeline-axis'></i><div class='layui-timeline-content layui-text'><div class='layui-timeline-title'>要求："+data.yaoqiu+"</div></div></li><li class='layui-timeline-item'><i class='layui-icon layui-timeline-axis'></i><div class='layui-timeline-content layui-text'><div class='layui-timeline-title'>人数："+data.number+"</div></div></li><li class='layui-timeline-item'><i class='layui-icon layui-timeline-axis'></i><div class='layui-timeline-content layui-text'><div class='layui-timeline-title'>出题教师："+data.teacher+"</div></div></li></ul></div>";
					    	 layer.open({
					    		  type: 1,
					    		  skin: 'layui-layer-rim', //加上边框
					    		  area: ['420px', '300px'], //宽高
					    		  content: content
					    		});
					    	});
					    }  else if(bb.event === 'edit'){
					    	layer.confirm('你确定要选择这道题吗？', {
					    		  btn: ['确定','取消'] //按钮
					    		}, function(){
					    			//写请求
					    			var topic=data.topic;
					    			var stuId=$("#stuid").text();
					    			var stuName=$("#stuname").text();
					    			var teaName=data.teacher;
					    			var number=data.number;
					    			$.post("http://localhost:8080/liu/stu/saveSelectTopic",{"topic":topic,"stuId":stuId,"stuName":stuName,"teaName":teaName,"number":number},function(obj){
					    				var str1=(obj.topic).substring(0,1);
					    				var str2=(obj.topic).substring(1);
					    				console.log(str1);
					    				if(str1 != "a"){
					    					layer.msg('保存'+str2+'成功', {icon: 1});
					    				}else if(str1 == "a"){
					    					layer.msg('你已经保存过'+str2+'题目', {icon: 1});
					    				}
					    			});
					    		}, function(){
					    		  layer.msg('已取消', {
					    		    time: 1000
					    		  });
					    		});
					    }
					});
				});
		</script>
</body>
<script type="text/javascript">
	 	document.getElementById("result").onclick=selectResult; 
	 	function selectResult(){
	 		var stuId=$("#stuid").text();
	 		$.post('http://localhost:8080/liu/stu/selectResult',{'stuId':stuId},function(aa){
	 			if(aa.topic == null || aa.topic == ""){
	 				document.getElementById('result').innerHTML='没有选题';
	 			} else {
	 				document.getElementById('result').innerHTML='题目为：'+aa.topic+'、指导教师：'+aa.teaName;
	 			}
	 			
			})
	 	}
	</script>
</html>
