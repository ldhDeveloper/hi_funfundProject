<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	/* background-color: #3DB8CC;
	border-radius: 5px;
	color: #fff;
	box-shadow: 2px 2px #AFAFAF;
	border: none; */
	text-align: center;
	padding-top: 2%;
	color: #4A4A4A;
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
	float: center;
}

.jpth {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	width: 15%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	padding-left : 0px !important;
	padding-right : 0px !important;
}

.jpth1 {
	border-top: 4px solid #DFF0D8;
	border-bottom: 4px solid #DFF0D8;
	width: 40%;
	text-align: center;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
	padding-left : 0px !important;
	padding-right : 0px !important;
}

.jptd {
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

.completeBtn {
	border: 1px solid #28B5A9;
	background-color: #31C698;
	color: snow;
	border: none;
	border-radius: 20px;
	box-shadow: 2px 2px #ddd;
	height: 30px;
	text-size: 2vw;
} 

/* label {
	font-size: 1vw;
} */

.nameId {
	font-size: 14pt;
	width: 200px;
	padding-top: 1.8%;
	color: #4A4A4A;
}
</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<div class="hidden-xs" style="height:85px;">&nbsp;</div>
<div class="container">
	<div class="row">
				<div class="mlabel" align="center">
					<div class="hidden-lg hidden-md" style="height:10px;">&nbsp;</div>
					회원 정보 보기
				</div>
				
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
						<label class="nameId">
							회원명 | <c:if test="${ empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.account.nickname }" readonly/>
		                 			</c:if>
		                 			
		                 			<c:if test="${ !empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.party.pname }" readonly/>
		                 			</c:if>
		       				</label>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">회원등급 | ${ sessionScope.account.idtype }</label></div>
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
      								
        							<!-- <li style="display:none;"><a class="otherActive" id="goSellerinfo" style="cursor:pointer;">판매자 정보 변경</a></li> -->
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
      							<!-- <div class="panel-body">아직 참여한 프로젝트가 없습니다.</div> -->
      							
      							<br><br><br>
      							
      							
  									
  							<div class="tableStart">
  									
  								<h2 align="center">결제 정보 변경 및 취소</h2>
  								
  								<br><br><br>
      							
      							<form action="joinCancle.fl" method="post" enctype="multipart/form-data">
      							<input type="hidden" value="${ myfunding.fund_no }" name="fund_no">
      							<label id="delivery">참여한 프로젝트 정보</label><input class="joinBtn" type="submit" value="참여취소">
  									<br><br><br>
  									<table class="table">
    										<thead class="paddingGo">								
      											<tr class="joinProject">
        											<th class="jpth">주문번호</th>
        											<th class="jpth1">리워드 프로젝트</th>
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
  											<p id="fundCount">&nbsp;&nbsp;&nbsp;${ myfunding.fundcount }개 / ${ myfunding.mcost }원</p>
  										</div>
  										
  										<br><br><br>
  									
  									<label id="delivery">결제정보</label>
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
  										
  										<form action="deliveryChange.fl" method="post">
  										<input type="hidden" name="fund_no" value="${ myfunding.fund_no }">
  										<label id="delivery">배송지정보</label><input id="deliveryChangeBtn" class="deliveryBtn" type="button" value="배송지 정보 변경"><input id="dcCompleteBtn" class="deliveryBtn" type="submit" value="배송지 변경 완료" style="display:none;">
  										<br><br>
  										<table class="table">
  											<tbody class="paddingGo">
      											<tr class="mdtrs">
        											<td class="mdtd">받으시는 분</td>
        											<td class="mdtdv"><b id="recnameb" class="">${ myfunding.recname }</b><input class="" id="recnamei" name="recname" placeholder="변경할 이름을 입력하세요." value="" style="display:none;border:none;" required autofocus></td>
      											</tr>
      											
      											<tr class="mdtr">
        											<td class="mdtd">연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처</td>
        											<td class="mdtdv"><b id="rephoneb" class="">${ myfunding.rephone }</b><input class="" id="rephonei" name="rephone" placeholder="변경할 연락처를 입력하세요." value="" style="display:none;border:none;" required></td>
      											</tr>
      											
      											<tr class="mdtr">
        											<td class="mdtd">이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일</td>
        											<td class="mdtdv">${ sessionScope.account.email }</td>
      											</tr> 
      											
      											<tr class="mdtrf mdtr">
        											<td class="mdtd">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
        											<td class="mdtdv">
        												<b id="deladdressb"></b>
        												<!-- <input id="deladdressi" name="deladdress" placeholder="변경할 주소를 입력하세요." value="" style="display:none;border:none;" required><br> -->
        												<div id="deladdressi" style="display:none;">
								       						<input type="text" class="input-text1" id="sample6_postcode" name="deladdress1" style="display:none; width: 30%; height: 50px;" placeholder="우편번호" readonly/>	&nbsp;&nbsp;
								       						<input type="button" id="deladdressi2" style="display:none;" class="btn-darkgray5" onclick="sample6_execDaumPostcode();" value="우편번호 검색"><br><br>
									              			<input type="text"  id="sample6_address" name="deladdress2" style="display:none; width: 98%; height: 50px;" class="input-text" placeholder="도로명주소" readonly/><br><br>
									              			<input type="text" id="sample6_address2" name="deladdress3" style="display:none; width: 98%; height: 50px;" class="input-text" placeholder="상세주소" required/><br><br>
								       					</div>
        											</td>
      											</tr>    										      											      											
    										</tbody>
  										</table>
  										
  										</form>
  										
  										<script type="text/javascript">
  											$(function(){
  												$("#deliveryChangeBtn").click(function(){
  													$("#recnameb").hide();
  													$("#rephoneb").hide();
  													$("#deladdressb").hide();
  													$("#deliveryChangeBtn").hide();
  													$("#recnamei").show();
  													$("#rephonei").show();
  													$("#deladdressi").show();
  													$("#sample6_postcode").show();
  													$("#deladdressi2").show();
  													$("#sample6_address").show();
  													$("#sample6_address2").show();
  													$("#dcCompleteBtn").show();  													  													
  												});
  												
  												var add ='<c:out value="${myfunding.deladdress}"/>';
  												var aResult = add.split('@');
  												$("#deladdressb").html(aResult[0] + " " + aResult[1] + " " + aResult[2]);  			  												
  											});
  											
  											function sample6_execDaumPostcode() {
  										        new daum.Postcode({
  										            oncomplete: function(data) {
  										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

  										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
  										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
  										                var fullAddr = ''; // 최종 주소 변수
  										                var extraAddr = ''; // 조합형 주소 변수

  										                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
  										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
  										                    fullAddr = data.roadAddress;

  										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
  										                    fullAddr = data.jibunAddress;
  										                }

  										                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
  										                if(data.userSelectedType === 'R'){
  										                    //법정동명이 있을 경우 추가한다.
  										                    if(data.bname !== ''){
  										                        extraAddr += data.bname;
  										                    }
  										                    // 건물명이 있을 경우 추가한다.
  										                    if(data.buildingName !== ''){
  										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
  										                    }
  										                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
  										                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
  										                }

  										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
  										                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
  										                document.getElementById('sample6_address').value = fullAddr;

  										                // 커서를 상세주소 필드로 이동한다.
  										                document.getElementById('sample6_address2').focus();
  										            }
  										        }).open();
  										    }
  											
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
  								
  								<br>
    						</div>
    					</div>
    					
    					<br>
  					</div>										
				</div>				
	</div>
</div>

<br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
</body>
</html>