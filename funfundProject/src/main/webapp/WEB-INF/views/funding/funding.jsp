<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funding</title>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<script src="/funfund/lib/js/jquery.FadeWideBgImg.js"></script>
<script type="text/javascript" src="/funfund/lib/js/fadeSlideShow.js"></script>
<link rel="stylesheet" type="text/css"
	href="/funfund/lib/css/demoStyleSheet.css" />
<style>
@media screen and (min-width:0px) and (max-width: 960px)  {
	body {
		background-color: lightgreen;
	}
	
	.titlebar {
	  height: 870px !important;
	}
	
}

@media screen and (min-width: 720px) {
	body {
		background-color: lightgreen;
	}
}

@media screen and (min-width: 540px) {
	body {
		background-color: lightgreen;
	}
}

.titlebar {
	background: orange;
	text-align: center;
	align: center;
	padding: 20px;
	width: 100%;
	height: 600px;
}

.titlebar2 {
	background: #F9F7F5;
	padding: 20px;
	text-align: center;
	align: center;
	width: 100%;
}

.margin {
	margin: 10px;
	padding: 10px;
}

.simg ul {
	list-style: none;
	align: center;
}

.simg ul li {
	display: inline-block;
	align: center;
	float: left;
}

.background {
	background-color: #F9F7F5;
}

#progressbar1 {
	width: 300px;
}

button {
	curser: pointer;
}

.btn {
	background: white;
	border: 1px solid #ccc !important;
}

.clickbtn {
	background: #fec250;
	color: white !important;
}

.titlebar li {
	padding: 0 !important;
	float: left;
	background-size: contain;
	height: 100%;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.slide {
	max-width: 500px;
	align: left;
	display: inline-block;
	/* float: left; */
}

.slide img {
	margin: 0px !important;
}

.align {
	display: inline-block;
	margin-left: -5px;
}

.isize {
	max-width: 250px !important;
	max-height: 160px !important;
	margin: 0px !important;
}

body {
	font-family: myFirstFont !important;
}

.simg {
	position: relative;
}

.simg>ul {
	position: absolute;
}
</style>
<script>
//돈콤마찍어주는 정규식
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

	$(function() {
		$('.btn').click(function() {
			$(".btn").removeClass("clickbtn");
			$(this).addClass("clickbtn");
		});
		
		$("#selectAll")
				.click(
						function() {
							$
									.ajax({
										url : "selectAll.it",
										type : "get",
										async : true,
										success : function(data) {
											
											var html = "";
											for (var i = 0; i < data.length; i++) {
												var pro_no = data[i].pro_no;
												var ecost = data[i].ecost;
												var fundamount = numberWithCommas(data[i].fundamount);
												var fundamount2 = data[i].fundamount;
												console.log("fundamount"+fundamount);
												console.log("fundamount2"+fundamount2);
												console.log("ecost"+ecost);
												var pedate = data[i].pedate;
												var persent = Math
														.round(fundamount2 * 100
																/ ecost);
												var persent2 = numberWithCommas(persent);
												console.log("오니");
												console.log("persent:"+persent);
												var bar = 0;
												var category = data[i].category;
												var pname= data[i].pname;
												var thumbnail = data[i].thumbnail;
												if (persent > 100) {
													bar = 100;
												} else {
													bar = persent;
												}
												var edate = new Date(pedate);
												var todate = new Date();
												var btMs = edate.getTime()
														- todate.getTime();
										
												var btDay = Math
														.round(btMs
																/ (1000 * 60 * 60 * 24));
												
												var funding = "";
												var ending = "";
												if (btDay < 0) {
													funding = "none";
													ending = "";
												} else {
													funding = "";
													ending = "none";
												}
												html += '<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">';
												html += '<div class="thumbnail" align="center">';
												html += '<a href="detail.it?pro_no='
														+ pro_no + '">';
												html += '<img src="/funfund/images/makeproject/titleimg/'
														+ thumbnail
														+ '" alt="사진1" style="width: 100%">';
												html += '<div id="progress' + i + '" class="progress">';
												html += '<div class="progress-bar progress-bar-warning"';
												html += 'id="progressbar' + i
														+ '"';
												html += 'role="progressbar" aria-valuenow="60" aria-valuemin="0"';
												html += 'aria-valuemax="'
														+ ecost
														+ '" style="width: '
														+ bar + '%;">';
												html += '<span class="sr-only"></span>';
												html += '</div></div><p>';
												html += '<span id="persent' + i +'">'
														+ persent2
														+ '</span> % &nbsp;&nbsp; <span>'
														+ fundamount
														+ '</span>원 달성 &nbsp;&nbsp;';
												html += '<span id="edate' + i +'" style="display:' + funding + '">'
														+ btDay + '</span>';
												html += '<span id="yet' + i +'" style="display:' + funding + '">일 남음</span>';
												html += '<spen id="complete' + i + '" style="display:' + ending + '">펀딩종료</spen>';
												html += '</p><div class="caption"><p>'
														+ pname + '</p>';
												html += '<span>'
														+ category
														+ '</span></div></a></div></div>';
											}
											$("#fundItemList").html(html);
										},
										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									});
						});

		$(".selcategory")
				.click(
						function() {
							$
									.ajax({
										url : "selectCategory.it",
										type : "get",
										data : {
											"category" : $(this).val()
										},
										async : true,
										success : function(data) {
										
											var html = "";
											for (var i = 0; i < data.length; i++) {
												var pro_no = data[i].pro_no;
												var ecost = data[i].ecost;
												var fundamount = numberWithCommas(data[i].fundamount);
												var fundamount2 = data[i].fundamount;
												console.log("fundamount"+fundamount);
												console.log("fundamount2"+fundamount2);
												console.log("ecost"+ecost);
												var pedate = data[i].pedate;
												var persent = Math
														.round(fundamount2 * 100
																/ ecost);
												var persent2 = numberWithCommas(persent);
												console.log("오니");
												console.log("persent:"+persent);
												var bar = 0;
												var category = data[i].category;
												var pname = data[i].pname;
												var thumbnail = data[i].thumbnail;
												if (persent > 100) {
													bar = 100;
												} else {
													bar = persent;
												}
												var edate = new Date(pedate);
												var todate = new Date();
												var btMs = edate.getTime()
														- todate.getTime();
											
												var btDay = Math
														.round(btMs
																/ (1000 * 60 * 60 * 24));
												
												var funding = "";
												var ending = "";
												if (btDay < 0) {
													funding = "none";
													ending = "";
												} else {
													funding = "";
													ending = "none";
												}
												html += '<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">';
												html += '<div class="thumbnail" align="center">';
												html += '<a href="detail.it?pro_no='
														+ pro_no + '"> ';
												html += '<img src="/funfund/images/funding/thumbnail/'
														+ thumbnail
														+ '" alt="사진1" style="width: 100%">';
												html += '<div id="progress' + i + '" class="progress">';
												html += '<div class="progress-bar progress-bar-warning"';
												html += 'id="progressbar' + i
														+ '"';
												html += 'role="progressbar" aria-valuenow="60" aria-valuemin="0"';
												html += 'aria-valuemax="'
														+ ecost
														+ '" style="width: '
														+ bar + '%;">';
												html += '<span class="sr-only"></span>';
												html += '</div></div><p>';
												html += '<span id="persent' + i +'">'
														+ persent2
														+ '</span> % &nbsp;&nbsp; <span>'
														+ fundamount
														+ '</span>원 달성 &nbsp;&nbsp;';
												html += '<span id="edate' + i +'" style="display:' + funding + '">'
														+ btDay + '</span>';
												html += '<span id="yet' + i +'" style="display:' + funding + '">일 남음</span>';
												html += '<spen id="complete' + i + '" style="display:' + ending + '">펀딩종료</spen>';
												html += '</p><div class="caption"><p>'
														+ pname + '</p>';
												html += '<span>'
														+ category
														+ '</span></div></a></div></div>';
											}
											$("#fundItemList").html(html);
										},
										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									});
						})

		$('.carousel').carousel({
			interval : 2500
		});


		$(".simg > ul:gt(0)").hide();

		setInterval(function() {
			$('.simg > ul:first').fadeOut(500).next().fadeIn(500).end()
					.appendTo('.simg');
		}, 5000);

	})
</script>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="titlebar" align="center">
		<div class="col-lg-2 col-md-0 col-sm-0 col-xs-0"></div>
		<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 simg">

          
			<ul id="s1">
				<li><img src="/funfund/images/funding/l.png"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/ll.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/t2.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/sss.PNG"
					class="img-responsive"></li>
			</ul>

			<ul id="s2">
				<li><img src="/funfund/images/funding/l2.png"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/o.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/ff.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/hh.PNG"
					class="img-responsive"></li>
			</ul>

			<ul id="s3">
				<li><img src="/funfund/images/funding/l3.png"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/t.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/g.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/ss.PNG"
					class="img-responsive"></li>
			</ul>
		</div>
	</div>

	<!-- 카테고리바 -->
	<div class="titlebar2">
		<div class="container"></div>
	</div>
	<div class="row"
		style="align: center; padding: 10px; background: white;">
		<div class="container">
			<div id="blist" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
				style="display: block; text-align: center;">
				<button id="selectAll" class="btn " value="all">전체</button>
				<button id="selectTech" class="btn selcategory" value="tech">테크</button>
				<button id="selectBeauty" class="btn selcategory" value="beauty">패션/뷰티</button>
				<button id="selectFood" class="btn selcategory" value="food">푸드</button>
				<button id="selectDesign" class="btn selcategory" value="design">디자인</button>
				<button id="selectArt" class="btn selcategory" value="art">예술</button>
				<button id="selectGame" class="btn selcategory" value="game">게임</button>
				<button id="selectTrip" class="btn selcategory" value="trip">여행</button>
				<button id="selectSport" class="btn selcategory" value="sports">스포츠</button>
				<button id="selectSupport" class="btn selcategory"
					value="support">후원</button>
			</div>
		</div>
	</div>


	<div class="background">
		<div class="container" style="clear: both">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center"></div>
			</div>
			<div id="fundItemList" class="row">

				<c:forEach var="item" items="${iList}" varStatus="status">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="thumbnail" align="center">
							<a href="detail.it?pro_no=<c:out value="${item.pro_no}"/>"> <img
								src="/funfund/images/makeproject/titleimg/<c:out value="${item.thumbnail }"/>"
								alt="사진1" style="width: 100%"> <script>
									$(function() {
										var ecost = "<c:out value='${item.ecost}'/>";
										var fundamount = "<c:out value='${item.fundamount}'/>"
									
										var persent = Math.round(fundamount
												* 100 / ecost);
									
									 
										
										var bar = 0;
										if (persent > 100) {
											bar = 100;
										} else {
											bar = persent;
										}
										var edate = new Date(
												"<c:out value='${item.pedate}'/>");
										var todate = new Date();
										var btMs = edate.getTime()
												- todate.getTime();
										var btDay = Math.round(btMs
												/ (1000 * 60 * 60 * 24));

									
										$(
												"#persent<c:out value='${status.index}'/>")
												.text(persent);
										$(
												"#progressbar<c:out value='${status.index}'/>")
												.attr("aria-valuenow", persent);
										$(
												"#progressbar<c:out value='${status.index}'/>")
												.css("width", bar + "%");
										$(
												"#edate<c:out value='${status.index}'/>")
												.text(btDay);

										if (btDay < 0) {
											$(
													"#edate<c:out value='${status.index}'/>")
													.hide();
											$(
													"#yet<c:out value='${status.index}'/>")
													.hide();
											$(
													"#complete<c:out value='${status.index}'/>")
													.show();
										} else {
											$(
													"#complete<c:out value='${status.index}'/>")
													.hide();
											$(
													"#edate<c:out value='${status.index}'/>")
													.show();
											$(
													"#yet<c:out value='${status.index}'/>")
													.show();
										}
									})
								</script>
								<div id="progress<c:out value='${status.index}'/>"
									class="progress">
									<div class="progress-bar progress-bar-warning"
										id="progressbar<c:out value='${status.index}'/>"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="<c:out value="${item.ecost}"/>">
										<span class="sr-only"></span>
									</div>
								</div>
								<p>
									<span id="persent<c:out value='${status.index}'/>"></span> %
									&nbsp;&nbsp; <span><fmt:formatNumber var="fundamount"  value="${item.fundamount }"/>${fundamount }</span>원
									달성 &nbsp;&nbsp; <span
										id="edate<c:out value='${status.index}'/>"></span> <span
										id="yet<c:out value='${status.index}'/>">일 남음</span> <span
										id="complete<c:out value='${status.index}'/>">펀딩종료</span>
								</p>

								<div class="caption">
									<p>${item.pname }</p>
									<span><c:out value="${item.category}" /></span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true" />

</body>
</html>