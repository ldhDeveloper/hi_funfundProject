<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.container{
	width: 100%;
	padding-left: -15px !important;
	padding-right: -15px !important;	
}

.row {
	width: 100%;
	margin-left: 0px !important;
	margin-right: 0px !important;
}

.mlabel {
	border: 1px solid #ddd;
	background-color: #24B3A8;
	background: linear-gradient(to right, #24B3A8, #58CEB0, #2AC594);
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	width: 100%;
	height: 80px;
	color: #fff;
	font-size: 26pt;
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
	font-weight: bold;
	width: 60%;
	text-align: center;
	color: #4D525B;
}

.mgrade {
	width: 80%;
	position: relation;
	z-index: 20px;
	/* background-color: #3DB8CC;
	border-radius: 5px;
	color: #fff;
	box-shadow: 2px 2px #AFAFAF;
	border: none; */
	text-align: center;
	padding-top: 2%;
	font-size: 1.3em;
	padding-left: 5%;
	margin-left: 80%;
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

.mfth1{
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	width: 45%;
}

.mfth {
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	width: 15%;
}

.mftd, .pedate {
	text-align: center;
	cursor:pointer;
	border-bottom: 1px solid #dff0d8;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	
}

.mftdrL {
	border-bottom : 1px solid #ddd;
}

.tableStart {
	width: 98%;
	padding-left: 2%;
}

.state {
	border: none;
	border-radius: 15px;
	background-color: #E25253;
	width: 40%;
	color: white;
	padding: 0.8%;
}

.mfthr {
	border-top: 3px solid #dff0d8;
	border-bottom: 3px solid #dff0d8;
}

/* 후원 */
.mfsth1 {
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	width: 45%;
}

.mfsth {
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	width: 15%;
}

.mfstd, .spedate {
	text-align: center;
	cursor:pointer;
	border-bottom: 1px solid #D9EDF7;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	
}

.sstate {
	border: none;
	border-radius: 15px;
	background-color: #E25253;
	width: 40%;
	color: white;
	padding: 0.8%;
}

.mfstdrL {
	border-bottom : 1px solid #ddd;
}

.mfsthr {
	border-top: 3px solid #D9EDF7;
	border-bottom: 3px solid #D9EDF7;
}
.nameId {
	font-size: 1.3em;
	width: 200px;
	padding-top: 1.8%;
	color: #4A4A4A;
	margin-left: 40%;
}
</style>



<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<script type="text/javascript">
	$(function() {
		$(".mftdrL").click(function() {
			location.href = "myfundingDetail.fl?fund_no=" + $(this).find(".fundNo").val();
		});
		
		$(".mfstdrL").click(function() {
			location.href = "myfundingSponDetail.fl?fund_no=" + $(this).find(".fundNo").val();
		});
	});	
</script>

<div class="hidden-xs" style="height:85px;">&nbsp;</div>
<div class="container">
	<div class="row">
				<div class="mlabel" align="center">
					<div class="hidden-lg hidden-md" style="height:10px;">&nbsp;</div>
					회원 정보 보기
				</div>
				
				<div class="minfo">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-7">
						<c:if test="${empty sessionScope.account.pimage }">
						<img class="img-circle img-responsive" src="images/myinfo/basic.png" style="margin-left:30%; max-width:170px;max-height:170px; min-width:170px; min-height:170px;width:170px; heigh:170px;"><!-- 사진 값이 들어갈 곳  -->
						</c:if>
						<c:if test="${!empty sessionScope.account.pimage }">
						<img class="img-circle img-responsive" src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" style="margin-left:30%; max-width:170px;max-height:170px; min-width:170px; min-height:170px;width:170px; heigh:170px;"><!-- 사진 값이 들어갈 곳  -->
						</c:if>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-11 mrow mname" align="center">
							<label class="nameId"><b class="hidden-lg hidden-md" style="margin-left: -65%;">&nbsp;</b>
							회원명 | <c:if test="${ empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.account.nickname }" readonly/>
		                 			</c:if>
		                 			
		                 			<c:if test="${ !empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.party.pname }" readonly/>
		                 			</c:if>
		       				</label>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-11 mrow" align="center"><b class="hidden-lg hidden-md" style="margin-left: -80%;">&nbsp;</b><label class="mgrade">회원등급 | ${ sessionScope.account.idtype }</label></div>
						<%-- <c:choose>
        					<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청'}">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input id="investApply" type="button" class="mbtn1" value="투자 회원 신청"></div>
							</c:when>
						</c:choose> --%>
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
      							
      							<a class="hidden-lg hidden-md navbar-brand" style="font-size: 25pt; padding-top: 6%; padding-left: 10%;">회원 메뉴</a>
    						</div>

    						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      							<ul class="nav navbar-nav">
      								<li><a href="myinfo.ao" class="otherActive">회원 정보 설정</a></li>
      								
      								<c:choose>
        									<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청중'}">
												<li><a id="investApply" class="otherActive" style="cursor:pointer;">투자 회원 신청</a></li>
											</c:when>
									</c:choose>
      								
        							<c:choose>
        									<c:when test="${ sessionScope.account.idtype == '판매자'}">
        										<li><a href="sellerinfo.ao" class="otherActive">판매자 정보 수정<span class="sr-only">(current)</span></a></li>
        									</c:when>
        							</c:choose>
        							
									<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
										
									<c:choose>
        								<c:when test="${ sessionScope.account.idtype == '판매자'}">
											<li><a href="newproject.ao" class="otherActive">개설한 리워드형 프로젝트</a></li>
											<li><a href="newsponproject.ao" class="otherActive">개설한 후원형 프로젝트</a></li>
										</c:when>
									</c:choose>
									
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
      							
      							
      							<c:if test="${ empty mfList }">
      								<div class="panel-body">아직 참여한 프로젝트가 없습니다.</div>
      							</c:if>
      							      							
      							
								
      							<c:if test="${ ! empty mfList }">
      								<br>
      								
									<div class="tableStart">
										<table class="table table-hover">
    										<thead>
      											<tr class="mfthr">
        											<th class="mfth1">참여 프로젝트</th>
        											<th class="mfth">마감날짜</th>
        											<th class="mfth">금액</th>
        											<th class="mfth">결제</th>
      											</tr>
    										</thead>
   
    										<tbody>
    											<c:forEach var="fundList" items="${ mfList }" varStatus="status">
    																							
    											<tr class="mftdrL">
      												<td class="mftd" style="display:none;"><input class="fundNo" type="hidden" value="<c:out value='${ fundList.fund_no }'/>"/></td>
        											<td class="mftd"><b class="state" id="progress<c:out value='${status.index}'/>"></b>&nbsp;&nbsp;&nbsp;${ fundList.pname }</td>
        											<td class="pedate">${ fundList.pedate }</td>
        											<td class="mftd">${ fundList.sumcost }원</td>
        											<td class="mftd">${ fundList.funstatus }</td>
      											</tr>
      											
      											<script type="text/javascript">
													$(function(){
														var d = new Date();
														var pedate = new Date("<c:out value='${fundList.pedate}'/>");
														
														var today = new Date(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());										
														
														var progress = pedate.getTime() - today.getTime();				
					
														if(progress >= 0) {
															$("#progress<c:out value='${status.index}'/>").html("진행중");		
														}
													
														else {
															$("#progress<c:out value='${status.index}'/>").html("마 감").css({"background-color" : "#C1C1C1", "color" : "#F1F1F1"});		
														}																						
													});
												</script>												
      											</c:forEach>
    										</tbody>   										
  										</table>
  										<br><br>
  										
  									</div>
  									
  									</c:if>
  									
    						</div>
    						
    						<br>
    						
    						<div class="alert alert-info">
  								<h6>* 참여프로젝트를 클릭하시면 참여상세 내역에서 마감날짜/청약상태 등을 보실 수 있습니다.</h6>
							</div>
    					   					
    						<div class="panel panel-info">
      							<div class="panel-heading">후원형 프로젝트</div>
      							
      							<c:if test="${ empty mfsList }">
      								<div class="panel-body">아직 참여한 프로젝트가 없습니다.</div>
      							</c:if>
      							
      							<c:if test="${ ! empty mfsList }">
      							<br>	
									<div class="tableStart">
										<table class="table table-hover">
    										<thead>
      											<tr class="mfsthr">
        											<th class="mfsth1">참여 프로젝트</th>
        											<th class="mfsth">마감날짜</th>
        											<th class="mfsth">금액</th>
        											<th class="mfsth">결제</th>
      											</tr>
    										</thead>
   
    										<tbody>
    											<c:forEach var="sponList" items="${ mfsList }" varStatus="status">
    																							
    											<tr class="mfstdrL">
      												<td class="mfstd" style="display:none;"><input class="fundNo" type="hidden" value="<c:out value='${ sponList.fund_no }'/>"/></td>
        											<td class="mfstd"><b class="sstate" id="sprogress<c:out value='${status.index}'/>"></b>&nbsp;&nbsp;&nbsp;${ sponList.pname }</td>
        											<td class="spedate">${ sponList.pedate }</td>
        											<td class="mfstd">${ sponList.sumcost }원</td>
        											<td class="mfstd">${ sponList.funstatus }</td>
      											</tr>
      											
      											<script type="text/javascript">
													$(function(){
														var d = new Date();
														var pedate = new Date("<c:out value='${sponList.pedate}'/>");
														
														var today = new Date(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());										
														
														var progress = pedate.getTime() - today.getTime();				
					
														if(progress >= 0) {
															$("#sprogress<c:out value='${status.index}'/>").html("진행중");		
														}
													
														else {
															$("#sprogress<c:out value='${status.index}'/>").html("마 감").css({"background-color" : "#C1C1C1", "color" : "#F1F1F1"});		
														}																						
													});
												</script>      											
      											</c:forEach>
    										</tbody>   										
  										</table>										
  									</div>
  								</c:if>    							
    						</div>
    					</div>
    					
    		
      					
    						
    						<script type="text/javascript">
    						$("#investApply").click(function(){
								var name ='<c:out value="${sessionScope.party.pname}"/>';
								console.log(name)
								if(name == "") {
									alert("회원정보 설정에서 이름을 반드시 입력하세요!                                  이름은 반드시 실명을 입력하셔야 합니다.                                         그렇지 않을 경우 승인이 거부될 수 있습니다.");
									return false;
								}
								
								else {
									location.href = "sellerinfo.ao";
								}
							});
    					</script>
    					
  					</div>										
				</div>				
	</div>
</div>

<br><br><br>
<footer>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true" />
</footer>
</body>
</html>