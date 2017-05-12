<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.min.css"
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
	padding-top: 10px;
	text-align: center;
	align: center;
}

.box2 {
	margin: 10px;
	padding-top: 10px;
}

.info {
	margin-bottom: 20px;
	text-align: center;
}

.infoBar {
	display: block;
	height: 3px;
	background: #fca84e;
	margin-bottom: 20px;
	width: 100%;
	padding-left: 20px;
}

.btn-fund {
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	color: #fff;
	background: #fca84e;
	border: none;
	margin-bottom: 20px;
	text-align: center;
	align: center;
}

button {
	curser: pointer;
}

#btn-like {
	display: inline-block;
	text-align: center;
}

#btn-share {
	display: inline-block;
	text-align: center;
}

.makerbox {
	padding: 20px 19px 20px;
	border: 1px solid #eaeaea;
	margin-bottom: 20px;
	width: 100%;
	align: center;
	display: block;
	text-align: center;
}

.makerbox2 {
	padding: 20px 19px 20px;
	border: 1px solid #eaeaea;
	margin-bottom: 20px;
	width: 100%;
	align: center;
	display: block;
	text-align: center;
}

.goal {
	color: #e39402;
	background: #fedb9a;
	max-width: 790px;
	padding: 10px;
}

.guide {
	color: #423c3b;
	background: #F9F7F5;
	max-width: 790px;
	padding: 10px;
}

.content {
	
}

#viewon {
	position: fixed;
	right: 5px;
	z-index: 100;
	top: 600px;
}

.backpink {
	background-color: #FFC4B7 !important;
	border-color: #ee7f69 !important;
}
</style>

<script>
	$(function() {
		$('#btn-like').click(function() {
			if ($(this).hasClass("backpink")) {
				$(this).removeClass("backpink");
			} else {
				$(this).addClass("backpink");
			}
		}).hover(function() {
			if ($(this).hasClass("backpink")) {
				$(this).removeClass("backpink");
			} else {
				$(this).addClass("backpink");
			}
		});

		$('.btn-fund').hover(
				function() {
					$('.btn-fund').css('background-color', '#fedb9a').css(
							'border-color', '#c96903');
				},
				function() {
					$('.btn-fund').css('background-color', '#fec250').css(
							'border-color', 'transparent');
				});

		$('.makerbox').hover(function() {
			$(this).css('background-color', '#c6ebd9');
		}, function() {
			$(this).css('background-color', 'white');
		});

	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h4 align="center" class="font">
				<em><c:out value="${item.category }"/></em> <strong></strong> 프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font"><c:out value="${item.cname}" /></h2>
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


	<!-- 모바일 뷰온버튼 -->
	<button id="viewon" class="hidden-lg hidden-md visible-sm visible-xs">이
		프로젝트 펀딩하기</button>


	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 box2"
		style="padding: 10px;">
		<div class="">
			<img src="/funfund/images/funding/face.PNG" class="img-responsive">
			<h3 style="margin: 30px;" class="hidden-sm hidden-xs">집에서도 전문 경락
				마사지를 즐길 수 있다면?에스테틱 전문샵 경력 20년의 베테랑의 모든 노하우를 집약한 매클러를 소개합니다.</h3>
			<h5 style="padding: 10px;" class="hidden-lg hidden-md"
				style="align:center">집에서도 전문 경락 마사지를 즐길 수 있다면?에스테틱 전문샵 경력 20년의
				베테랑의 모든 노하우를 집약한 매클러를 소개합니다.</h5>
			<div class="goal">
				<p>
					<strong>목표금액</strong>
				</p>
				<p>
					<strong>펀딩기간</strong>
				</p>
				<p style="color: #423c3b;">
					100% 모이지 않아도 리워드가 제공되는 프로젝트 이 프로젝트는 펀딩 마감일까지 목표 금액이 100% 모이지 않아도
					리워드가 제공되며, 결제가 진행됩니다. 리워드 제공 예상일은 <strong></strong> 입니다.
				</p>
			</div>
			<div class="guide">
				<p>
					<strong>펀딩결제안내</strong>
				</p>
				<p>
					펀딩 결제는 바로 진행되지 않고, 펀딩 마감일 다음 영업일인 <strong></strong> 에 모두 함께 진행됩니다.
				</p>
				<p>
					<strong>펀딩 취소 안내</strong>
				</p>
				<p>펀딩 마감일까지는 MY 페이지 [나의 펀딩현황]에서 언제든 펀딩 취소가 가능하지만, 마감일 이 후에는 리워드
					제작 및 배송이 시작되어 펀딩 취소가 불가합니다. 리워드 관련 환불 및 교환은 메이커가 정한 규정에 따르며, 스토리
					하단의 프로젝트 위험 요인과 해결 방안을 참고해주세요.</p>
			</div>

			<div class="content">소개 내용</div>
		</div>
	</div>

	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
		<div class="box2 info">
			<p class="box2">일 남음</p>
			<em class="infoBar"></em>
			<p class="info">% 달성</p>
			<p class="info">원의 펀딩</p>
			<p class="info">명의 서포터</p>
			<button class="btn-fund">펀딩하기</button>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-default" id="btn-like">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
			</button>
			<button class="btn btn-default" id="btn-share">
				<i class="fa fa-share" aria-hidden="true"></i>
			</button>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">메이커
				정보</p>
			<div class="makerbox2">프로필 사진이랑 자기소개 불러오는 칸</div>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<ul class="makerbox">
				<li>원</li>
				<li>작성자이름</li>
				<li>품목</li>
				<li>배송비</li>
				<li>리워드제공 예상일</li>
				<li>제한 수량</li>
				<li>현재 개 남음</li>
			</ul>
		</div>
		<div class="">
			<ul class="makerbox">
				<li>원</li>
				<li>작성자이름</li>
				<li>품목</li>
				<li>배송비</li>
				<li>리워드제공 예상일</li>
				<li>제한 수량</li>
				<li>현재 개 남음</li>
			</ul>
		</div>
		<div class="">
			<ul class="makerbox">
				<li>원</li>
				<li>작성자이름</li>
				<li>품목</li>
				<li>배송비</li>
				<li>리워드제공 예상일</li>
				<li>제한 수량</li>
				<li>현재 개 남음</li>
			</ul>
		</div>
		<div>
			<button class="btn-fund">펀딩하기</button>
		</div>
	</div>



</body>
</html>