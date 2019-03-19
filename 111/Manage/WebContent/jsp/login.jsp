<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css"
	tppabs="css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="../js/jquery.js"></script>
<script src="../js/verificationNumbers.js"
	tppabs="js/verificationNumbers.js"></script>
<script src="../js/Particleground.js" tppabs="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	 		var username=$("#username").val();
			var password=$("#password").val();
			//alert(validate())
			if(validate()==false){
				alert("验证码错误")
			}else{
				 $.ajax({
						url:"${pageContext.request.contextPath}/jsp/user/login",
						type:"post",
						data:{
							username:username,
							password:$("#password").val()
						},
						success:function(jsonObject){
							 if(jsonObject.errorMessage=="ok"){
								window.location.href = document.referrer;
							}else{
								alert(jsonObject.errorMessage);
							} 
						},
						error:function(){
							alert("系统繁忙，请稍后重试");
						} 
						});
			}
			//alert(username)
			//alert("xxx");
			//if(validate()){
	 	
			//}
  });
});
</script>
</head>
<body>

	<%-- <%@ include file="head.jsp" %> --%>
	<dl class="admin_login">
		<dt>
			<strong>会员登录</strong> <em><a
				href="${ pageContext.request.contextPath }/index.html">返回首页</a></em>
		</dt>
		<dd class="user_icon">
			<input type="text" placeholder="账号" class="login_txtbx" id="username" />
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" class="login_txtbx"
				id="password" />
		</dd>
		<dd></dd>
	</dl>
</body>
</html>
