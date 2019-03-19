<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健身预定</title>

<!-- 兼容H5 -->
<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

<!-- 引入文件 -->
<link href="css/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/foot.css" rel="stylesheet" type="text/css" />

<link href="js/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
<script src="js/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		display();
	})
</script>
</head>

<style type="text/css">

/*
      尾部样式
*/
.c {
	clear: both
}

#di {
	height: 100px;
	margin: 0px auto;
	border: 1px solid #F00;
	background: red;
}

.qi {
	width: 100%;
	height: 34px;
	margin: 0px auto;
	margin-top: 16px;
}

.qis {
	font-size: 19px;
	color: black;
	margin-right: 10px;
	line-height: 70px;
}

.hang {
	width: 300px;
	height: 20px;
	margin: 15px auto;
}

.hang span a:link {
	color: black
}

.bei {
	width: auto;
	height: 20px;
	margin: 0px auto;
	color: black;
}
</style>

<script type="text/javascript">
	var pageNo = 1;
	var pageSize = 7;
	var pages = 0;

	var province; //考生所在省份
	var examType; //招生类别
	var year; //报考年份
	var batch; //录取批次
	var score; //考生分数
	var profession; //心仪专业
	var yearStandard; //参考年份

	function display() {
		province = $("#province").val(); //考生所在省份
		examType = $("#examType").val(); //招生类别
		year = $("#year").val(); //报考年份
		batch = $("#batch").val(); //录取批次
		score = $("#score").val(); //考生分数
		profession = $("#profession").val(); //心仪专业
		yearStandard = $("#yearStandard").val(); //参考年份
		pageNo = 1;
		pageSize = 7;
		pages = 0;
		loadData(pageNo, pageSize);
	}

	function loadData(pageNo, pageSize) {

		//alert(score)
		if (score == "" || score.length == 0) {
			alert("请输入您的分数");
		} else {
			//alert(province+"  "+examType+"  "+year+"  "+batch+"  "+ score+"  "+profession+"  "+professionLevel+"  "+goalLevel);
			//用ajax上传给控制器请求的数据

			$
					.ajax({
						type : 'post',
						url : 'findAspiration',
						dataType : 'json',
						data : {
							province : province,
							examType : examType,
							year : year,
							batch : batch,
							score : score,
							profession : profession,
							yearStandard : yearStandard,
							page_num : pageNo,
							page_size : pageSize
						},
						success : function(data) {

							var list = data.aspirationList; //获取返回的list表
							var totalCount = data.total_count; //获取总记录数
							pages = data.page_count; //获取总页数
							pageNo = data.pageNo;
							//alert(pageNo);
							var htmlTable = "";
							if (list.length != 0) {
								for (var i = 0; i < list.length; i++) {

									//渲染表格
									htmlTable += "<tr>";
									htmlTable += "<td><b>";
									htmlTable += list[i].university_name;
									htmlTable += "</b></td>";
									htmlTable += "<td><b>";
									htmlTable += list[i].profession_name;
									htmlTable += "</b></td>";
									htmlTable += "<td><b>";
									htmlTable += list[i].profession_line;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].university_line;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].myEqualScore;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].place;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].esi;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].university_city;
									htmlTable += "</b></td>";

									htmlTable += "<td><b>";
									htmlTable += list[i].project;
									htmlTable += "</b></td>";
									htmlTable += "</tr>"

									//addEvent(alarm_id);
								}
								$('#Aslist').find('tbody').html(htmlTable);

								displayFooter(totalCount, pages, pageNo);
							} else {
								$('#Aslist')
										.find('tbody')
										.html(
												"<tr><td colspan=\"8\"  align=\"center\">抱歉！没有找到数据！！！</td></tr>");
							}

						}
					});

		}
	}

	function displayFooter(totalCount, pages, pageNo) {
		var newText = '共' + totalCount + '条，' + '第' + pageNo + '页，' + '共'
				+ pages + '页';
		$("#summary").text(newText);
	}

	function firstPage() {
		pageNo = 1;
		loadData(pageNo, pageSize);
	}

	function prePage() {
		if (pageNo == 1) {
			return false;
		} else {
			pageNo--;
			loadData(pageNo, pageSize);
		}
	}

	function nextPage() {
		if (pageNo == pages) {
			return false;
		} else {
			pageNo++;

			loadData(pageNo, pageSize);
		}
	}

	function lastPage() {
		pageNo = pages;
		loadData(pageNo, pageSize);
	}
</script>





<body style="background: url(img/bg3.jpg)">

	<!-- 导航 -->
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div>
			<div class="navi_body">
				<div class="navi_head">
					<div style="width: 80%; margin-left: auto; margin-right: auto;">
						<span>
							<p class="navi_title">
								<a href="index.html">首页</a>
							</p>
						</span> <span>
							<p class="navi_title">院校查询</p>
							<p class="navi_title">
								<a href="jsp/university.jsp">院校信息</a>
							</p>
							<p class="navi_title">
								<a href="jsp/211_project.jsp">211工程大学</a>
							</p>
							<p class="navi_title">
								<a href="jsp/985_project.jsp">985工程大学</a>
							</p>
						</span> <span>
							<p class="navi_title">排行榜</p>
							<p class="navi_title">
								<a href="jsp/professional_pay_ranking.jsp">专业薪酬排行榜</a>
							</p>
							<p class="navi_title">
								<a href="jsp/profession_employment_ranking.jsp">专业就业排行榜</a>
							</p>
						</span> <span>
							<p class="navi_title">志愿填报</p>
							<p class="navi_title">
								<a href="http://xz.chsi.com.cn/survey/index.action"
									target="_blank">专业选择</a>
							</p>
							<p class="navi_title">
								<a href="jsp/choose_profession.jsp">志愿填报</a>
							</p>

						</span> <span>
							<p class="navi_title">留言墙</p>
							<p class="navi_title">
								<a href="jsp/message.jsp">站内留言</a>
							</p>
							<p class="navi_title">
								<a href="jsp/touch.jsp">联系站长</a>
							</p>

						</span> <span> <c:if test="${user!=null}">
								<p class="navi_title">
									<span>${user.username} 你好</span>
								</p>
								<p class="navi_title">
									<a href="loginOutput">注销</a>
								</p>
							</c:if> <c:if test="${user==null }">
								<p class="navi_title">
									<a href="jsp/loginAndRegister.jsp" id="loginAndRegister">登录/注册</a>
								</p>
							</c:if>



						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 导航结束 -->


	<div align="center">
		<p style="margin-top: 60px">
			生源地：<select style="width: 100px;" id="province">
				<option value="河北省" selected="selected">河北省</option>
				<option value="北京市">北京</option>
				<option value="天津市">天津</option>
				<option value="黑龙江省">黑龙江</option>
				<option value="吉林省">吉林</option>
				<option value="辽宁省">辽宁</option>
				<option value="山东省">山东</option>
				<option value="江苏省">江苏</option>
				<option value="安徽省">安徽</option>
				<option value="河南省">河南</option>

			</select> 报考类别：<select style="width: 100px;" id="examType">
				<option value="文科">文科</option>
				<option value="理科" selected="selected">理科</option>
			</select> 报考年份： <select style="width: 100px;" id="year">
				<option value="2017" selected="selected">2017</option>
				<option value="2024">2024</option>
				<option value="2023">2023</option>
				<option value="2022">2022</option>
				<option value="2021">2021</option>
				<option value="2020">2020</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
				<option value="2016">2016</option>
				<option value="2015">2015</option>
			</select> 报考批次：<select style="width: 100px;" id="batch">
				<option value="本科一批" selected="selected">本科一批</option>
				<option value="本科二批">本科二批</option>
				<option value="专科">专科</option>
			</select>
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="display()">按学校推荐</button>
		</p>
		<p>
			参考年份： <select style="width: 100px;" id="yearStandard">
				<option value="2016" selected="selected">2016</option>
				<option value="2024">2024</option>
				<option value="2023">2023</option>
				<option value="2022">2022</option>
				<option value="2021">2021</option>
				<option value="2020">2020</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
				<option value="2017">2017</option>
				<option value="2015">2015</option>
			</select> 考生分数：<input type="text" id="score" placeholder="请输入分数" value="600">
			心仪专业：<input type="text" id="profession" placeholder="请输入专业">
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="display()">按专业推荐</button>

		</p>






	</div>












	<!-- 表格 -->
	<div align="center">
		<table class="table table-hover" id="Aslist"
			style="margin-left: 60px; width: 1200px; margin-top: 2px; font-size: 11px;">
			<thead>
				<tr>
					<th>学校名称</th>
					<th>专业名称</th>
					<th>专业分数线</th>
					<th>学校分数线</th>
					<th>我的等效分数</th>
					<th>大学排名</th>
					<th>ESI前1%</th>
					<th>大学城市</th>
					<th>院校属性</th>
				</tr>
			</thead>
			<tbody class="listbody">



			</tbody>
		</table>

	</div>















	<div id="footer" align="center">

		<p>
			<span id="summary"></span>
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="firstPage()">首页</button>
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="prePage()">上一页</button>
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="nextPage()">下一页</button>
			<button type="submit" class="btn btn-default"
				style="background: #90d7ec" onclick="lastPage()">尾页</button>
		</p>
	</div>
	</div>
	<!-- 表格结束 -->



	<!-- 尾部 -->
	<div style="bottom: 0px; width: 100%">
		<footer>

		<ul>
			<li>
				<p class="home">Home</p> <a class="logo" href="index.html">YiMing
					Technology <i>&copy; 2018</i>
			</a>
			</li>
			<li>
				<p class="services">Services</p>

				<ul>
					<li><a href="jsp/university.jsp">University Research</a></li>
					<li><a href="http://xz.chsi.com.cn/survey/index.action"
						target="_blank">Profession Choose</a></li>
					<li><a href="jsp/choose_profession.jsp">Aspiration Choose</a></li>
					<li><a href="jsp/professional_pay_ranking.jsp">Ranking
							&amp; Print Design</a></li>
				</ul>
			</li>
			<li>
				<p class="reachus">Reach us</p>

				<ul>
					<li><a href="https://mail.163.com/">Email:Guo_Wan_Min@163.com</a></li>
					<li><a href="jsp/touch.jsp">QQ:2068257540</a></li>
					<li><a href="jsp/touch.jsp">weixin:GWM19960812</a></li>
					<li>PHONE:18233279612</li>
				</ul>
			</li>
			<li>
				<p class="clients">Clients</p>

				<ul>
					<li><a href="jsp/loginAndRegister.jsp">Login Area</a></li>
					<li><a href="jsp/loginAndRegister.jsp">Register Center</a></li>
				</ul>
			</li>
		</ul>

		</footer>
	</div>
	<!-- 尾部结束 -->



</body>
</html>