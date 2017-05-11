<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.all {
	width: 100%;
	height: 700px;
	background-color: #F9F9F9;
	
}

.invest{
	padding-top: 5%;
}

.confirmBtn {
	border: none;
	background-color: #50E3C2;
	color: #fff;
	width: 100%;
	padding: 2%;
	height: 50px;
	font-size: 15pt;
}
</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>


<br>
<div class="all">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
			<div class="invest col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<h3>투자 서비스 신청</h3>
				<h5>투자 서비스를 신청하시면, 비상장 기업이 자금모집을 위해 진행하는 크라우드펀딩 증권형 프로젝트에 청약신청이 가능합니다. 청약신청부터 증권배정까지 와디즈 투자 서비스를 이용해보세요.</h5>
				<h6>투자서비스 이용을 위한 본인여부 확인이 필요합니다.</h6><br><br>
				<input type="button" value="휴대폰 본인인증" class="confirmBtn"><br><br><br>
				<h6>Funfund에서 본인인증을 진행함으로써 인증된 성명, 생년월일, 휴대폰번호 정보가 와디즈로 전달되어 회원정보로 저장됨을 동의합니다.</h6>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
		</div>		
	</div>
</div>


<br><br>



</body>
</html>