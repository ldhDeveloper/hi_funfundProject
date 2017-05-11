<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="/funfund/lib/css/sellerinfo.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>sellerinfo</title>
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
        							<li class="active"><a href="myinfo.do">판매자 정보 변경<span class="sr-only">(current)</span></a></li>
        							<li><a href="joinproject.do" class="w3-hover-teal">참여한 프로젝트</a></li>
        							<li><a href="puttoproject.do" class="w3-hover-teal">찜한 프로젝트</a></li>
        							<li><a href="newproject.do" class="w3-hover-teal">개설한 프로젝트</a></li>
        							<li><a href="myfunding.do" class="w3-hover-teal">나의 펀딩 현황</a></li>
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
		       						<input type="text" class="input-text" id="nickName" value="김진항" disabled />
		       					</div>
		       				
		       					<h5>휴대폰 번호</h5>	                            
									<div class="input-text" style="background:#e7e7e7">
	                                    <p id="niceReturnMobile">01093533034</p>
	                                </div>                                
	                           <h5>주민등록번호</h5>
	       							<p class="sub-text">개인정보는 암호화하여 안전하게 처리하고 있습니다.</p>
	       					
	       							<ul class="input-div2">
		       							<li><input type="tel" class="input-text" value="891025" disabled /></li>
		       							<li><input autocomplete="new-password" type="password" class="input-text" id="ssn2" name="ssn2" placeholder="주민등록번호 뒷자리" maxlength="7" />	</li>
		       						</ul>
	                 		
	                 				<p id="ssnError" class="error-text">이미 가입한 주민번호입니다.</p>
	                      			<p id="invalidSsnError" class="error-text">주민등록번호가 올바르지 않습니다.</p>
	                   				<p id="ssnGenderError" class="error-text"></p>
	            
	                     	
								<h5>주소</h5>
		       						<p class="sub-text">본인확인이 가능한 주민등록상의 주소를 입력하세요.</p>
		       				
		       						<div class="btn-wrap post-btn">		       						
		       							<button type="button" class="btn-darkgray w110" onclick="sample6_execDaumPostcode();">우편번호 검색</button>
		       						</div>
		       				
		       					<div class="input-area">
		       						<input type="text" id="sample6_postcode" class="input-text" placeholder="우편번호">
			              			<input type="text" id="sample6_address" name="location1" class="input-text" placeholder="도로명주소" readonly/>
			              			<input type="text" id="sample6_address2" name="location2" class="input-text" placeholder="상세주소" />
		       						<!-- <input type="hidden" id="zipCode" name="zipCode" value="" /> -->
		       						<p id="locationError" class="pwd-text small">본인확인이 가능한 주민등록상의 주소로 입력하세요.</p>
                                	<p id="addrError" class="error-text">주소를 검색하세요.</p>
		       					</div>	                        
	                        
								<h5>실명확인증표 등록</h5>
				       				<p class="sub-text">실명과 주민등록번호 확인을 위해, 현재 유효한 주민등록증 또는 면허증의 앞면을 촬영한 사진을 등록하세요.</p>
				       				
				       				<div class="info-box" id="idCardInfoBox" style="display:none;"></div>
				       				<div class="file-list" id="idCardFileArea" style="display:none;"></div>
				       				
				       				<div class="btn-wrap" id="idCardFileUploadBtn">
				       					<button type="button" class="btn-darkgray" id="btnUploadIdCardImg">이미지 파일 등록</button>
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

<script>
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
</script>

</body>
</html>