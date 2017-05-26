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

.mfth {
	text-align: center;
}

.mftd {
	text-align: center;
	cursor:pointer;
}

.mftdrL {
	border-bottom : 1px solid #ddd;
}

.tableStart {
	width: 98%;
	padding-left: 2%;
	height: 100%;
}

.state {
	border: none;
	border-radius: 15px;
	background-color: #E25253;
	width: 40%;
	height: 25px;
	color: white;
	padding: 2%;
}

.mfthr {
	padding-top: 3%;
	padding-bottom: 3%;
}

.mftdr {
	padding-top: 3%;
	padding-bottom: 3%;
}

.choiceReward {
	border: none;
	background-color: #DFF0D8;
	padding-top: 3%;
	padding-bottom: 3%;
}

.mdtrs {
	border-top: 4px solid #DFF0D8;
	border-bottom: 1px solid #DFF0D8;
}

.mdtr {
	border-bottom: 1px solid #DFF0D8;	
}

.mdtd {
	background-color: #F3F3F3;
	padding-left: 30%;
	width: 20%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.mdtdv {
	padding-left: 10%;
	width: 80%;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.payment {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	padding-left: 30%;
	float: center;
}

.payth {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	padding-left: 10%;
	width: 33%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.paytd{
	width: 33%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
} 

.joinProject {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	padding-left: 10%;
	float: center;
}

.jpth {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	padding-left: 10%;
	width: 20%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.jptd {
	width: 20%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.joinProjecttr, .paymenttr, .mdtrf {
	border-bottom: 1px solid #DFF0D8;
}

.payBtn, .deliveryBtn, .joinBtn {
	border: 1px solid #28B5A9;
	background-color: #31C698;
	color: snow;
	float: right;
	border: none;
	border-radius: 20px;
	box-shadow: 2px 2px #ddd;
	height: 30px;
	text-size: 2vw;	
}

.optionBtn {
	border: 1px solid #28B5A9;
	background-color: #31C698;
	color: snow;
	border: none;
	border-radius: 20px;
	box-shadow: 2px 2px #ddd;
	height: 30px;
	text-size: 2vw;	
} 

label {
	font-size: 1vw;
}
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
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow mname" align="center">
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
        							<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
        							<li><a href="newproject.ao" class="otherActive">개설한 프로젝트</a></li>
        							<li class="act"><a class="active" href="myfunding.ao">나의 펀딩 현황<span class="sr-only">(current)</span></a></li>      							        							        							        							       							
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<div class="panel-group">
						<div class="well">
							<div class="alert alert-success">
  								<h6>* 참여프로젝트를 클릭하시면 참여상세 내역에서 결제방법/배송지/배송메모 등을 보실 수 있습니다.</h6>
							</div>
												
    						<div class="panel panel-success">
      							<div class="panel-heading">리워드형 프로젝트</div>
      							<!-- <div class="panel-body">아직 참여한 프로젝트가 없습니다.</div> -->
      							
      							<br><br>
      							
      							
  									
  							<div class="tableStart">
  									
  								<h3 align="center">결제 정보 변경 및 취소</h3>
      							
      							<form action="joinCancle.fl" method="post" enctype="multipart/form-data">
      							<input type="hidden" value="${ myfunding.fund_no }" name="fund_no">
      							<label id="delivery">참여한 프로젝트 정보</label><input class="joinBtn" type="submit" value="참여취소">
  									<br><br><br>
  									<table class="table">
    										<thead class="paddingGo">								
      											<tr class="joinProject">
        											<th class="jpth">주문번호</th>
        											<th class="jpth">리워드 프로젝트</th>
        											<th class="jpth">마감날짜</th>
        											<th class="jpth">참여금액</th>
        											<th class="jpth">결제상태</th>
      											</tr>
    										</thead>
    
    										<tbody class="paddingGo">
      											<tr class="joinProjecttr">
        											<td class="jptd">${ myfunding.fund_no }</td>
        											<td class="jptd"><b class="state" id="progress"></b>&nbsp;&nbsp;&nbsp;${ myfunding.pname }</td>
        											<td class="jptd">${ myfunding.pedate }</td>
        											<td class="jptd">${ myfunding.sumcost }원</td>
        											<td class="jptd">${ myfunding.funstatus }</td>
      											</tr>    										      											      											
    										</tbody>
  										</table>
  										
  										<script type="text/javascript">
											$(function(){
												var d = new Date();
												var pedate = new Date("<c:out value='${myfunding.pedate}'/>");
										
												var today = new Date(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());										
										
												var progress = pedate.getTime() - today.getTime();				
	
												if(progress >= 0) {
													$("#progress").html("진행중");		
												}
									
												else {
													$("#progress").html("마 감").css({"background-color" : "#C1C1C1", "color" : "#F1F1F1"});		
												}	
											});
										</script> 						
  										
  										</form>
  										<br><br><br>
  										
  										<div class="choiceReward">
  											<h3 align="center">선택한 리워드</h3>
  											
  											<p>&nbsp;&nbsp;&nbsp;${ myfunding.pname }</p>
  											<p>&nbsp;&nbsp;&nbsp;${ myfunding.fundcount }개 / ${ myfunding.mcost }원</p>
  											<p>&nbsp;&nbsp;&nbsp;옵션 : <input class="optionBtn" type="button" value="옵션 변경"/></p>
  										</div>
  										
  										<br><br><br>
  										
  										
  					
  									
  									<label id="delivery">결제정보</label><input class="payBtn" type="button" value="결제정보변경">
  									<br><br>
  									<table class="table">
    										<thead class="paddingGo">								
      											<tr class="payment">
        											<th class="payth">결제방법</th>
        											<th class="payth">결제정보</th>
        											<th class="payth">결제상태</th>
      											</tr>
    										</thead>
    
    										<tbody class="paddingGo">
      											<tr class="paymenttr">
        											<td class="paytd">${ myfunding.payment }</td>
        											<td class="paytd">${ myfunding.evidence }</td>
        											<td class="paytd">${ myfunding.funstatus }</td>
      											</tr>    										      											      											
    										</tbody>
  										</table>
  										
  										<br><br><br>
  										
  										<label id="delivery">배송지정보</label><input class="deliveryBtn" type="button" value="배송지정보변경">
  										<br><br>
  										<table class="table">
  											<tbody class="paddingGo">
      											<tr class="mdtrs">
        											<td class="mdtd">받으시는 분</td>
        											<td class="mdtdv">${ myfunding.recname }</td>
      											</tr>
      											
      											<tr class="mdtr">
        											<td class="mdtd">연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처</td>
        											<td class="mdtdv">${ myfunding.rephone }</td>
      											</tr>
      											
      											<tr class="mdtr">
        											<td class="mdtd">이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일</td>
        											<td class="mdtdv">${ sessionScope.account.email }</td>
      											</tr> 
      											
      											<tr class="mdtrf mdtr">
        											<td class="mdtd">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
        											<td class="mdtdv">${ myfunding.deladdress }</td>
      											</tr>    										      											      											
    										</tbody>
  										</table>
  									</div>  								
  								
  								<br>
    						</div>
    					</div>
    					
    					<br>
      					
      					<div class="well">
    						<div class="alert alert-info">
  								<h6>* 참여프로젝트를 클릭하시면 참여상세 내역에서 마감날짜/청약상태 등을 보실 수 있습니다.</h6>
							</div>
    					   					
    						<div class="panel panel-info">
      							<div class="panel-heading">투자형 프로젝트</div>
      							<div class="panel-body">아직 참여한 프로젝트가 없습니다.</div>
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