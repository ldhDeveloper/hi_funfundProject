<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funding</title>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<style>
@media screen and (min-width: 960px) {
	body {
		background-color: lightgreen;
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
	height: 400px;
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

ul {
	list-style: none;
	align: center;
}

li {
	display: inline-block;
	align: center;
	float: left;
}

img {
	vertical-align: middle;
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
	max-width: 500px !important;
}

.slide {
	width: 500px;
	align: left;
	 display: inline-block;
	/* float: left; */
}

.slide img {
	margin: 0px !important;
}

.align {
 display: inline-block;
	margin: -5px;
	padding-top: 20px;
}

.isize {
	max-width: 250px !important;
	max-height: 160px !important;
	margin: 0px !important;
}
</style>
<script>
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
											console.log(data);
											var html = "";
											for (var i = 0; i < data.length; i++) {
												var pro_no = data[i].pro_no;
												var ecost = data[i].ecost;
												var fundamount = data[i].fundamount;
												var pedate = data[i].pedate;
												var persent = Math
														.round(fundamount * 100
																/ ecost);
												var bar = 0;
												var category = data[i].category;
												var pcontent = data[i].pcontent;
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
												console.log("btMs : " + btMs);
												var btDay = Math
														.round(btMs
																/ (1000 * 60 * 60 * 24));
												console.log("btDay : " + btDay);
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
														+ persent
														+ '</span> % &nbsp;&nbsp; <span>'
														+ fundamount
														+ '</span>원 달성 &nbsp;&nbsp;';
												html += '<span id="edate' + i +'" style="display:' + funding + '">'
														+ btDay + '</span>';
												html += '<span id="yet' + i +'" style="display:' + funding + '">일 남음</span>';
												html += '<spen id="complete' + i + '" style="display:' + ending + '">펀딩종료</spen>';
												html += '</p><div class="caption"><p>'
														+ pcontent + '</p>';
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
											console.log(data);
											var html = "";
											for (var i = 0; i < data.length; i++) {
												var pro_no = data[i].pro_no;
												var ecost = data[i].ecost;
												var fundamount = data[i].fundamount;
												var pedate = data[i].pedate;
												var persent = Math
														.round(fundamount * 100
																/ ecost);
												var bar = 0;
												var category = data[i].category;
												var pcontent = data[i].pcontent;
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
												console.log("btMs : " + btMs);
												var btDay = Math
														.round(btMs
																/ (1000 * 60 * 60 * 24));
												console.log("btDay : " + btDay);
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
														+ persent
														+ '</span> % &nbsp;&nbsp; <span>'
														+ fundamount
														+ '</span>원 달성 &nbsp;&nbsp;';
												html += '<span id="edate' + i +'" style="display:' + funding + '">'
														+ btDay + '</span>';
												html += '<span id="yet' + i +'" style="display:' + funding + '">일 남음</span>';
												html += '<spen id="complete' + i + '" style="display:' + ending + '">펀딩종료</spen>';
												html += '</p><div class="caption"><p>'
														+ pcontent + '</p>';
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
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="titlebar" align="center">
		<div class="col-lg-2 col-md-0 col-sm-0 col-xs-0"></div>
		<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
		
				<!-- 슬라이드 -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" style="padding-top: 20px;">

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/funfund/images/funding/thumbnail/pr1.jpg"
								class="img-responsive">
							<div class="carousel-caption">아아</div>
						</div>
						<div class="item ">
							<img src="/funfund/images/funding/thumbnail/pr2.jpg"
								class="img-responsive">
							<div class="carousel-caption">이이</div>
						</div>
						<div class="item ">
							<img src="/funfund/images/funding/thumbnail/pr3.jpg"
								class="img-responsive">
							<div class="carousel-caption">오오</div>
						</div>
					</div>
				</div>

				<!-- 오른쪽 이미지(2개) -->
				<div class="align">
					<img src="/funfund/images/funding/thumbnail/pr4.jpg"
						class="img-responsive isize"> <img
						src="/funfund/images/funding/thumbnail/pr4.jpg"
						class="img-responsive isize">
				</div>
			
		</div>
		<div class="col-lg-2 col-md-0 col-sm-0 col-xs-0"></div>
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
				<button id="selectSport" class="btn selcategory" value="sport">스포츠</button>
				<button id="selectPinterest" class="btn selcategory"
					value="pinterest">공익</button>
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
								src="/funfund/images/funding/thumbnail/<c:out value="${item.thumbnail }"/>"
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

										console.log(persent);
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
										aria-valuemax="<c:out value="${item.ecost}"/>"
										style="width: 60%;">
										<span class="sr-only"></span>
									</div>
								</div>
								<p>
									<span id="persent<c:out value='${status.index}'/>"></span> %
									&nbsp;&nbsp; <span><c:out value="${item.fundamount }" /></span>원
									달성 &nbsp;&nbsp; <span
										id="edate<c:out value='${status.index}'/>"></span> <span
										id="yet<c:out value='${status.index}'/>">일 남음</span> <span
										id="complete<c:out value='${status.index}'/>">펀딩종료</span>
								</p>

								<div class="caption">
									<p>${item.pshort }</p>
									<span><c:out value="${item.category}" /></span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</div>

</body>
</html>