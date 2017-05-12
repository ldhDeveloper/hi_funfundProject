<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<style>
.titlebar {
	background: orange;
	text-align: center;
	align: center;
	padding: 20px;
	width: 100%;
	height: 450px;
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
</style>
<script>
	$(function() {
		$('.btn').click(function() {
			$(".btn").removeClass("clickbtn");
			$(this).addClass("clickbtn");
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="titlebar" align="center">
		<div>
			<ul class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
				<li><img src="/funfund/images/funding/1.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/2.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/3.PNG"
					class="img-responsive"></li>
				<li><img src="/funfund/images/funding/4.PNG"
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
				<button class="btn ">전체</button>
				<button class="btn ">아이디어</button>
				<button class="btn ">디자인</button>
				<button class="btn ">패션/뷰티</button>
				<button class="btn ">테크</button>
			</div>
		</div>
	</div>


	<div class="background">
		<div class="container" style="clear: both">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>idea</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="detail.do"> <img
							src="/funfund/images/funding/face.PNG" alt="사진1"
							style="width: 100%">
							<div class="progress">
								<div class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 60%;">
									<span class="sr-only"></span>
								</div>
							</div>
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>

							<div class="caption">
								<p>내용을쓰시오</p>
								<span>카테고리</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>design</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
				align="center">
				<img src="images/funding/" class="img-responsive"><br>
				<h2>fashion/beauty</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>tech</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href=""> <img src="images/funding/" alt="사진1"
							style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>