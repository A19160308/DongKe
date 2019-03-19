<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>Download2</title>
    <style type="text/css">
        a.down{
            color: #FFF;
            width: 90px;
            height: 30px;
            display: inline-block;
            line-height: 30px;
            background-color: #00b4ef;
            text-decoration: none;
            border-radius: 5px;
        }
        a.down:hover{
            opacity:0.5;
        }
       
        .downbox{
            border:1px solid #ddd;
            padding: 10px;
            width: 156px;
            height:80px;
            float:left;
            box-shadow: 0 1px 3px rgba(41, 41, 41, 0.95);
            display: inline-block;
            margin:10px;
        }
        body{background-repeat:no-repeat;background-size:cover;}   
        div{font-family:'宋体'; font-size:15px;font-weight:bold;}
    </style>
</head>
<body background="images/21.jpg" width="100%" height="100%">

<%
 
    String path = request.getServletContext().getRealPath("/tempfolder").replaceAll("%20", " ");
    File file = new File(path);
    File[] files = file.listFiles();
    for (File f:files) {      
            out.print("<div class=\"downbox\">\n" +
                    "    <center>\n" +
                           f.getName() +
                    "    </center>\n" +
                    "    <br>\n" +                   
                    "</div>");        
    }
%>
</body>
</html>