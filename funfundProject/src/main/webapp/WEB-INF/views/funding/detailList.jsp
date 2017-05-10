<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="webapp/lib/css/bootstrap.min.css" rel="stylesheet">
<link
	href="webapp/lib/css/font-awesome/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="webapp/lib/css/font-awesome/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<style>
.background {
	background-color: black;
	padding: 20px;
	margin: 10px;
}

ul {
	list-style: none;
	float: left;
	padding: 10px;
	width: 100%;
	align: center;
}

li {
	padding: 10px;
	text-align: center;
	display: inline-block;
}

.font {
	color: white;
}

.align {
	margin: auto;
	width: auto;
}

.box {
	margin: 10px;
	padding: 10px;
	text-align: center;
}

.info {
	padding-left: 10px;
	margin-bottom: 20px;
}

.infoBar {
	display: block;
	height: 3px;
	background: #ed6d54;
	margin-left: 30px;
	margin-bottom: 20px;
	width: 70%;
}

.btn-fund {
	display: block;
	width: 70%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	color: #fff;
	background: #ed6d54;
	border: none;
	margin-left: 30px;
	margin-bottom: 20px;
}

button {
	curser: pointer;
}

.btn-like {
	display: inline-block;
	margin-right: 3px;
	vertical-align: middle;
}

.btn-share {
	display: inline-block;
	margin-right: 3px;
	vertical-align: middle;
}

.makerbox {
	padding: 20px 19px 20px;
	border: 1px solid #eaeaea;
	margin-left: 30px;
	margin-bottom: 20px;
	width: 80%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h4 align="center" class="font">
				<strong>패션/뷰티</strong>
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h3 align="center" class="font">매클러, 똑똑한 경락 디바이스의 기적같은 효과!</h3>
		</div>
	</div>

	<div align="center">
		<ul class="w3-border-bottom w3-border-gray">
			<li>스토리</li>
			<li>댓글( )</li>
			<li>새소식( )</li>
			<li>서포터( )</li>
		</ul>
	</div>

	<div class="cantainer">
		<div class="row col-lg-2 col-md-2 col-sm-2 col-xs-2 "></div>
		<div class="row col-lg-6 col-md-6 col-sm-8 col-xs-8 box">
			<img src="/funfund/images/funding/face.PNG" class="img-responsive"
				style="align: center">
		</div>
		<div class="row col-sm-2 col-xs-2 "></div>
	</div>

	<div class="container">
		<div class="row col-lg-4 col-md-4 col-sm-12 col-xs-12 box">
			<p style="margin-bottom: 25px; padding-left: 10px; margin-top: 15px;">
				일 남음</p>
			<em class="infoBar"></em>
			<p class="info">% 달성</p>
			<p class="info">원의 펀딩</p>
			<p class="info">명의 서포터</p>
			<button class="btn-fund">펀딩하기</button>

			<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<button class="btn-like btn btn-default">
					<i class="fa fa-2x fa-heart-o" aria-hidden="true"></i>
				</button>
				<button class="btn-share btn btn-default">
					<i class="fa fa-2x fa-share" aria-hidden="true"></i>
				</button>
			</div>

			<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12 box">
				<p
					style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">메이커
					정보</p>
				<div class="makerbox">프로필 사진이랑 자기소개 불러오는 칸</div>
			</div>

			<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
				<p
					style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
					<ul class="makerbox">
						<li>원</li>
						<li>작성자이름</li>
						<li>품목</li>
						<li>배송비</li>
						<li>리워드 제공 예상일</li>
						<li>제한 수량</li>
						<li>현재 개 남음</li>
					</ul>
			</div>
			<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
					<ul class="makerbox">
						<li>원</li>
						<li>작성자이름</li>
						<li>품목</li>
						<li>배송비</li>
						<li>리워드 제공 예상일</li>
						<li>제한 수량</li>
						<li>현재 개 남음</li>
					</ul>
			</div>
			<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ul class="makerbox">
						<li>원</li>
						<li>작성자이름</li>
						<li>품목</li>
						<li>배송비</li>
						<li>리워드 제공 예상일</li>
						<li>제한 수량</li>
						<li>현재 개 남음</li>
					</ul>
			</div>
		</div>
	</div>



</body>
</html>