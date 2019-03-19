<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <style>
        .table-b table td {
            border: 1px solid #F00
        }
        /* css注释：只对table td标签设置红色边框样式 */
    </style>
    <head>
        <script src="./js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>答题界面！！</title>
    </head>
    <body>
<div  style="background-color:yellow;height:80px;"><font size="10" style="width:50%; margin-left:400px;">植物学考试</font>
<font size="5" align="right">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;当前考生：${stu_name}</font></div>
        <br>
        <br>
        <br>
        <br>
        <br>       
            <table align="center" border="1" bgcolor="#FFFFFF">
                <tr>
                    <td>答案详解</td>
                    <td>展示图片</td>
                    <td>进行答题</td>

                </tr> 
                <tbody id="listTbody"></tbody>
            </table>
        <p class="paging" align="center">
            <a href="http://localhost:8080/Manage/Test_ListDemoServlet?page=${paging.indexpage-1}">&lt;&lt; 首页 </a>
            <a href="http://localhost:8080/Manage/Test_ListDemoServlet?page=${paging.page-1 }">    &lt; 上一页 </a>
            <strong>第${paging.page+1}页/共${paging.pagenumber}页</strong>
            <a href="http://localhost:8080/Manage/Test_ListDemoServlet?page=${paging.page+1}">下一页 &gt;</a>
            <a href="http://localhost:8080/Manage/Test_ListDemoServlet?page=${paging.pagenumber-1}">末页 &gt;&gt;</a>
            <button id="jump" name="jump" onclick="jumpDemo()">返回首页？查看成绩 &gt;&gt;</button>
        </p>
        <script type="text/javascript">
        function jumpDemo(){ 
            $.ajax({
                url: "http://localhost:8080/Manage/plant/jumpPage",
                type: "post",
                success: function(data) {
                	if(data.status==1){
                		window.location.href="http://localhost:8080/Manage/jsp/beginAnswer.jsp"
                	}else{
                		alert("答题未结束，请您继续作答！");               		
                	}
                }
            })
        }
        </script>
    </body>
    <script>
        $(function() {
            display();
            function display() {
                var page = ${paging.page};
                if (page == null) {
                    page = 0;
                }               
                $.ajax({
                    url: "http://localhost:8080/Manage/plant/getAllplant",
                    type: "post",
                    dataType: 'json',
                    data: {
                        page: page
                    },
                    success: function(data) {
                        var htmlStr = "";
                        $.each(data.dataList,
                        		function(index, obj) {
                        	//console.log(obj.img_big);
                            var index_id = obj.plant_id;
                            htmlStr += "<tr height='250'>";
                            htmlStr += "<td width='200'>" + obj.big_note + "</td>";
                            htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,240,240);'</td>";
                            htmlStr += "<td width='150'><input type='text' name='xpx' id='answer' placeholder='请填写该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew("+index_id+")'>提示</button><br><br>&nbsp&nbsp&nbsp";
                            //var answer=$("#answer").val(); 
                            htmlStr += "<button style='width:80px;height:25px' onclick='compare(" + index_id + ",1," + index + ")'>提交</button><br><br>&nbsp&nbsp&nbsp得分：</td>";
                            htmlStr += "</tr>";
                        })
                        $("#listTbody").html(htmlStr);
                    }
                })
            }
        })
    </script>
    <script type="text/javascript">
        function DrawImage(ImgD, FitWidth, FitHeight) {
            var image = new Image();
            image.src = ImgD.src;
            if (image.width > 0 && image.height > 0) {
                if (image.width / image.height >= FitWidth / FitHeight) {
                    if (image.width > FitWidth) {
                        ImgD.width = FitWidth;
                        ImgD.height = (image.height * FitWidth) / image.width;
                    } else {
                        ImgD.width = image.width;
                        ImgD.height = image.height;
                    }
                } else {
                    if (image.height > FitHeight) {
                        ImgD.height = FitHeight;
                        ImgD.width = (image.width * FitHeight) / image.height;
                    } else {
                        ImgD.width = image.width;
                        ImgD.height = image.height;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
        function compare(id, flag, index) {
            //jqurey 查找器  index就是从table中 获取第几行的元素  比如说第index的元素  按钮啦 text啦   所以需要传递index
        	var answer = $("#listTbody tr:eq(" + index + ")").find("input[name=xpx]").val();
           if(answer==""){
        	   alert("空答案！请作答");
           }else{
        	   var page_a=${paging.page};
               $.ajax({
                   url: "http://localhost:8080/Manage/plant/getCompare",
                   type: "post",
                   dataType: 'json',
                   data: {
                       id: id,
                       answer: answer,
                       flag: flag,
                       page:page_a
                   },
                   success: function(data) {
                       var status = data.status;                      
                           var htmlStr = "";
                           $.each(data.dataList, function(index, obj) {
                           	var id=obj.plant_id;
                           	//用来判断是否满足输出条件    plant_id一样 flag就可以跳出
                           	var flag=0;
                              var a=data.size;
                              var i=0
                              var score_temp="";
                              for(i=0;i<a;i++){
                           	  if(id==data.record[i].plant_id){
                           		  //加上成绩输出
                           		  score_temp=data.record[i].score_text;
                           		  if(data.record[i].record_flag==2){
                           			  flag=1;
                               		  break;  
                           		  }                   		  
                           	  }
                              }             
                           	//答案正确
                               if(flag==1){
                               	var index_id = obj.plant_id;
                                   htmlStr += "<tr height='250'>";
                                   htmlStr += "<td width='200'>" + obj.big_note + "</td>";
                                   htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,240,240);'><img src='/file/" + obj.img_s1 + "' onload='javascript:DrawImage(this,80,240);'><img src='/file/" + obj.img_s2 + "' onload='javascript:DrawImage(this,80,240);'><img src='/file/" + obj.img_s3 + "' onload='javascript:DrawImage(this,80,240);'></td>";
                                   htmlStr += "<td width='150'><input type='text' id='answer' name='xpx' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew(" + index_id + ")'>提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare(" + index_id + ",1," + index + ")'>提交</button><br><br>&nbsp&nbsp&nbsp得分：" + score_temp + "&nbsp</td>";
                                   htmlStr += "</tr>";                            	
   					   }else{
                               	//答案错误
                               	 var index_id = obj.plant_id;
                                    htmlStr += "<tr height='250'>";
                                    htmlStr += "<td width='200'>" + obj.big_note + "</td>";
                                    htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,150,240);'></td>";
                                    htmlStr += "<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px'onclick='displayNew(" + index_id + ")'>提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare(" + index_id + ",1," + index + ")' >提交</button><br><br>&nbsp&nbsp&nbsp得分：" + score_temp + "&nbsp</td>";
                                    htmlStr += "</tr>";
                               }
                           })
                           $("#listTbody").html(htmlStr);                                 
                   }
               })
           }
        }
        function displayNew(id) {
        	var page_a=${paging.page};
            $.ajax({
                url: "http://localhost:8080/Manage/plant/getAllNewplant",
                type: "post",
                dataType: 'json',
                data: {
                    id: id,
                    page:page_a
                },
                success: function(data) {              	
                    var flag = "2";
                    var htmlStr = "";
                    $.each(data.dataList, function(index, obj) {    
                    	var id=obj.plant_id;
                    	//用来判断是否满足输出条件    plant_id一样 flag就可以跳出
                    	var flag=0;
                       var a=data.size;
                       var i=0
                       var score_temp=0;
                       for(i=0;i<a;i++){
                    	  if(id==data.record[i].plant_id){
                    		  //加上成绩输出
                    		  score_temp=data.record[i].score_text;
                    		  if(data.record[i].record_flag==2){
                    			  flag=1;
                        		  break;  
                    		  }                   		  
                    	  }
                       }                     
                       if (flag==1) {
                           var index_id = obj.plant_id;
                           htmlStr += "<tr height='250'>";
                           htmlStr += "<td width='200'>" + obj.big_note + "</td>";
                           htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,150,240);'><img src='/file/" + obj.img_s1 + "' onload='javascript:DrawImage(this,80,240);'><img src='/file/" + obj.img_s2 + "' onload='javascript:DrawImage(this,80,240);'><img src='/file/" + obj.img_s3 + "' onload='javascript:DrawImage(this,80,240);'></td>";
                           htmlStr += "<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='displayNew(" + index_id + ")', >提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare(" + index_id + ",2," + index + ")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+score_temp+"</td>";
                           htmlStr += "</tr>";
                       } else {
                           var index_id = obj.plant_id;
                           htmlStr += "<tr height='250'>";
                           htmlStr += "<td width='200'>" + obj.big_note + "</td>";
                           htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,150,240);'</td>";
                           htmlStr += "<td width='150'><input type='text' name='xpx' id='answer' placeholder='请输入该植物名称！'/><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='displayNew(" + index_id + ")', >提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare(" + index_id + ",1," + index + ")'>提交</button><br><br>&nbsp&nbsp&nbsp得分："+score_temp+"</td>";
                           htmlStr += "</tr>";
                       }
                    })
                    $("#listTbody").html(htmlStr);
                }
            })
        }
       
    </script>

    </html>