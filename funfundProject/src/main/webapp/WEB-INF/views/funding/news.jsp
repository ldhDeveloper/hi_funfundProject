<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.makerinfo {
	display: inline-block;
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

#btn-like {
	background: white;
}

.block {
	border-top: 1px solid #e4;
	border-bottom: 1px solid #e4;
	display: block;
	margin-bottom: 20px;
}

.datanum {
	display: block;
	margin-bottom: 10px;
	font-size: 20px;
}

.datatitle {
	display: inline-block;
	font-size: 20px;
}

.ddate {
	display: inlne-block;
	font-size: 12px;
}
</style>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
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

		var co = '<c:out value="${item.pcontent}"/>';
		$("#content").html(co);

	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h4 align="center" class="font">
				<em>${item.category }</em> <strong>${item.pshort }</strong> 프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font">${item.pname}</h2>
		</div>
	</div>

	<div align="center">
		<ul class="w3-border-bottom w3-border-gray">
			<li class="active"><a href="detail.it?pro_no=${param.pro_no }">스토리</a></li>
			<li><a href="reply.ask?pro_no=${param.pro_no }">댓글( )</a></li>
			<li><a href="news.up?pro_no=${param.pro_no}">새소식( )</a></li>
		</ul>
	</div>

	<button id="viewon" class="hidden-lg hidden-md visible-sm visible-xs">이
		프로젝트 펀딩하기</button>


	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 box2"
		style="padding: 10px;">
		<!-- 업데이트 글 작성 영역 -->
		<c:forEach var="update" items="${pList}">
			<div class="block">
				<span class="datanum">#${update.upno }</span> <span
					class="datatitle">${update.uptitle}</span> <span class="ddate">
					<fmt:formatDate value="${update.uploaddate}" var="date"
						pattern="yyyyMMdd" /> ${date }
				</span>
				<div class="content">${update.upname }</div>
				<hr>
			</div>
		</c:forEach>
	</div>

	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
		<div class="box2 info">
			<p class="box2">
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" var="now" pattern="yyyyMMdd" />
				<fmt:formatDate value="${item.pedate}" var="date" pattern="yyyyMMdd" />
				${now - date} 일 남음
			</p>
			<em class="infoBar"></em>
			<p class="info">
				<fmt:formatNumber value="${item.ecost}" var="cost" type="percent" />
				% 달성
			</p>
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
			<div class="makerbox2">
				<div class="makerinfo">사진</div>
				<div class="makerinfo">${item.cname }</div>
				<div>
					<p>문의처</p>
					<div class="makerinfo">${item.cs_email}</div>
					<div class="makerinfo">${item.cs_phone}</div>
				</div>
			</div>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">베스트
				서포터</p>
			<div class="makerbox2">
				<%-- <div class="makerinfo">사진</div>
				<div class="makerinfo">${item.cname }</div>
				<div>
					<p>문의처</p>
					<div class="makerinfo">${item.cs_email}</div>
					<div class="makerinfo">${item.cs_phone}</div>
				</div> --%>
			</div>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<div class=""></div>
			<c:forEach var="reword" items="${mList}">
				<ul class="makerbox">
					<li style="font-size: 15pt;"><strong>${reword.mcost}원</strong></li>
					<li class="makerinfo">작성자이름
						<dl>${item.pname}</dl>
					</li>
					<li class="makerinfo">품목
						<dl>${reword.mname}</dl>
					</li>
					<li class="makerinfo">배송비</li>
					<dl>원
					</dl>
					<li class="makerinfo">리워드 예상일
						<dl>${reword.mdate}</dl>
					</li>
					<li class="makerinfo">제한 수량</li>
					<dl>${reword.mcount }개
					</dl>
					<li class="makerinfo">현재 개 남음</li>
					<dl></dl>
				</ul>
			</c:forEach>
		</div>
		<div>
			<button class="btn-fund">펀딩하기</button>
		</div>
	</div>


</body>
</html>