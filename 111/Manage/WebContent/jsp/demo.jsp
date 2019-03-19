<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
  
 
  %>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>query</title>
<link href="js/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
<script src="js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
function listAllUsers(){
	window.location = "../findAllUsers";
}
function queryAllusers(){
	var said=$("#yyy").val();
	$.ajax({
		type : 'post',
		url : '../findAllUser',       //这里使用绝对路径，交给值为 talkMessage的那个控制器处理，           
		dataType:'json',
		data : {
			
		},
		 success : function(data) {
	     var drder=data.list;
	     var htmlTable="";
	    	 if(list!=null || list.length>0){
	    		 for(var i=0;i<list.length;i++){
	    		   //渲染表格
		                htmlTable+="<tr>";
					htmlTable+="<td><b>";
					htmlTable+=list[i].username;
					htmlTable+="</b></td>";
					htmlTable+="<td><b>";
					htmlTable+=list[i].userpasswd;
					htmlTable+="</b></td>";
		                htmlTable+="</tr>" 
	    		 }
	    		 $('#Aslist').find('tbody').html(htmlTable);    //找到你想要刷新的位置，然后把返回的数据塞进去
	    	 }else{
	    		 $('#Aslist').find('tbody').html("<tr><td colspan=\"2\"  align=\"center\">抱歉！没有找到数据！！！</td></tr>");
	    	 } 	 
		 } 			
	      });
}
</script>
<body>
	<button onclick="queryAllep()">查询所有用户</button>
	<!-- 表格 -->
	<div align="center">
		<table class="table table-hover" id="Aslist"
			style="margin-left: 60px; width: 1000px; margin-top: 10px; font-size: 12px;">
			<thead>
				<tr>
					<th><b>器材实体图</b></th>
					<th><b>器材编号</b></th>
					<th><b>器材名称</b></th>
					<th><b>器材价格</b></th>

				</tr>
			</thead>
			<tbody class="listbody">
			</tbody>
		</table>
	</div>
	<!-- 表格结束 -->
</body>
</html>