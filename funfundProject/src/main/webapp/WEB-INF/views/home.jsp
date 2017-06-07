<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link href="/funfund/lib/css/common/font.css" rel="stylesheet" />
<link href="/funfund/lib/css/swiper.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<style>
.contain {
	position: relative;
	top: -70px;
}

@media screen and (min-width:1px) and (max-width:767px) {
	.contain {
		top: -20px;
	}
	.container {
		padding-top: 50px !important;
	}
}


.fun-menu {
	color: white !important;
}

body {
	font-family: myFirstFont !important;
}

.swiper-container {
	width: 100%;
	max-height: 540px !important;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
.countbar{
	padding-left: 50px;
}
</style>

<title>home</title>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />


	<!-- 슬라이드 사진 영역 -->
	<div class="row" style="max-height:465px;">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="contain"
				style="padding-left: 0px; padding-right: 0px; width: 100%; clear: both;">
				<!-- Slider main container -->
				<div class="swiper-container">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- 슬라이더 입니다. -->
						<div class="swiper-slide">
							<img src="images/home/slide1.gif" style="width: 100%; max-height:540px;" class="img-responsive">
							<div class="carousel-caption">
								<p style="font-size:15pt">즐거움을 펀딩하라!</p>
								<p>enjoy funding funny!</p>
							</div>
						</div>

						<div class="swiper-slide">
							<img src="images/home/slide2.gif" style="width: 100%;max-height:540px;"class="img-responsive">
							<div class="carousel-caption">
								<p style="font-size:15pt">아름다움을 펀딩하라!</p>
								<p>enjoy funding beautiful!</p>
							</div>
						</div>

						<div class="swiper-slide">
							<img src="images/home/slide3.gif" style="width: 100%;max-height:540px;"class="img-responsive">
							<div class="carousel-caption">
								<p style="font-size:15pt">여유로움을 펀딩하라!</p>
								<p>Enjoy funding relaxedly!</p>
							</div>
						</div>

					</div>
					<!-- 만약 페이지네비게이션이 필요하다면 추가하세요 -->
					<div
						class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
						<span class="swiper-pagination-bullet"></span> <span
							class="swiper-pagination-bullet"></span> <span
							class="swiper-pagination-bullet"></span>
					</div>
					

				</div>
			</div>
		</div>
	</div>

	<script src="/funfund/lib/js/swiper.jquery.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : '.swiper-pagination',
			slidesPerView : 1,
			paginationClickable : true,
			spaceBetween : 30,
			autoplay:5000,
			autoplayDisableOnInteraction: false, 
			loop : true
		});
	</script>
	
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background:orange; height:100px; width:100%;color:white">
				<table style="width:100%;height:100px;text-align:center;valign:middle;">
					<tr>
						<td style="valign:middle">
								누적 펀딩 건수<br>
								<label class="comma" style="font-size:2em"><c:out value="${count.itemcount}"/></label>건
						</td>
						<td>
								누적 펀딩 금액<br>
								<label id="comma" style="font-size:2em"></label>원
						</td>
						<td>
								펀딩 모집 성공률<br>
								<label style="font-size:2em"><c:out value="${count.sucrate}"/></label>%
						</td>
					</tr>
				</table>
			</div>
		</div>
	<br style="clear:both"><br>
	<script>
	
	var price = <c:out value="${count.totalprice}"/>;
	var price2 = numberWithCommas(price);
	
	$("#comma").html(price2);
	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
		
		
	

	</script>


	<div class="container" style="clear: both">
		<div class="row" style="margin: 0px 20px 0 20px;">
			<c:forEach var="item" items="${top3List}" varStatus="status">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="detail.it?pro_no=<c:out value="${item.pro_no}"/>"> <img
							src="/funfund/images/funding/thumbnail/<c:out value="${item.thumbnail }"/>"
							alt="사진1" style="width: 100%"> <script>
								$(function() {

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

									//console.log(persent);
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
