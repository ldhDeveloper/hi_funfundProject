
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container{
	position:absolute;
	top:-70px;
	z-index:1;
}
.fun-menu{
	color:white !important;

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
			<div class="container" style="padding-left: 0px;padding-right: 0px; width:100%;">
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


</body>
</html>
