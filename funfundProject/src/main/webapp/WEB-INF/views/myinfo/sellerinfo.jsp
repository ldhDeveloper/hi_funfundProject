<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="/funfund/lib/css/sellerinfo.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>sellerinfo</title>

<style type="text/css">
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

.fun-menu{
	color:#3BBFAB !important;
}

.bar:hover {

}

.mlabel {
	height: 80px;
	color: #fff;
	font-size: 2vw;
	padding-top: 1.5%;
}

.btn-darkgray3{display:inline-block;width:48%;height:44px;font-size:13px;line-height:46px;text-align:center;color:#fff;background:#50E3C2;border:none;box-sizing:border-box}
.btn-darkgray4{display:inline-block;width:48%;height:44px;font-size:13px;line-height:46px;text-align:center;color:#fff;background:#FBAF2C;border:none;box-sizing:border-box}
.btn-darkgray5{display:inline-block;width:48%;height:44px;font-size:13px;line-height:46px;text-align:center;color:#fff;background:#50E3C2;border:none;box-sizing:border-box;}
.input-text1{box-sizing:border-box;display:inline-block;width:48%;margin-bottom:7px;height:45px;line-height:48px;font-size:13px;color:#4a4a4a;background:#fff;border:1px solid #e4e4e4;outline:none;padding-top:1%;padding-left:4.5%}

.mnameText {
	border: none;
	color: #4D525B;
	width: 10%;
	background-color: #F8F8F8;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<script type="text/javascript">
$(function(){
	var str ='<c:out value="${sessionScope.party.id_no}"/>';
	var result = str.split('-');
	$("#fid_no").val(result[0]);
	$("#eid_no").val(result[1]);
});

</script>

<br><br>
<div class="container">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="mlabel" align="center">회원 정보 보기</div>
				
				<div class="minfo">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><img class="img-circle img-responsive" src="images/myinfo/basic.png" style="max-width:170px;max-height:170px; width:170px; heigh:150px;"><!-- 사진 값이 들어갈 곳  --></div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow mname" align="center">
							회원명 | <c:if test="${ empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="성함을 등록하세요" readonly/>
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
        							<li class="act"><a class="active" href="myinfo.do">판매자 정보 변경<span class="sr-only">(current)</span></a></li>
        							<li><a href="joinproject.ao" class="otherActive">참여한 프로젝트</a></li>
        							<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
        							<li><a href="newproject.ao" class="otherActive">개설한 프로젝트</a></li>
        							<li><a href="myfunding.ao" class="otherActive">나의 펀딩 현황</a></li>
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<div id="waccountWrap">	    	
	        			<div class="waccount-wrap">
	     					<div id="waccountContainer">	       			
	                			<h2>투자 서비스 신청</h2>
	                			<h3>추가 정보를 입력하고 크라우드펀딩 투자를 시작해보세요.</h3>
	                			
	                			<em class="line"></em>   
							<div>
						
							<form id="saveForm">
		                    	<h5>실명</h5>
		       					
		       					<div class="input-area">
		       						<c:if test="${ empty sessionScope.party.pname }">
		       							<input type="text" class="input-text" id="nickName" value=""  placeholder="이름" disabled />
		       						</c:if>
		       						
		       						<c:if test="${ !empty sessionScope.party.pname }">
		       							<input type="text" class="input-text" id="nickName" value="${ sessionScope.party.pname }"  placeholder="이름" disabled />
		       						</c:if>
		       					</div>
		       				
		       					<h5>휴대폰 번호</h5>	
		       						<c:if test="${ empty sessionScope.party.phone }">
		       							<input type="text" class="input-text" id="" value="${ sessionScope.party.phone }"  placeholder="휴대폰" disabled />                                                            
	                           		</c:if>
	                           		
	                           		<c:if test="${ !empty sessionScope.party.phone }">
		       							<input type="text" class="input-text" id="" value="${ sessionScope.party.phone }"  placeholder="휴대폰" disabled />                                                            
	                           		</c:if>
	                           		
	                           <h5>주민등록번호</h5>
	       							<p class="sub-text">개인정보는 암호화하여 안전하게 처리하고 있습니다.</p>
	       					
	       							<ul class="input-div2">
		       							<li><input id="fid_no" type="tel" class="input-text" value="" disabled /></li>
		       							<li><input id="eid_no" autocomplete="new-password" type="password" class="input-text" id="ssn2" name="ssn2" placeholder="주민등록번호 뒷자리" maxlength="7" /></li>
		       						</ul>
	                 		
	                 				<p id="ssnError" class="error-text">이미 가입한 주민번호입니다.</p>
	                      			<p id="invalidSsnError" class="error-text">주민등록번호가 올바르지 않습니다.</p>
	                   				<p id="ssnGenderError" class="error-text"></p>
	            
	                     	
								<h5>주소</h5>
		       						<p class="sub-text">본인확인이 가능한 주민등록상의 주소를 입력하세요.</p>
		       				
		       						<div class="btn-wrap post-btn">
		       							<!-- <input type="text" class="input-text1" id="" name="" placeholder="우편번호" />	&nbsp;&nbsp;
		       							<input type="button" class="btn-darkgray5" onclick="sample6_execDaumPostcode();" value="우편번호 검색"> -->       						
		       							
		       							<!-- <button type="button" class="btn-darkgray w110" onclick="sample6_execDaumPostcode();">우편번호 검색</button> -->
		       						</div>
		       				
		       					<div class="input-area">
		       						<!-- <input type="text" id="sample6_postcode" class="input-text" placeholder="우편번호"> -->
		       						<input type="text" class="input-text1" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" readonly/>	&nbsp;&nbsp;
		       						<input type="button" class="btn-darkgray5" onclick="sample6_execDaumPostcode();" value="우편번호 검색">
			              			<input type="text" id="sample6_address" name="location1" class="input-text" placeholder="도로명주소" readonly/> 
			              			<input type="text" id="sample6_address2" name="location2" class="input-text" placeholder="상세주소" />
		       						<!-- <input type="hidden" id="zipCode" name="zipCode" value="" /> -->
		       						<p id="locationError" class="pwd-text small">본인확인이 가능한 주민등록상의 주소로 입력하세요.</p>
                                	<p id="addrError" class="error-text">주소를 검색하세요.</p>
                                	<br>
		       					</div>	                        
	                        
								<h5>실명확인증표 등록</h5>
				       				<p class="sub-text">실명과 주민등록번호 확인을 위해, 현재 유효한 주민등록증 또는 면허증의 앞면을 촬영한 사진을 등록하세요.</p>
				       				
				       				<div class="info-box" id="idCardInfoBox" style="display:none;"></div>
				       				<div class="file-list" id="idCardFileArea" style="display:none;"></div>
				       				
				       				<div class="btn-wrap" id="idCardFileUploadBtn">
				       					<input type="button" class="btn-darkgray" id="btnUploadIdCardImg" value="이미지 파일 등록">
				       				</div>
				       		
				       				<p id="idCardImgError" class="error-text" style="margin-bottom:6px;">실명확인증표를 등록하세요.</p>
				       				<p class="comment">funfund에서 청약을 하기 위해서는 금융실명법에 따라 실명확인이 필요합니다. funfund는 금융위원회에 정식 등록된 온라인소액투자중개업자로 실명확인을 진행하오니 안심하고 등록해주세요.</p>
							
									<!-- <input type="hidden" id="temporaryIdCardFileId" />
									<input type="hidden" id="temporaryIncomeDocFileId" />
									<input type="hidden" id="temporarySpecialtyDocFileId" />
									<input type="hidden" id="nickName" name="nickName" value="김진항">
									<input type="hidden" id="birth" name="birth" value="19891025">
									<input type="hidden" id="ssn1" name="ssn1" value="891025">
									<input type="hidden" id="mobileNumber" name="mobileNumber" value="01093533034">
									<input type="hidden" id="userName" name="userName" value="jinhang89@gmail.com">
									<input type="hidden" id="acPlusType" name="acPlusType" value="IVT">
									<input type="hidden" id="compensationCode" name="compensationCode">
									<input type="hidden" id="hiddenAllowDM" name="allowDmPlus" />
									<input type="hidden" id="accntType" name="accntType" />
									<input type="hidden" id="idCardFiles" name="idCardFiles" />
									<input type="hidden" id="incomeDocFiles" name="incomeDocFiles" />
									<input type="hidden" id="specialtyDocFiles" name="specialtyDocFiles" /> -->
		        	    		</form>
		        	    		
		        	    		<br><br>
		        	    		
		        	    		<input type="button" class="btn-darkgray3" id="" value="수정"> &nbsp;&nbsp; <input type="button" class="btn-darkgray4" id="" value="취소">
							</div>
					
						<em class="line"></em>
					
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