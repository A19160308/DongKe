<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>还是要有希望</title>
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


<div id="content_right">
                        <br />
                        <br />
                        <br>
                        <form name="form1" action="Test_ListDemoServlet" method="post">
                            <table align="center" border="1" bgcolor="#FFFFFF" >                            
                                <tr class="table_header">
                                    <td valign="middle" align="left">
                                        答案详解
                                    </td>
                                    <td valign="middle" align="left">
                                        展示图片
                                    </td>
                                    <td valign="middle" align="left">
                                        答题窗口
                                    </td>                                 
                                </tr>                                      
                                <c:forEach items="${list}" var="list">                                                                       
                                <tr height='250'>
                                    <td width='200'>                                    
                                    ${list[0].plant_name}
                                    </td>
                                    <td width='500'>
                                    <img src="/file/${list[0].img_big}" onload="javascript:DrawImage(this,240,240);"/>                                        
                                    </td>
                                    <td width='150'>
                                        <input type="text" id="answer" name="xpx" placeholder="请输入该植物名称！"/><br>&nbsp&nbsp&nbsp<button style="width:80px;height:25px" onclick="displayNew(${list[0].plant_id})">提示</button><br><br>&nbsp&nbsp&nbsp<button style='width:80px;height:25px' onclick='compare(${list[0].plant_id},1,0)'>提交</button><br><br>&nbsp&nbsp&nbsp得分：${list[0].plant_score}&nbsp
                                    </td>                                  
                                </tr>                                
                                <tr height='250'>
                                    <td width='200'>
                                    		${list[1].plant_name}
                                    </td>
                                    <td width='500'>
                                        <img src="/file/${list[1].img_big}" onload="javascript:DrawImage(this,240,240);"/>
                                    </td>
                                    <td width='150'>
                                         ${list[1].plant_name}
                                    </td>                                  
                                </tr>      
                                <tr height='250'>
                                    <td width='200'>
                                    		${list[2].plant_name}
                                    </td>
                                    <td width='500'>
                                        <img src="/file/${list[2].img_big}" onload="javascript:DrawImage(this,240,240);"/>
                                    </td>
                                    <td width='150'>
                                         ${list[2].plant_name}
                                    </td>                                  
                                </tr>    
                                <tr height='250'>
                                    <td width='200'>
                                    		${list[3].plant_name}
                                    </td>
                                    <td width='500'>
                                         <img src="/file/${list[3].img_big}" onload="javascript:DrawImage(this,240,240);"/>
                                    </td>
                                    <td width='150'>
                                         ${list[3].plant_name}
                                    </td>                                  
                                </tr> 
                                <tr height='250'>
                                    <td width='200'>
                                    		${list[4].plant_name}
                                    </td>
                                    <td width='500'>
                                         <img src="/file/${list[4].img_big}" onload="javascript:DrawImage(this,240,240);"/>
                                    </td>
                                    <td width='150'>
                                         ${list[4].plant_name}
                                    </td>                                  
                                </tr>       
                                </c:forEach>
                              <!--  // <tr><input type="button" value="试试" name="ceshi"></tr> -->
                            </table>
                        </form>
                         <p align="right">
                            <input type="button" class="button" value="添加人员"
                                onclick="location='createStaff.jsp'" />
                            <input type="button" class="button" value="详细信息"
                                onClick="    document.forms[0].submit();" />
                            <input type="button" Class="button" value=" 删  除 "
                                onClick="go()" />
                        </p> 
                        
                        
                        
                        <p class="paging" align="center">
                            <a href="http://localhost:8080/Manage/Test_ListDemoServlet?page=${paging.indexpage-1}">&lt;&lt; 首页 </a>
                            <a href="Test_ListDemoServlet?page=${paging.page-1 }">    &lt; 上一页 </a>
                            <strong>第${paging.page+1}页/共${paging.pagenumber}页</strong>
                            <a href="Test_ListDemoServlet?page=${paging.page+1}">下一页 &gt;</a>
                            <a href="Test_ListDemoServlet?page=${paging.pagenumber-1}">末页 &gt;&gt;</a>
                        </p>
                        <br />
                        <br />
                    </div>
                </div>
            </div>

</body>
</html>