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
.input-text2{box-sizing:border-box;display:inline-block;width:100%;margin-bottom:7px;height:27px;line-height:30px;font-size:13px;color:#4a4a4a;background:#fff;border:1px solid #e4e4e4;outline:none;padding-top:1%;padding-left:4.5%}
.mnameText {
	border: none;
	color: #4D525B;
	width: 40%;
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

	var add ='<c:out value="${sessionScope.party.address}"/>';
	var aResult = add.split('@');
	$("#sample6_postcode").val(aResult[0]);
	$("#sample6_address").val(aResult[1]);
	$("#sample6_address2").val(aResult[2]);
	
	var img = '<c:out value="${sessionScope.party.idimage}"/>';
	if(img == "") {
		$("#btnUpdateIdCardImg").hide();
		$("#btnUploadIdCardImg").show();
		$("#updateCardImg").removeClass("alert alert-success");
	}
	
	else {
		$("#btnUpdateIdCardImg").show();
		$("#btnUploadIdCardImg").hide();
		$("#updateCardImg").addClass("alert alert-success");
		$("#updateCardImg").html("사진이 저장되었습니다.");
	}
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
						
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">회원등급 | ${ sessionScope.account.idtype }</label></div>
						<%-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">${ sessionScope.account.idtype }</label></div> --%>
						
						<%-- <c:choose>
        					<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청중'}">
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
      							
      							<a class="hidden-lg hidden-md navbar-brand">회원 메뉴</a>
    						</div>

    						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      							<ul class="nav navbar-nav">      	
        							<li><a href="myinfo.ao" class="otherActive">회원 정보 설정</a></li>
        							
        							<c:choose>
        									<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청중'}">
        										<li class="act"><a class="active" href="sellerinfo.ao">투자 회원 신청<span class="sr-only">(current)</span></a></li>
											</c:when>
									</c:choose>
        							
        							<c:choose>
        								<c:when test="${ sessionScope.account.idtype == '판매자'}">
        									<li class="act"><a class="active" href="sellerinfo.ao">판매자 정보 수정<span class="sr-only">(current)</span></a></li>
        								</c:when>
        							</c:choose>
        							
        							<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
										
									<c:choose>
        								<c:when test="${ sessionScope.account.idtype == '판매자'}">
											<li><a href="newproject.ao" class="otherActive">개설한 리워드형 프로젝트</a></li>
											<li><a href="newsponproject.ao" class="otherActive">개설한 후원형 프로젝트</a></li>
										</c:when>
									</c:choose>
        							
        							<li><a href="myfunding.ao" class="otherActive">나의 펀딩 현황</a></li>
      							</ul>
    						</div>
  						</div>
					</nav>
					
					<div id="waccountWrap">	    	
	        			<div class="waccount-wrap">
	     					<div id="waccountContainer">
	     						
        							<c:if test="${ sessionScope.account.idtype eq '판매자'}">	       			
	                					<h2>투자 서비스 신청</h2>
	                					<h3>추가 정보를 입력하고 크라우드펀딩 투자를 시작해보세요.</h3>
	                			
	                					<em class="line"></em>
	                				</c:if>
        						 
							
							<div>						
								<form id="sellerChange" action="changeSeller.ao" method="post" enctype="multipart/form-data" onsubmit="return saveSeller();">
			                    	<h5>실명</h5>
			       					
			       					<div class="input-area">
			       						<c:if test="${ empty sessionScope.party.pname }">
			       							<input type="text" class="input-text" id="name" value=""  placeholder="이름" disabled />
			       						</c:if>
			       						
			       						<c:if test="${ !empty sessionScope.party.pname }">
			       							<input type="text" class="input-text" id="name" value="${ sessionScope.party.pname }"  placeholder="이름" disabled />
			       						</c:if>
			       					</div>
			       							       					
			       					<h5>휴대폰 번호</h5>	
			       						<c:if test="${ empty sessionScope.party.phone }">
			       							<input type="text" class="input-text" id="phone" name="phone" value=""  placeholder="휴대폰" />                                                            
		                           		</c:if>
		                           		
		                           		<c:if test="${ !empty sessionScope.party.phone }">
			       							<input type="text" class="input-text" id="phone" name="phone" value="${ sessionScope.party.phone }"  placeholder="휴대폰"/>                                                            
		                           		</c:if>
		                           		
		                           <h5>주민등록번호</h5>
		       							<p class="sub-text">개인정보는 암호화하여 안전하게 처리하고 있습니다.</p>
		       					
		       							<ul class="input-div2">
		       								<c:if test="${ empty sessionScope.party.id_no }">
			       								<li><input id="fid_no" type="tel" class="input-text" value="" name="id_no1" maxlength="6" placeholder="주민등록번호 앞자리"/></li>
			       							</c:if>
			       							
			       							<c:if test="${ ! empty sessionScope.party.id_no }"> 
			       								<li><input id="fid_no" type="tel" class="input-text" value="" name="id_no1" maxlength="7" placeholder="주민등록번호 앞자리" /></li>
			       							</c:if>
			       							
			       							<c:if test="${ empty sessionScope.party.id_no }">
			       								<li><input id="eid_no" autocomplete="new-password" type="password" class="input-text" name="id_no2" placeholder="주민등록번호 뒷자리" maxlength="7" /></li>
			       							</c:if>
			       							
			       							<c:if test="${ ! empty sessionScope.party.id_no }">
			       								<li><input id="eid_no" autocomplete="new-password" type="password" class="input-text" name="id_no2" placeholder="주민등록번호 뒷자리" maxlength="7"/></li>
			       							</c:if>
			       						</ul>
		                 		
		                 				<p id="ssnError" class="error-text">이미 가입한 주민번호입니다.</p>
		                      			<p id="invalidSsnError" class="error-text">주민등록번호가 올바르지 않습니다.</p>
		                   				<p id="ssnGenderError" class="error-text"></p>
		            
		                     	
									<h5>주소</h5>
			       						<p class="sub-text">본인확인이 가능한 주민등록상의 주소를 입력하세요.</p>
			       				
			       					<div class="input-area">
			       						<input type="text" class="input-text1" id="sample6_postcode" name="address1" placeholder="우편번호" readonly/>	&nbsp;&nbsp;
			       						<input type="button" class="btn-darkgray5" onclick="sample6_execDaumPostcode();" value="우편번호 검색">
				              			<input type="text" id="sample6_address" name="address2" class="input-text" placeholder="도로명주소" readonly/> 
				              			<input type="text" id="sample6_address2" name="address3" class="input-text" placeholder="상세주소" />
	                                	<p id="addrError" class="error-text">주소를 검색하세요.</p>
	                                	<br>
			       					</div>	                        
		                        
									<h5>실명확인증표 등록</h5>
					       				<p class="sub-text">실명과   주민등록번호 확인을 위해, 현재 유효한 주민등록증 또는 면허증의 앞면을 촬영한 사진을 등록하세요.</p>
					       				
					       				<br>
					       				
					       				<c:if test="${ empty sessionScope.party.idimage}">
											<input type="hidden" name="photoflag" value="insert">
										</c:if>
										
										<c:if test="${ !empty sessionScope.party.idimage}">
											<input type="hidden" name="photoflag" value="update">
										</c:if>
					       				
					       				<c:if test="${ empty sessionScope.party.idimage}">
					       					<img id="imgRoute" class="idImage" src="images/myinfo/sellerinfo/idcardimg.png"  style="max-width: 398px; max-height: 200px; width: 398px; heigh: 200px; background-color:#fff;">
					       				</c:if>
					       				
					       				<c:if test="${ ! empty sessionScope.party.idimage}">
					       					<img id="imgRoute" class="idImage" src="images/myinfo/sellerinfo/<c:out value='${ sessionScope.party.idimage }'/>"  style="max-width: 398px; max-height: 200px; width: 398px; heigh: 200px; background-color:#fff;">
					       				</c:if>
					       				
					       				<br><br>				
					       				<input type="text" id="imgRoute" class="input-text" placeholder="선택된 파일 없음" readonly/>
					       				
					       				<p class="alert alert-success" id="updateCardImg"></p>		       				
					       				<input type="button" class="btn-darkgray" id="btnUpdateIdCardImg" value="이미지 파일 수정" onclick="document.all.idimage.click();"/>
					       								       				
					       				<input id="uploadIdCardImg" class="input-text" type="file" name="idimage" style="display:none;" onchange="document.getElementById('imgRoute').value=this.value;">
					       				
					       				<div class="btn-wrap" id="idCardFileUploadBtn">
					       					<input type="button" class="btn-darkgray" id="btnUploadIdCardImg" value="이미지 파일 등록" onclick="document.all.idimage.click();"/>
					       				</div>
					       				
					       				<c:if test="${ empty sessionScope.party.idimage}">
											<input type="hidden" name="photoflag" value="insert">
										</c:if>
										<c:if test="${ !empty sessionScope.party.idimage}">
											<input type="hidden" name="photoflag" value="update">
										</c:if>
					       		
					       				<p id="idCardImgError" class="error-text" style="margin-bottom:6px;">실명확인증표를 등록하세요.</p>
					       				<p class="comment">funfund에서 청약을 하기 위해서는 금융실명법에 따라 실명확인이 필요합니다. funfund는 금융위원회에 정식 등록된 온라인소액투자중개업자로 실명확인을 진행하오니 안심하고 등록해주세요.</p>
			        	    		
			        	    		<br><br>
			        	    		<c:choose>
			        	    			<c:when test="${ sessionScope.account.idtype == '일반회원' }">
			        	    				<input type="submit" class="btn-darkgray3" id="applyBtn" value="신청하기">
			        	    			</c:when>
			        	    			
			        	    			<c:when test="${ sessionScope.account.idtype == '승인요청중' || sessionScope.account.idtype == '판매자'}">
			        	    				<input type="submit" class="btn-darkgray3" id="modifyBtn" value="수정하기">
			        	    			</c:when>
			        	    		</c:choose>
	
			        	    		&nbsp;&nbsp; <input type="button" class="btn-darkgray4" id="" value="취소">							
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
    
    function photosubmit(){
		$("#imageform").submit();
	}
</script>

</body>
</html>