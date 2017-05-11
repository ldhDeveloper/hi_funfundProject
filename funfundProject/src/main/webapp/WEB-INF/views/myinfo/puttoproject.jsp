<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.container{
	width: 100%;
}

.row {
	width: 100%;
}

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
	height: 100px;
}

.minfo {
	position: relation;
	z-index: 5px;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	background-color: #F8F8F8;
	width: 100%;
	height : 20%;
	padding-top: 3%;
	padding-left: 8%;
	padding-right: 8%;
	padding-bottom: 3%;
}

.mtablestart {
	width: 100%;
}

.mrow {
	width: 220px;
	padding-top: 7%;
}

.mname {
	position: relation;
	z-index: 10px;
	font-size : 1vw;
	font-weight: bold;
	width: 60%;
	text-align: center;
	color: #4D525B;
}

.mgrade {
	width: 80%;
	position: relation;
	z-index: 20px;
	background-color: #3DB8CC;
	border-radius: 5px;
	color: #fff;
	box-shadow: 2px 2px #AFAFAF;
	border: none;
	text-align: center;
	padding-top: 2%;
	font-size: 1vw;
}

.mbtn1 {
	position: relation;
	z-index: 20px;
	background-color: #3DB8CC;
	border-radius: 5px;
	width: 80%;
	color: #fff;
	box-shadow: 2px 2px #AFAFAF;
	border: none;
	text-align: center;
	font-weight: bold;
	font-size: 1vw;
	padding-top: 2%;
}

.mmenu {
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	background-color: #F8F8F8;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	width: 100%;
	height : 900px;
	padding-top: 2%;
}

.fun-menu{
	color:teal !important;
}

/* .puttoReward {
	padding-top: 5%;
	padding-left: 10%;
}

.puttoInvest {
	padding-top: 5%;
	padding-left : 10%;
}

.reward {
	background-color: #25B187;
	width: 40%;
	height: 28px;
	font-size: 1vw;
	color: #fff;
	border-radius: 15px 50px;
}

.invest {
	background-color: #119DB1;
	width: 40%;
	height: 28px;
	font-size: 1vw;
	color: #fff;
	border-radius: 15px 50px;
}

.notPutReward {
	padding-top: 4%;
	padding-left: 10%;
	padding-bottom: 4%; 
	color: #787878;
}

.notPutInvest {
	padding-top: 4%;
	padding-left: 10%;
	padding-bottom: 4%; 
	color: #787878;
}

.line{
	border-bottom: 1px solid #ddd;
} */

</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<br><br>
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="mlabel"></div>
				
				<div class="minfo">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><img class="img-circle img-responsive" src="images/육찡.jpg" style="max-width:170px;max-height:170px; width:170px; heigh:150px;"><!-- 사진 값이 들어갈 곳  --></div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow mname" align="center">회원명 | 육성재<!-- 회원 이름이 들어갈 곳 --></div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">개인 일반 회원 <!-- 회원 등급이 들어갈 곳  --></label></div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input type="button" class="mbtn1" value="투자 회원 신청"></div>
					</div>
				</div>
				
				<div class="mmenu">
					<nav class="navbar navbar-default">
  						<div class="container-fluid">
    						<div class="navbar-header">
      							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        							<span class="sr-only">Toggle navigation</span>
        							<span class="icon-bar"></span>
        							<span class="icon-bar"></span>
        							<span class="icon-bar"></span>
      							</button>
      							
      							<a class="navbar-brand">회원 메뉴</a>
    						</div>

    						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      							<ul class="nav navbar-nav">
      								<li><a href="myinfo.do" class="w3-hover-teal">회원 정보 설정</a></li>
        							<li><a href="sellerinfo.do" class="w3-hover-teal">판매자 정보 변경</a></li>
        							<li><a href="joinproject.do" class="w3-hover-teal">참여한 프로젝트</a></li>
        							<li class="active"><a href="puttoproject.do">찜한 프로젝트<span class="sr-only">(current)</span></a></li>      							        							        							
        							<li><a href="newproject.do" class="w3-hover-teal">개설한 프로젝트</a></li>
        							<li><a href="myfunding.do" class="w3-hover-teal">나의 펀딩 현황</a></li>
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<div class="panel-group">
						<div class="well">
	  						<div class="panel panel-success">
      							<div class="panel-heading">리워드형 프로젝트</div>
      							<div class="panel-body">아직 찜한 프로젝트가 없습니다.</div>
    						</div>
    					</div>
    		    					
    					<br>
    					
    					<div class="well">  					
    						<div class="panel panel-info">
      							<div class="panel-heading">투자형 프로젝트</div>
      							<div class="panel-body">아직 찜한 프로젝트가 없습니다.</div>
    						</div>
    					</div>
  					</div>										
				</div>				
			</div>
		</div>
	</div>
</div>

<br><br>

</body>
</html>