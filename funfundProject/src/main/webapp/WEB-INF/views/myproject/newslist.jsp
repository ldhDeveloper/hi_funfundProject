<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새소식</title>
<!-- Include external CSS. -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">

<!-- Include Editor style. -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />
</head>
<style>
.itemImage {
	height: 300px;
	background-repeat: no-repeat;
	background-position: 50%;
	background-size: cover;
}

.itemImageBack {
	background: rgba(0, 0, 0, .5);
	/* background: linear-gradient(135deg,rgba(0,0,0,.7) 20%,transparent); */
	height: 300px;
}

.itemTextBox {
	padding-left: 3rem;
	padding-right: 3rem;
	padding-top: 3rem;
	line-height: .5;
}

.itemname {
	text-decoration: none;
	font-weight: 700;
	font-size: 1.7em;
	color: #fff;
	line-height: 1.4;
	text-shadow: 0 2px 2px rgba(0, 0, 0, .2);
}

.itemdetail {
	font-size: 1em;
	line-height: 1.5;
	color: #fff;
	padding-top: .4em;
	padding-left: 3rem;
	text-shadow: 0 2px 2px rgba(0, 0, 0, .2);
}

.menubox {
	position: relative;
	background: #fff;
	box-shadow: none;
	margin: 1rem 0;
	padding: 1em;
	border-radius: .28571429rem;
	border: 1px solid rgba(0, 0, 0, .1);
}

.block {
	text-align: left;
}

.datanum {
	display: block;
	font-size: 20px;
}

.datatitle {
	display: inline-block;
	margin-bottom: 20px;
	font-size: 20px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<script>
		$(function() {
			var pro_no = "<c:out value='${proItem.pro_no}'/>";
			var ecost = "<c:out value='${proItem.ecost}'/>";
			var fundamount = "<c:out value='${proItem.fundamount}'/>";
			var persent = fundamount / ecost * 100;
			console.log("persent : " + persent);
			$("#itemPersent").html(persent + " %");
			
		});
	</script>
	<div style="background-color: #F6F5F5">
		<div class="row" style="position: relative">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div id=itemImage class="itemImage"
					style="background-image: url(images/funding/thumbnail/${proItem.thumbnail });">
					<div class="itemImageBack">
						<div class="itemTextBox">
							<a class="itemname"><c:out value="${proItem.pname }" /></a> <br>
							<br>
						</div>
						<div class="itemdetail">
							<b>모인 금액</b>&nbsp;&nbsp;<span><c:out
									value="${proItem.fundamount }" />&nbsp;원</span><br> <b>달성률</b>&nbsp;&nbsp;<span
								id="itemPersent"></span><br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="top: -7.0rem; position: relative;">
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
			<div class="col-xs-10 col-sm-10 col-md-8 col-lg-8 menubox">
				<div class="middle-submenu">
					<ul class="nav nav-pills middle-submenu"
						style="width: 900px; align: center;">
						<li id="info1"><a
							href="myproject.fl?pro_no=${proItem.pro_no }">펀딩현황</a></li>
						<li id="info2" class="active-active"><a
							href="mynewsup.up?pro_no=${proItem.pro_no }">새소식</a></li>
						<li id="info3"><a
							href="myprojectnews.fl?pro_no=${proItem.pro_no }">새소식쓰기</a></li>
						<li id="info4"><a href="#">댓글</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
		<div class="container">
			<c:if test="${empty pList }">
		   새소식이 없습니다.
			</c:if>
			<c:if test="${!empty pList }">
				<c:forEach var="update" items="${pList}">
					<div class="block">
						<div class="datanum">#${update.upno }</div>
						<span class="datatitle"
							style="font-size: 20px; margin-bottom: 10px;">${update.uptitle}</span>
						<span class="ddate" style="font-size: 12px"> <fmt:formatDate
								value="${update.uploaddate}" var="date" pattern="yyyyMMdd" />
							${date }
						</span>
						<div class="content">${update.upname }</div>
						<hr>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>