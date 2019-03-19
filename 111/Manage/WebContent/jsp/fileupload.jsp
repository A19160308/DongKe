<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>文件上传</title>
<style type="text/css">

</style>
</head>
<body>
<div align="center">
<%--   <%@ include file="listfiles.jsp"%>  --%>
    <div align="center" >               
          <script>
             function x(form)
             {
                if(form.file1.value == ""||form.file2.value == "")
                {
                   alert("输入不能为空");
                   return false;
                }
                return true;
             }
         </script>   
             <form action="${pageContext.request.contextPath}/UploadHandleServlet" enctype="multipart/form-data" method="post" onsubmit="return x(this)">
           <br/><br/>    <h2>请您上传文件和图片！</h2>
             <br/><br/>
          	 
                              上传大图片：<input type="file" name="big_file" ><br/><br/> 
                              上传小图片1：<input type="file" name="file1" ><br/><br/> 
         	上传小图片2：<input type="file" name="file2" ><br/><br/>  
         	 上传小图片3：<input type="file" name="file3" ><br/><br/>   
         	  上传文件(图注)：<input type="file" name="note_file" ><br/><br/>           
                 <input type="submit" value="提交" id="btn1" onclick="checkform()">    
             </form>
    </div> 
</div> 
</body>
</html>