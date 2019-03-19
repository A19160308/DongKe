<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--viewport：根据打开的方式（手机 平板），来决定显示的样式，width=device-width：设置网页的宽度，nitial-scale=1：表示网页缩放的倍数-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"  />

<!-- 兼容h5 -->
<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

<title>首页 </title>

<!-- 引入样式以及框架文件 -->
<link href="js/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />  
<script src="js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>  
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>  

<!-- 导航栏、底部所用样式以及框架文件 -->
<link href="css/indexP.css" rel="stylesheet" type="text/css" />
<link href="css/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/foot.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jQuery-other/jquery.min.js"></script>
<script type="text/javascript"  src="js/jQuery-other/nav.js"></script>

</head>






<body>
<!-- 导航栏 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div>
	<div class="navi_body">
		<div class="navi_head">
			<div style="width:50%; margin-left:350px; margin-right:auto;">
				<span>
					<p class="navi_title"><a href="index.jsp">首页</a></p>
										
				</span>
				<span>
					<p class="navi_title"><a href="jsp/userslogin.jsp">会员入口</a></p>
					<p class="navi_title"><a href="jsp/userslogin.jsp">会员登陆注册</a></p>
					<p class="navi_title"><a href="jsp/coachorder.jsp">健身教练预定</a></p>
					<p class="navi_title"><a href="jsp/equipmentorder.jsp">健身器材预定</a></p>
					<p class="navi_title"><a href="jsp/messageorder.jsp">留言</a></p>
					<p class="navi_title"><a href="jsp/shoppingcarorder.jsp">订单管理</a></p>
				</span>
				<span>
					<p class="navi_title"><a href="jsp/adlogin.jsp">管理员入口</a></p>
					<p class="navi_title"><a href="jsp/adcontrolcoach.jsp">健身教练管理</a></p>
					<p class="navi_title"><a href="jsp/adcontrolep.jsp">健身器材管理</a></p>
					<p class="navi_title"><a href="jsp/adcontrolmessage.jsp">留言管理</a></p>
					<p class="navi_title"><a href="jsp/adcontrolusers.jsp">会员管理</a></p>
				</span>
				<span>
					<p class="navi_title"><a href="jsp/adlogin.jsp">联系我们</a></p>
					<p class="navi_title"><a href="jsp/adcontrolcoach.jsp">联系我们 </a></p>
					<p class="navi_title"><a href="jsp/adcontrolep.jsp">技术支持</a></p>
				</span>			
			</div>
		</div>
	</div>
</div>
</div>

<!-- 导航栏结束 -->
<!-- 轮播组件 --> 
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  
  <!-- 小圆点 -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
   
  </ol>

  <!-- 轮播内容 -->
  <div class="carousel-inner" role="listbox">
  
    <div class="item active">
      <img src="img/index/1.jpg" alt="first slide">
      <div class="carousel-caption">
        
      </div>
    </div>
    <div class="item">
      <img src="img/index/9.jpg" alt="second slide">
      <div class="carousel-caption">
        
      </div>
    </div>
    <div class="item">
      <img src="img/index/14.jpg" alt="third slide">
      <div class="carousel-caption">
        
      </div>
    </div>
   
    </div>
 
  </div>





  <!-- 轮播控制按钮 -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

    <!-- 设置轮播间隔时间为2秒 -->
    <script type="text/javascript">  
        $(document).ready(function () {  
            $('.carousel').carousel({  
                interval: 2000  
            })  
        })  
    </script>  
<!-- 轮播结束 -->





<!-- 底部 -->
<footer>
			
			<ul>
				<li>
					<p class="home">Home</p>
					<a class="logo" href="index.html">Technology <i>&copy; 2018</i></a>
				</li>
				<li>
					<p class="services">客户服务</p>

					<ul>
						<li>联系客服</li>
						<li>进店须知</li>						
						<li><a href="jsp/professional_pay_ranking.jsp">Ranking &amp; Print Design</a></li>
					</ul>
				</li>
				<li>
					<p class="reachus">联系我们</p>

					<ul>
						<li>Email:862241189@qq。com</li>
						<li>QQ:862241189
						   
						</li>
						
						<li>PHONE:18331279198</li>
					</ul>
				</li>
				
			</ul>

		</footer>
</body>
<script language="javascript">
function display1()
{
 b.style.display="block";
 }
function display2()
{
 b.style.display="none";
 }
</script>
</html>
