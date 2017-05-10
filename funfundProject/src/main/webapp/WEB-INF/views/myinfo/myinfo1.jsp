<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.mlabel {
	border: 1px solid #ddd;
	background-color: #24B3A8;
	/* background: -webkit-linear-gradient(left top, #24B3A8, #58CEB0, #2AC594);
	background: -o-linear-gradient(bottom right, #24B3A8, #58CEB0, #2AC594);
	background: -moz-linear-gradient(bottom right, #24B3A8, #58CEB0, #2AC594); */
	background: linear-gradient(to right, #24B3A8, #58CEB0, #2AC594);
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	width: 100%;
	height: 70px;
}

.minfo {
	position: relation;
	z-index: 5px;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	background-color: #F8F8F8;
	width: 100%;
	height : 150px;
	padding-top: 3%;
	padding-left: 5%;
	padding-bottom: 5%;
}

.mmenu {
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	background-color: #F8F8F8;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	width: 100%;
	height : 600px;
}

.mtablestart {
	width: 100%;
}

.mtable {
	padding-left: 5%;
	width: 100px;
	height: 100px;
	 
}

.mphoto {
	position: relation;
	width: 100px;
	height: 100px;
	border-radius: 50px;
	-moz-border-radius: 50px;
	-ms-border-radius: 50px;
	-khtml-border-radius: 50px;
	-o-border-radius: 50px;
	z-index: 10px;
	background-color: #512DA8;
	color: #fff;
	font-size : 20pt;
	text-align: center;
	padding-top: 1.6%;
}

.mname {
	position: relation;
	z-index: 10px;
	padding : 5%;
	font-size : 15pt;
	font-weight: bold;	
}

.mgrade {
	width: 80%;
	height: 10%;
	position: relation;
	z-index: 20px;
	border: 1px solid #8CD4BE;
	background-color: #fff;
	padding: 5%;
	text-align: center;
}

.mbtn1 {
	position: relation;
	z-index: 10px;
	/* padding : 5%; */
	padding-top: 1.5%;
	background-color: #3DB8CC;
	border-radius: 6px;
	width: 70%;
	height: 25px;
	color: #fff;
	box-shadow: 2px 2px #AFAFAF;
	border: none;
	text-align: center;
	font-weight: bold;
}

</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<br><br>

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		<div class="mlabel"></div>
		<div class="minfo">
			<table class="mtablestart">
				<tr class="mtable">
					<td class="mphoto">진항<!-- 사진 값이 들어갈 곳  --></td>
					<td class="mname">김진항<!-- 회원 이름이 들어갈 곳 --></td>
					<td><label class="mgrade">개인 일반 회원 <!-- 회원 등급이 들어갈 곳  --></label></td>
					<td><input type="button" class="mbtn1" value="투자 서비스 회원이 되세요"></td>
				</tr>
			</table>
			<!-- <div class="mphoto">진항사진 값이 들어갈 곳 </div>
			<p class="mname">김진항회원 이름이 들어갈 곳</p>
			<p class="mgrade">개인 일반 회원 회원 등급이 들어갈 곳 </p>
			<input type="button" class="mbtn1" value="투자 서비스 회원이 되세요"> -->
		</div>
		<div class="mmenu"></div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
</div>
</div>

<br><br>

</body>
</html>