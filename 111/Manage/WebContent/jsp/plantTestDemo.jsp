<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答题界面</title>
</head>
<body>
		这里会有主图  会有提示图  还有一些注释什么的  从数据库里面查取出来~~~！！！！
		<button type="button" id="test"  onclick="window.location.href='http://localhost:8080/Manage/jsp/courseSelect.jsp'">提交答案</button>
		<button type="button" id="back"  onclick="window.location.href='http://localhost:8080/Manage/jsp/courseSelect.jsp'">帮助</button>
		<textarea rows="6" cols="50" id="answer">写答案！</textarea>
		
</body>
</html>