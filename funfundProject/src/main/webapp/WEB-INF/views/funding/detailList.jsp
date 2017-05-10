<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="">
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
	float: left;
	padding: 10px;
	text-align: center;
}

.font {
	color: white;
}

.align {
	margin: auto;
	width: auto;
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
		<div class="row">
			<img src="images/funding/.png" class="img-responsive">
		</div>
		<div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<p> 일 남음</p>
		</div>
	</div>


</body>
</html>