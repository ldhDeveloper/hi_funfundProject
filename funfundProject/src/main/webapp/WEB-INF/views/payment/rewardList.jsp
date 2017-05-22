<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewardList</title>
<style>
.background {
	background: #ff9966;
	padding: 20px;
	color: white;
}

ol li {
	list-style: none;
}

#guide {
	text-align: center;
	padding: 20px;
}

.rewardList {
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />

	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<a style="text-align: left; font-size: 11pt"
				href="detail.it?pro_no=${item.pro_no }"><i
				class="fa fa-angle-left" aria-hidden="true"></i> 스토리로 돌아가기</a>
			<h4 align="center" class="font">
				<em>${item.category }</em> <strong>${item.pshort }</strong> 프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font">${item.pname}</h2>
		</div>
	</div>

	<div>
		<div id="guide">리워드 선택 결제 예약</div>

		<form method="post" id="" name="">
			<div class="rewardList">
				<input type="checkbox" name="menu" value=""> <label
					for="checkbox">원 펀딩합니다.</label> <input type="checkbox" name="menu"
					value=""> <label for="checkbox">원 펀딩합니다.</label> <input
					type="checkbox" name="menu" value=""> <label for="checkbox">원
					펀딩합니다.</label>
			</div>
		</form>



	</div>


</body>
</html>