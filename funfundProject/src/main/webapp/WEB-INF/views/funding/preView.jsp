<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<title>detailList</title>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="/funfund/lib/css/common/font.css" rel="stylesheet">
<!-- bxSlider Javascript file -->
<script src="/funfund/lib/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/funfund/lib/css/jquery.bxslider.css" rel="stylesheet" />
<style>
.background {
	background-color: #000033;
	padding: 20px;
	margin: 10px;
}

ul {
	list-style: none;
	padding: 10px;
	width: 100%;
	align: center;
}

li {
	text-align: center;
	display: inline-block;
}

.font {
	color: white;
	font-family: ten !important;
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
	padding-top: 10px;
}

#box2 {
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
	display: inline-block;
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

.makerinfo {
	padding: 10px;
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

#content {
	box-sizing: content-box;
	margin: 10px;
}

#btn-like {
	background: white;
}

.supportinfo {
	display: inline-block;
	padding: 15px;
}

#scrollbutton {
	position: fixed;
	right: 20px;
	width: 3%;
	text-align: center;
	display: none;
	border-radius: 10px;
	border: none;
}

.img {
	display: inline-block;
	width: 40px;
	height: 40px;
}

body {
	font-family: myFirstFont !important;
}


</style>
<script type="text/javascript">
	$(function() {

		console.log('${item.pcontent}');
		$("#content").html('${item.pcontent}');

		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$('#scrollbutton').fadeIn("slow");
			} else {
				$("#scrollbutton").fadeOut("slow");
			}
		});

	})
</script>
<script>
  window.onload = function(){
	  
	  $('.bxslider').bxSlider({
		  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		  speed:1000, //default:500 이미지변환 속도
		  auto: true //default:false 자동 시작
		});
	  
  }
</script>

</head>
<body>
	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h4 align="center" class="font">
				<span class="catename"><c:out value="${item.category}" /></span>
				${item.pshort}
				프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font">${item.pname}</h2>
		</div>
	</div>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">스토리</a></li>
			<li><a href="#">댓글</a></li>
			<li><a href="#">새소식</a></li>
		</ul>
	</div>


	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 box2"
		style="padding: 10px;" align="center">
		<!-- video or slide작성영역 -->
		<c:if test="${!empty item.pvideo}">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/${item.pvideo }" frameborder="0"
					allowfullscreen></iframe>
			</div>
		</c:if>		
		
		<c:if test="${empty item.pvideo}">
			<div style="width:630px; height:400px;padding-top: 20px;">
				<ul class="bxslider" >
					<c:forEach var="slide" items="${sList}" varStatus="status">

						<c:choose>
							<c:when test="${status.first }">
								<li>
									<img
										src="/funfund/images/makeproject/slideimg/${slide.refname}">
								</li>
							</c:when>

							<c:otherwise>
								<li>
									<img
										src="/funfund/images/makeproject/slideimg/${slide.refname}">
								</li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</ul>

			</div>
		</c:if>

		<div id="content">${item.pshort}</div>
		<!-- 게시글작성영역 -->
		<div id="content"></div>
		<br> <br>
		<div align="left">
			<p style="font-size: 12pt; color: orange">
				<strong>프로젝트 환불정책</strong>
			</p>
			${item.refund}
		</div>
	</div>

	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
		<div class="box2 info">
			<p id="box2">0일 남음</p>
			<div id="progress" class="progress">

				<div class="progress-bar progress-bar-warning" id="progressbar"
					role="progressbar" aria-valuenow="60" aria-valuemin="0"
					aria-valuemax="" style="width: 80%;">
					<span class="sr-only"></span>
				</div>
			</div>
			<p class="info">0.0% 달성</p>
			<p class="info">0원의 펀딩</p>
			<p class="info">0명의 서포터</p>
			<button class="btn-fund pay">펀딩하기</button>
		</div>

		<div class="">
			<div style="text-align: center;">
				<button class="btn btn-default" id="btn-like">
					<i class="fa fa-heart-o" aria-hidden="true"></i>
				</button>
				<button class="btn btn-default backpink" id="btn-nonlike"
					style="display: none;">
					<i class="fa fa-heart-o" aria-hidden="true"></i>
				</button>
			</div>
		</div>



		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">메이커
				정보</p>
			<div class="makerbox2">
				<c:if test="${!empty item.pimage }">
					<img class="img" src="/funfund/images/myinfo/${item.pimage }">
				</c:if>
				<c:if test="${empty item.pimage }">
					<img class="img" src="/funfund/images/myinfo/dimages.png">
				</c:if>
				<div class="makerinfo">${item.cname }</div>
				<div>
					<div class="makerinfo">문의처</div>
					<div class="makerinfo">${item.cs_email}</div>
					<div class="makerinfo">${item.cs_phone}</div>
				</div>
			</div>


			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;"
				class="hidden-sm hidden-xs">베스트 서포터</p>
			<div class="makerbox2 hidden-sm hidden-xs"">
				<c:if test="${!empty bestList}">
					<c:forEach var="bestList" items="${bestList }">
						<div class="supportinfo">
							<p>
								<img src="/funfund/images/myinfo/${bestList.pimage }"
									class="img">
							</p>
							<p>${bestList.nickname }</p>
							<p>${bestList.mcost }원펀딩</p>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty bestList}">
				  아직 서포터가 존재하지 않습니다.
				</c:if>
			</div>
		</div>

		<!-- 뷰온버튼 -->
		<button id="scrollbutton" style="bottom: 50px; color: gray"
			class="hidden-sm hidden-xs">
			<i class="fa fa-angle-up fa-2x" aria-hidden="true"
				style="display: block; color: gray;"></i>TOP
		</button>

		<div class="hidden-sm hidden-xs">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<c:forEach var="reward" items="${mList}">
				<ul class="makerbox">
					<input type="hidden" value="${reward.mno}">
					<li style="font-size: 15pt;" class="makerinfo"><strong><fmt:formatNumber
								var="mcost" value="${reward.mcost}" /> ${mcost}원</strong></li>
					<li class="makerinfo">작성자이름
						<dl>${item.pname}</dl>
					</li>
					<li class="makerinfo">품목
						<dl>${reward.mname}</dl>
					</li>
					<li class="makerinfo">리워드 예상일
						<dl>${reward.mdate}</dl>
					</li>
					<li class="makerinfo">제한 수량
						<dl>${reward.mcount }개
						</dl>
					</li>

					<li class="makerinfo current">현재 <c:set var="result"
							value="${reward.remain}" /> <c:if test="${result > 0}">
					${result }</c:if> <c:if test="${result <= 0 }">
					0
					</c:if>개 남음
					</li>
				</ul>
			</c:forEach>
		</div>

		<div class="hidden-sm hidden-xs">
			<button class="btn-fund pay">펀딩하기</button>
		</div>
	</div>

</body>
</html>