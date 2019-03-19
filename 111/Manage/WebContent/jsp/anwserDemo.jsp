<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style> 
.table-b table td{border:1px solid #F00} 
/* css注释：只对table td标签设置红色边框样式 */ 
</style> 
<head>
<script
	src="../js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答题界面！！</title>
<script type="text/javascript">

function display() {	
	$.ajax({
		url:"http://localhost:8080/Manage/plant/getAllplant",
		type:"post",
		success:function(data){
			var htmlStr="";
			$.each(data.dataList,function(index,obj){				
				var index_id=obj.plant_id;
				htmlStr+="<tr height='250'>"; 
				htmlStr+="<td width='200'>"+obj.big_note+"</td>";
				htmlStr+="<td width='500'><img src='/file/"+obj.img_big+"' onload='javascript:DrawImage(this,240,240);'</td>";					
				htmlStr+="<td width='150'><input type='text' name='xpx' id='answer' placeholder='请填写该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew("+index_id+")'>提示</button><br><br>&nbsp&nbsp&nbsp";
				//var answer=$("#answer").val(); 
				htmlStr+="<button style='width:80px;height:25px' onclick='compare("+index_id+",1,"+index+")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+obj.plant_text+"</td>";
				htmlStr+="</tr>";
			}) 
			$("#listTbody").html(htmlStr);
		}
	})		
}
$(function(){
	display();
	
})
</script>
</head> 
<body>
 <script type="text/javascript">
function DrawImage(ImgD,FitWidth,FitHeight){  
	var image=new Image();   
	image.src=ImgD.src;    
	if(image.width>0 && image.height>0){    
		if(image.width/image.height>= FitWidth/FitHeight){  
			if(image.width>FitWidth){
				ImgD.width=FitWidth;
				ImgD.height=(image.height*FitWidth)/image.width;    
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
				}
			}else{ 
				if(image.height>FitHeight){
					ImgD.height=FitHeight; 
					ImgD.width=(image.width*FitHeight)/image.height; 
				}else{
					ImgD.width=image.width;      
					ImgD.height=image.height;
					}
				}
			}
}	
</script> 
<!-- <div class="table-b"> 
<table width="1000"  border="0" cellspacing="20" cellpadding="0"> 
<tr> 
<td >站名</td> 
<td width="181">网址</td> 
<td width="112">说明</td>
</tr> 
<tr> 
<td width="185" height="185"><img src="/file/水仙_(3).jpg" alt="显示一下试试" onload="javascript:DrawImage(this,100,100);" />
<img src="/file/水仙_(2).jpg" alt="显示一下试试" onload="javascript:DrawImage(this,100,100);" /></td> 
<td>www.divcss5.com</td>  
<td>CSS学习</td> 
</tr> 
<tr> 
<td>CSS5</td> 
<td>www.css5.com.cn</td> 
<td>CSS切图</td> 
</tr> 
</table>  --> 
<script type="text/javascript">	 
	function compare(id,flag,index){
		var answer=$("#listTbody tr:eq("+index+")").find("input[name=xpx]").val();
		//var answer=$("listTbody tr:eq(index)").find("td").eq(2).text();
		//var answer=$("#answer").val(); 
		/* alert("ceshiyixia ");
		alert(index);		
		//var answer=$("table tr:eq("+index+") td:eq("+index+")").text();
		alert(id);
		alert(flag);
		alert(answer); */
		$.ajax({
			url:"http://localhost:8080/Manage/plant/getCompare",
			type:"post",
			dataType:'json',
			data:{
				id:id,
				answer:answer,
				flag:flag			
			},	
			success:function(data){				
				var status=data.status;
				alert(status);
				if(status==1){
					//答案正确
					var htmlStr="";
					$.each(data.dataList,function(index,obj){
						var index_id=obj.plant_id;						
						htmlStr+="<tr height='250'>";
						htmlStr+="<td width='200'>"+obj.big_note+"</td>";
						htmlStr+="<td width='500'><img src='/file/"+obj.img_big+"' onload='javascript:DrawImage(this,240,240);'</td>";					
						htmlStr+="<td width='150'><input type='text' id='answer' name='xpx' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew("+index_id+")'>提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare("+index_id+",1,"+index+")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+obj.plant_text+"&nbsp</td>";
						htmlStr+="</tr>";
					}) 
					$("#listTbody").html(htmlStr);	    	           
	    		 }else{
	    			 var htmlStr="";
						$.each(data.dataList,function(index,obj){
							var index_id=obj.plant_id;
							htmlStr+="<tr height='250'>";
							htmlStr+="<td width='200'>"+obj.big_note+"</td>";
							htmlStr+="<td width='500'><img src='/file/"+obj.img_big+"' onload='javascript:DrawImage(this,240,240);'</td>";					
							htmlStr+="<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew("+index_id+")'>提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare("+index_id+",1,"+index+")' >提交</button><br><br>&nbsp&nbsp&nbsp得分："+obj.plant_text+"&nbsp</td>";
							htmlStr+="</tr>";
						}) 
						$("#listTbody").html(htmlStr);	
	    		 }
				
			}
		})
	}
	
	function displayNew(id) {
		$.ajax({
			url:"http://localhost:8080/Manage/plant/getAllNewplant",
			type:"post",
			dataType:'json',
			data:{
				id:id			
			},
			success:function(data){	
				var flag="2";
				var htmlStr="";
				$.each(data.dataList,function(index,obj){	
					if(obj.plant_flag==2){
						var index_id=obj.plant_id;
						htmlStr+="<tr height='250'>";
						htmlStr+="<td width='200'>"+obj.big_note+"</td>";
						htmlStr+="<td width='500'><img src='/file/"+obj.img_big+"' onload='javascript:DrawImage(this,150,240);'><img src='/file/"+obj.img_s1+"' onload='javascript:DrawImage(this,80,240);'><img src='/file/"+obj.img_s2+"' onload='javascript:DrawImage(this,80,240);'><img src='/file/"+obj.img_s3+"' onload='javascript:DrawImage(this,80,240);'></td>";					
						htmlStr+="<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='displayNew("+index_id+")', >提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare("+index_id+",2,"+index+")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+obj.plant_text+"</td>";
						htmlStr+="</tr>";
					}else{
						var index_id=obj.plant_id;
						htmlStr+="<tr height='250'>";
						htmlStr+="<td width='200'>"+obj.big_note+"</td>";
						htmlStr+="<td width='500'><img src='/file/"+obj.img_big+"' onload='javascript:DrawImage(this,150,240);'</td>";					
						htmlStr+="<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='displayNew("+index_id+")', >提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare("+index_id+",2,"+index+")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+obj.plant_text+"</td>";
						htmlStr+="</tr>";
					}
				}) 
				$("#listTbody").html(htmlStr);
			}
		})		
	}
	/*  function writemessage(){
	 		var adname=$("#adname").val(); 
			   $.ajax({					
						type:"post",
						url:"${pageContext.request.contextPath}/jsp/writeMessage",
						dataType:'json',
						data:{
							messageboard:adname,
						},	
			    		 success : function(data) {
			    			 window.location.href="${pageContext.request.contextPath}/jsp/messageorder.jsp"
			    				 display();
			    		}			    		
						});  
} */
</script>
<br>
<br>           
<br>
<br>
<br>

<!-- 
		<div style="margin-left: 500px">
			<dl class="admin_login">
				<dt>
					<strong>留言区</strong>
				</dt>
				<dd class="user_icon">
					<textarea rows="6" cols="50" id="adname"></textarea>
				</dd>
				<dd>
					<button onclick="writemessage()">提交</button>
				</dd>
			</dl>			
		</div> -->
		<table align="center" border="1" bgcolor="#FFFFFF"  >
			<tr>
				<td>答案详解</td>
				<td>展示图片</td>
				<td>进行答题</td>

			</tr>
			<tbody id="listTbody"></tbody>
		</table>
 



</body>
</html>