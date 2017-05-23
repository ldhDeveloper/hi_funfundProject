<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 80px;
	color: #fff;
	font-size: 2vw;
	padding-top: 1.5%;
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
	color:#3BBFAB !important;
}

.act {
	background-color: #28B5A9;	
}

.active {
	color: white !important;
	font-weight: bold;
}

.otherAct {
	background-color: #55CDAE;
}

.otherActive:hover{
	background-color: #31C698 !important;
	color: white !important;
	font-weight: bold;
}

.bar:hover {

}

.mnameText {
	border: none;
	color: #4D525B;
	width: 40%;
	background-color: #F8F8F8;
}

.myItemList{
	margin : 0px !important;
	padding : 0px !important;
}

.myListMargin{
	margin-top : 15px !important;
	margin-bottom : 15px !important;
}
</style>
<script>

</script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<br><br>
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="mlabel" align="center">회원 정보 보기</div>
				
				<div class="minfo">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
						<c:if test="${empty sessionScope.account.pimage }">
						<img class="img-circle img-responsive" src="images/myinfo/basic.png" style="max-width:170px;max-height:170px; width:170px; heigh:150px;"><!-- 사진 값이 들어갈 곳  -->
						</c:if>
						<c:if test="${!empty sessionScope.account.pimage }">
						<img class="img-circle img-responsive" src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" style="max-width:170px;max-height:170px; width:170px; heigh:150px;"><!-- 사진 값이 들어갈 곳  -->
						</c:if>
						</div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow mname" align="center">
							회원명 | <c:if test="${ empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.account.nickname }" readonly/>
		                 			</c:if>
		                 			
		                 			<c:if test="${ !empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.party.pname }" readonly/>
		                 			</c:if>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">개인 일반 회원 <!-- 회원 등급이 들어갈 곳  --></label></div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input type="button" class="mbtn1" value="투자 회원 신청" onclick='location.href="investRequest.ao"'></div>
					</div>
				</div>
				
				<div class="mmenu">
					<nav class="navbar navbar-default">
  						<div class="container-fluid">
    						<div class="navbar-header">
      							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        							<span class="sr-only">Toggle navigation</span>
        							<span class="bar">▼</span>
      							</button>
      							
      							<a class="hidden-lg hidden-md navbar-brand">회원 메뉴</a>
    						</div>

    						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      							<ul class="nav navbar-nav">
      								<li><a href="myinfo.ao" class="otherActive">회원 정보 설정</a></li>
        							<li><a href="sellerinfo.ao" class="otherActive">판매자 정보 변경</a></li>
        							<li><a href="joinproject.ao" class="otherActive">참여한 프로젝트</a></li>
        							<li class="act"><a class="active" href="puttoproject.ao">찜한 프로젝트<span class="sr-only">(current)</span></a></li>      							        							        							
        							<li><a href="newproject.ao" class="otherActive">개설한 프로젝트</a></li>
        							<li><a href="myfunding.ao" class="otherActive">나의 펀딩 현황</a></li>
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<div class="panel-group">
						<div class="well">
	  						<div class="panel panel-success">
      							<div class="panel-heading">찜한 리워드형 프로젝트</div>
      							<div class="row myItemList">
      							<c:if test="${empty iList}">
      							<div class="panel-body">아직 찜한 프로젝트가 없습니다.</div>
      							</c:if>
      							<c:if test="${!empty iList }">
      								<c:forEach var="item" items="${iList }" varStatus="status">
      										<script>
										$(function(){
											var ecost = "<c:out value='${item.ecost}'/>";
											var fundamount = "<c:out value='${item.fundamount}'/>"
											var persent = Math.round(fundamount * 100 / ecost);
											var bar=0;
											if(persent > 100){
												bar=100;
											} else {
												bar=persent;
											}
											var edate = new Date("<c:out value='${item.pedate}'/>");
											var todate = new Date();
											var btMs = edate.getTime() - todate.getTime() ;
										    var btDay = Math.round(btMs / (1000*60*60*24)) ;

											console.log(persent);
											$("#persent<c:out value='${status.index}'/>").text(persent);
											$("#progressbar<c:out value='${status.index}'/>").attr("aria-valuenow", persent);
											$("#progressbar<c:out value='${status.index}'/>").css("width", bar + "%");
											$("#edate<c:out value='${status.index}'/>").text(btDay);
											
											if(btDay < 0){
												$("#edate<c:out value='${status.index}'/>").hide();
												$("#yet<c:out value='${status.index}'/>").hide();
												$("#complete<c:out value='${status.index}'/>").show();
												$("#conitemper<c:out value='${status.index}'/>").hide();
												$("#enditemper<c:out value='${status.index}'/>").show();
											} else {
												$("#complete<c:out value='${status.index}'/>").hide();
												$("#edate<c:out value='${status.index}'/>").show();
												$("#yet<c:out value='${status.index}'/>").show();
												$("#conitemper<c:out value='${status.index}'/>").show();
												$("#enditemper<c:out value='${status.index}'/>").hide();
												$("#itempanel<c:out value='${status.index}'/>").removeClass("panel-default");
												$("#itempanel<c:out value='${status.index}'/>").addClass("panel-primary");
											}
										})
									</script>
      										<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 myListMargin">
      											<div id="itempanel<c:out value='${status.index}'/>" class="panel panel-default">
      													
													  <div id="conitemper<c:out value='${status.index}'/>" class="panel-heading panel-primary">진행중</div>
													  <div id="enditemper<c:out value='${status.index}'/>" class="panel-heading">펀딩 종료</div>
													  <div class="panel-body">
													    <div class="thumbnail" align="center">
							<a href="detail.it?pro_no=<c:out value="${item.pro_no}"/>"> <img
								src="/funfund/images/funding/thumbnail/<c:out value="${item.thumbnail }"/>" alt="사진1"
								style="width: 100%">
																<div id="progress<c:out value='${status.index}'/>" class="progress">
									<div class="progress-bar progress-bar-warning"
										id="progressbar<c:out value='${status.index}'/>"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="<c:out value="${item.ecost}"/>" style="width: 60%;">
										<span class="sr-only"></span>
									</div>
								</div>
								<p>
									<span id="persent<c:out value='${status.index}'/>"></span> % &nbsp;&nbsp; <span><c:out value="${item.fundamount }"/></span>원 달성 &nbsp;&nbsp; 
									<span id="edate<c:out value='${status.index}'/>"></span>
									<span id="yet<c:out value='${status.index}'/>">일 남음</span>
									<span id="complete<c:out value='${status.index}'/>">펀딩종료</span>
								</p>

								<div class="caption">
									<p>
										<c:out value="${item.pcontent }" />
									</p>
									<span><c:out value="${item.category}" /></span>
								</div>
							</a>
						</div>
													  </div>
												</div>
      										</div>
      									
      								</c:forEach>
      								</c:if>
      							</div>
    						</div>
    					</div>
    		    					
    					<br>
    					
    					<div class="well">  					
    						<div class="panel panel-info">
      							<div class="panel-heading">찜한 투자형 프로젝트</div>
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