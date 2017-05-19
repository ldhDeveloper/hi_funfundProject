
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.contain {
	position:relative;;
	top: -70px;
}

.fun-menu {
	color: white !important;
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	display: block;
	max-width: 100%;
	max-height: 540px !important;
	margin: auto;
}
</style>

<title>home</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />


	<!-- 슬라이드 사진 영역 -->
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="contain"
				style="padding-left: 0px; padding-right: 0px; width: 100%; clear: both;">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img src="images/home/slide1.gif" alt="" style="width: 100%;">
							<div class="carousel-caption">
								<h3>즐거움을 펀딩하라!</h3>
								<p>enjoy funding funny!</p>
							</div>
						</div>

						<div class="item">
							<img src="images/home/slide2.gif" alt="" style="width: 100%;">
							<div class="carousel-caption">
								<h3>아름다움을 펀딩하라!</h3>
								<p>enjoy funding beautiful!</p>
							</div>
						</div>

						<div class="item">
							<img src="images/home/slide3.gif" alt="" style="width: 100%;">
							<div class="carousel-caption">
								<h3>여유로움을 펀딩하라!</h3>
								<p>Enjoy funding relaxedly!</p>
							</div>
						</div>

					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>


	<div class="container" style="clear: both">
		<div class="row" style="margin: 0px 20px 0 20px;">
			<c:forEach var="item" items="${top3List}" varStatus="status">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="detail.it?pro_no=<c:out value="${item.pro_no}"/>"> <img
							src="/funfund/images/funding/face.PNG" alt="사진1"
							style="width: 100%"> <script>
								$(function(){
									
									var ecost = "<c:out value='${item.ecost}'/>";
									var fundamount = "<c:out value='${item.fundamount}'/>"
									var persent = Math.round(fundamount * 100
											/ ecost);
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
									$("#edate<c:out value='${status.index}'/>")
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
								달성 &nbsp;&nbsp; <span id="edate<c:out value='${status.index}'/>"></span>
								<span id="yet<c:out value='${status.index}'/>">일 남음</span>
								<spen id="complete<c:out value='${status.index}'/>">펀딩종료</spen>
							</p>

							<div class="caption">
								<p>
									<c:out value="${item.pcontent }" />
								</p>
								<span><c:out value="${item.category}" /></span>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
</body>
</html>
