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
	background: linear-gradient(to right, #24B3A8, #58CEB0, #2AC594);
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	width: 100%;
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
	width: 70%;
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
	padding-top: 2%;
}

.fun-menu{
	color:#3BBFAB !important;
}

.newproject {
	padding-top: 10%;
	padding-left: 40%;
	color: #787878;
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
	padding: 2%;
}

.mfth {
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
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
	padding: 2%;
}

.mfthr {
	border-top: 3px solid #dff0d8;
	border-bottom: 3px solid #dff0d8;
}

.panelStart {
	width: 100%;
}

.panelStart1{
	width: 100%;
}

.myItemList{
	margin : 0px !important;
	padding : 0px !important;
}

.mainlist {
	background-color: #31C698 !important;
	color: white;
}

.mlist:hover {
	background-color: #31C698 !important;
	color: white;
}

.listStart {
	
}

.lStart {
    background-color: #DFF0D8 !important;
    width: 88.3%;
    
}

.sidelist {
	background-color: #DFF0D8 !important;
	color: #3C763D;	
}

.slist:hover {
	background-color: #28B5A9 !important;
	color: white;
	border-radius: 0px !important;	
}

.pcontents {
	border: 1px solid #DFF0D8;
	width: 88.3%;
	border-bottom-right-radius: 4px !important;
	border-bottom-left-radius: 4px !important;
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
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">${ sessionScope.account.idtype }</label></div>
						<!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input type="button" class="mbtn1" value="투자 회원 신청" onclick="return goSellerinfo();"></div> -->
						<c:choose>
        					<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청'}">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input id="investApply" type="button" class="mbtn1" value="투자 회원 신청"></div>
							</c:when>
						</c:choose>
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
      								<c:choose>
        									<c:when test="${ sessionScope.account.idtype == '판매자'}">
        										<li><a href="sellerinfo.ao" class="otherActive">판매자 정보 수정<span class="sr-only">(current)</span></a></li>
        									</c:when>
        							</c:choose>
        							<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
        							<li class="act"><a class="active" href="newproject.ao">개설한 프로젝트<span class="sr-only">(current)</span></a></li>      							        							        							        							
        							<li><a href="myfunding.ao" class="otherActive">나의 펀딩 현황</a></li>
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<br>
					<c:if test="${ empty iList }"> 
					<div class="panel-group">
						<div class="well">												
    						<div class="panelStart1 panel panel-success">    						
      							<div class="panel-heading">리워드형 프로젝트</div> 
      							     							  							
      							<div class="panel-body">아직 개설한 프로젝트가 없습니다.</div>								      							
      						</div>
      					</div>
      				</div>
      				</c:if>	  
						
						
					<c:if test="${ ! empty iList }"> 
					<div class="panel-group">
						<div class="well">												
    						<div class="panelStart1 panel panel-success">    						
      							<div class="panel-heading">리워드형 프로젝트</div> 
      							
      							<br>
      							
      							<div class="listStart container">
			  						<ul class="lStart nav nav-pills">
			    						<li class="sidelist"><a class="slist" href="newproject.ao">모두보기</a></li>
			    						<li class="sidelist"><a class="slist" href="inwrite.it">작성중</a></li>
			    						<li class="sidelist"><a class="slist" href="ongoing.it">진행중</a></li>
			    						<li class="mainlist"><a class="mlist">펀딩종료</a></li>
								  	</ul>
								  	
								  	<div class="pcontents">
								  		<br>
										<!-- 펀딩종료일 때  -->
			      						<div class="row myItemList">
				      							<c:forEach var="item" items="${ iList }" varStatus="status">
					      							<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">     							
					      								<div id="itempanel<c:out value='${status.index}'/>" class="panel">
					      									<div id="conitemper<c:out value='${status.index}'/>" class="panel-heading">${ item.pstatus }</div>
					      									<div id="enditemper<c:out value='${status.index}'/>" class="panel-body">
					      										<div class="thumbnail" align="center">      										
						      										<a id="displace<c:out value='${status.index}'/>" href="#"> 
						      											
						      											<c:if test="${ empty item.thumbnail }">
						      													<img alt="이미지를 넣으세요" src="/funfund/images/funding/thumbnail/plusImage.png" style="width: 100%;margin-bottom:2%;">
						      											</c:if>
						      											
						      											<c:if test="${ ! empty item.thumbnail }">
						      													<img alt="이미지를 넣으세요" src="/funfund/images/makeproject/titleimg/<c:out value="${item.thumbnail}"/>" style="width: 100%;margin-bottom:2%;">      											
						      											</c:if>
						      												
						      												<div id="progress<c:out value='${status.index}'/>" class="progress" style="display:none;">
						  													<div id="progressbar<c:out value='${status.index}'/>" 
						  														 class="w3-red progress-bar progress-bar-striped active" 
						  														 role="progressbar" 
						  														 aria-valuenow="70" aria-valuemin="0" aria-valuemax="<c:out value="${item.ecost}"/>" 
						  														 style="width: 70%;"></div>
						  														 <span class="sr-only"></span>
																		</div>
																		
																		<p id="pTag" style="display:none;">
																			<span style="display:none;" id="persent<c:out value='${status.index}'/>"></span>% &nbsp;&nbsp; <span><c:out value="${item.fundamount }"/></span>원 달성 &nbsp;&nbsp; 
																			<span style="display:none;" id="edate<c:out value='${status.index}'/>"></span>
																			<span style="display:none;" id="yet<c:out value='${status.index}'/>">일 남음</span>
																			<span style="display:none;" id="complete<c:out value='${status.index}'/>">펀딩종료</span>
																		</p>     
																													
						      										 	<div class="caption<c:out value='${status.index}'/>">
						            										<p>${ item.pname }</p>
						            										<span>${ item.category }</span>            										
						          										</div>	 
						          									</a>
					      										</div>
					      									</div>
					    								</div>					    								
					    								<br>					    								
					    							</div>
					    							
					    							<script type="text/javascript">    								
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
														    
														    var pstatus = "<c:out value='${item.pstatus}'/>";
													    	
					    								    $("#persent<c:out value='${status.index}'/>").html(persent);
					    									$("#progressbar<c:out value='${status.index}'/>").attr("aria-valuenow", persent);
					    									$("#progressbar<c:out value='${status.index}'/>").css("width", bar + "%");
					    									$("#edate<c:out value='${status.index}'/>").text(btDay);					    																		
					    									
					    									if(pstatus == "펀딩종료") {
					    										$("#progress<c:out value='${status.index}'/>").css("margin-top", "5px");
					    										$(".caption<c:out value='${status.index}'/>").css("margin-bottom", "31px");
					    										$("#itempanel<c:out value='${status.index}'/>").removeClass("panel-warning");
					    										$("#itempanel<c:out value='${status.index}'/>").removeClass("bg-danger");
					    										$("#itempanel<c:out value='${status.index}'/>").addClass("panel-default");
					    										$("#progress<c:out value='${status.index}'/>").show();
					    										$("#progressbar<c:out value='${status.index}'/>").show();
					    										$("#progressbar<c:out value='${status.index}'/>").html(persent+"%");
					    										$("#persent<c:out value='${status.index}'/>").show();
					    										$("#edate<c:out value='${status.index}'/>").show();
					    										$("#yet<c:out value='${status.index}'/>").show();
					    										$("#pTag").show();
					    										
					    										$("#progressbar<c:out value='${status.index}'/>").addClass("w3-gray");
					    										
					    										$("#displace<c:out value='${status.index}'/>").attr("href", "javascript:");
					    									}
					    									
					    									else if(btDay<0) {
					    										$("#complete<c:out value='${status.index}'/>").show();
					    									}
					    									
					    									else if(btDay>=0) {
					    										$("#complete<c:out value='${status.index}'/>").hide();
					    									}
					    								});
												 </script>
				    							</c:forEach>				    											    							
			    							</div>	
									</div> 
								</div>
								<br>																    							  							     														      							
      						</div>
      					</div>
      				</div>
      				</c:if>

    					
    					<br>
      					
      						<div class="well">   					   					
    							<div class="panel panel-info">
      								<div class="panel-heading">후원형 프로젝트</div>
      								<div class="panel-body">아직 참여한 프로젝트가 없습니다.</div>
    							</div>
    						</div>
    						
    						<script type="text/javascript">
	    					$("#investApply").click(function(){
								var name ='<c:out value="${sessionScope.party.pname}"/>';
								console.log(name);
								console.log("오니?");
								if(name == "") {
									alert("회원정보 설정에서 이름을 반드시 입력하세요!");
									console.log("오긴 오니?");
									return false;
								}
								
								else {
									location.href = "sellerinfo.ao";
								}
							});
    					</script>
    					 									
  						<br><br><br>						
					</div>																					
				</div>				
			</div>
		</div>
	</div>

<br><br>

</body>
</html>