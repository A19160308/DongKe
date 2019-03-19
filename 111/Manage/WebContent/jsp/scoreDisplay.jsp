<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
pre {
white-space: pre-wrap;       /* css-3 */
white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
white-space: -pre-wrap;      /* Opera 4-6 */
white-space: -o-pre-wrap;    /* Opera 7 */
word-wrap: break-word;       /* Internet Explorer 5.5+ */
word-break:break-all;
overflow:hidden;
}
</style>
<title>成绩显示！</title>
<div  style="background-color:yellow;height:80px;"><font size="10" style="width:50%; margin-left:400px;">植物学考试</font>
<font size="5" align="right">&emsp;&emsp;&emsp;当前考生：${stu_name} </font><font size="5" align="right">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;总分：${score}</font></div>






</head>
<body>
<br>
<font align="center">------------------------------------------------------------------------------------出错题目浏览&gt;&gt;</font>
<br><br>
<button id="error"  onclick="errorDisplay()">出错题目浏览</button>
<table align="center" border="1" bgcolor="#FFFFFF">
             
                <tbody id="listTbody"></tbody>
            </table>

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
function errorDisplay() {
    $.ajax({
        url: "http://localhost:8080/Manage/plant/errorDisplay",
        type: "post",
        success: function(data) {        	
            var htmlStr = "";
            $.each(data.dataList,function(index, obj) {            	
            	var id=obj.plant_id;
            	//用来判断是否满足输出条件    plant_id一样 flag就可以跳出 
            	var flag=0;
               var a=data.size;
               var i=0
               for(i=0;i<a;i++){  
            	   if(id==data.record[i].plant_id){
            		  if(data.record[i].final_flag==2){
            			  flag=1;
                		  break; 
            		  }                   		  
            	  }
               } 
                if(flag==1){                	
                    htmlStr += "<tr height='100'>";
                    htmlStr += "<td width='300'><pre>F:\\Javawebworkspace-v2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Manage\\tempfolder\\"+obj.big_note+"</pre></td>";
                    htmlStr += "<td width='500'><img src='/file/" + obj.img_big + "' onload='javascript:DrawImage(this,100,200);'><img src='/file/" + obj.img_s1 + "' onload='javascript:DrawImage(this,100,200);'><img src='/file/" + obj.img_s2 + "' onload='javascript:DrawImage(this,100,200);'><img src='/file/" + obj.img_s3 + "' onload='javascript:DrawImage(this,100,200);'></td>";
                    htmlStr += "</tr>";
                }
            })
            $("#listTbody").html(htmlStr);
        }
    })
}
</script>
</body>
</html>