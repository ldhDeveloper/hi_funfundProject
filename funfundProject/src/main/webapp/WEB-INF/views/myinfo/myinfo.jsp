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
	height : 1350px;
	padding-top: 2%;
}

.mh3 {
	/* font-size: 1.5vw; */
	padding-left : 30%;
}

.fun-menu{
	color:#3BBFAB !important;
}

.email-input-wrap{padding-top:16px;}
.email-input-wrap.small{padding-top:0;}
.email-input-wrap.mid{padding-top:8px;}
.email-input-wrap.bigger{padding-top:30px;}
.email-input-wrap.with-border{padding-bottom:4px;border-bottom:solid 1px #e4e4e4;}
.email-input-wrap.with-border.mid{padding-bottom:9px;}
.email-input-wrap.with-border.big{padding-bottom:16px;}
.email-input-wrap .input-text.error{margin-bottom:7px;border-color:#d0021b;}
.email-input-wrap .pwd-text{margin-bottom:12px;}
.email-input-wrap .pwd-text.500{margin-bottom:0;padding-top:7px;font-size:13px;font-weight:500;}
.email-input-wrap .pwd-text.mid{margin-bottom:7px;padding-top:7px;}
.email-input-wrap .pwd-text.small{margin-bottom:0;}
.email-input-wrap .pwd-text.small a{text-decoration:underline;}
.email-input-wrap .pwd-text.error{color:#d0021b;}
.email-input-wrap span{margin-top:20px;font-size:15px;color:#4a4a4a;}
.email-input-wrap small{display:block;font-size:13px;color:#4a4a4a;}
.email-input-wrap small.contents{display:inline-block;font-size:smaller;}
.email-input-wrap small.big{padding:7px 0;font-size:11px;}

.input-text{box-sizing:border-box;display:block;width:100%;padding:0 17px;margin-bottom:7px;height:46px;line-height:45px;font-size:13px;color:#4a4a4a;background:#fff;border:1px solid #e4e4e4;outline:none}
.input-text::-ms-clear{display: none;}
.input-text:focus{border-color:#50e3c2;outline:none}
.input-text.error{border-color:#d0021b;}

.input-btn-wrap:after{content:"";clear:both;display:block;}
.input-btn-wrap div{float:left;}
.input-btn-wrap .input{width:70%;}
.input-btn-wrap .input.big{width:100%;}
.input-btn-wrap .input.small{width:28%;margin-left:4px;}
.input-btn-wrap .btn{width:28%;margin-left:4px;display:block;background:#50E3C2;height:46px;line-heigh:46px;border:none;text-align:center;}
.input-btn-wrap .mbtn{width:28%;margin-left:4px;display:block;background:#50E3C2;height:46px;line-heigh:46px;border:none;text-align:center;}
.input-btn-wrap .btn.post{margin-left:0;margin-bottom:7px;}
.input-btn-wrap .btn .pwdBtn button{border:0;background:none;cursor:pointer;width:100%;}
.input-text.disable{background:#e7e7e7;}
.input-btn-wrap .input .input-text.error{border-color:#d0021b;}
.input-btn-wrap .input.with-timer{position:relative;}
.limit_time{position:absolute;top:13px;right:10px;text-align:right;}
.limit_time span{color:#50e3c2;font-size:13px;}
.input-btn-wrap.with-border{padding-bottom:16px;border-bottom:1px solid #e4e4e4;}
.post-wrap{margin-bottom:20px;padding-bottom:20px;border-bottom:1px solid #e4e4e4;}

@media screen and (min-width: 1000px){
.account-wrap {
    width: 350px;
    margin: 0 auto;
    padding-top: 3%;
	}
}

.emailAuthBtn {
	color:inherit;text-decoration:none;
	outline:none;
	-webkit-appearance: none;-moz-appearance: none;
	margin-top: 2%;
}

.mbtn span{line-height:46px;font-size:13px;color:#ffffff;}

a.btn-block-purple, .pwdBtn, button.btn-block-purple{display:block;width:100%;height:42px;line-height:42px;text-align:center;font-size:15px;color:#fff;border:none;background:#50e3c2;cursor:pointer;}
a.btn-block-purple.disable, button.btn-block-mint.disable{background:rgba(80, 226, 193, 0.5);cursor:default;}

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

.line{display:block;margin:40px 0;width:100%;height:1px;background:#ddd}

.mnameText {
	border: none;
	color: #4D525B;
	width: 40%;
	background-color: #F8F8F8;
}

.glyphicon {
	color: #50E3C2;
}

/* .testAlert {
	height: 40px;
	padding-top: 1%;
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
				<div class="mlabel" align="center">회원 정보 보기</div>
				
				<div class="minfo">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
							<form id="imageform" action="imgUpload.at" method="post" enctype="multipart/form-data">
								<input id="profileimagefile" type="file" name="uploadFile" style="display:none;" onchange="LoadImg(this);">
								<c:if test="${ empty sessionScope.account.pimage}">
									<input type="hidden" name="photoflag" value="insert">
								</c:if>
								<c:if test="${ !empty sessionScope.account.pimage}">
									<input type="hidden" name="photoflag" value="update">
								</c:if>
								<c:if test="${empty sessionScope.account.pimage }">
									<img id="profileimage" class="img-circle img-responsive" src="images/myinfo/basic.png" style="max-width:170px;min-width:170px;min-height:170px;max-height:170px; width:170px; heigh:150px; cursor:pointer" onclick="document.all.uploadFile.click();">
								</c:if>
								<c:if test="${!empty sessionScope.account.pimage }">
									<img id="profileimage" class="img-circle img-responsive" src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" style="min-width:170px;min-height:170px;max-width:170px;max-height:170px; width:170px; heigh:150px; cursor:pointer" onclick="document.all.uploadFile.click();">
								</c:if>
							</form>
						</div>
						
						<script>
							function LoadImg(value){
						 		if(value.files && value.files[0]){
						 			var reader = new FileReader();
						 			reader.onload = function (e){
						 				$("#profileimage").attr("src", e.target.result);
						 			}
						 			reader.readAsDataURL(value.files[0]);
						 		}
							}
							
							function photosubmit(){
								$("#imageform").submit();
							}
						</script>
						
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow mname" align="center">
							<div>
							회원명 | <c:if test="${ empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.account.nickname }" readonly/>
		                 			</c:if>
		                 			
		                 			<c:if test="${ !empty sessionScope.party.pname}">
		                 				<input type="text" name="pname" class="mnameText" placeholder="이름" value="${ sessionScope.party.pname }" readonly/>
		                 			</c:if>
		       
							</div>
							
							<div style="margin-top:20px;">
		                 		<c:if test="${empty sessionScope.account.pimage }">
		                 			<button id="insertphoto" class="btn btn-info" onclick="photosubmit();">사진추가하기</button>
		                 		</c:if>
		                 		<c:if test="${!empty sessionScope.account.pimage }">
		                 			<button id="updatephoto" class="btn btn-info" onclick="photosubmit();">사진변경하기</button>
		                 		</c:if>
		                 	</div>
						</div>						
						
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><label class="mgrade">${ sessionScope.account.idtype }</label></div>
													
						<c:choose>
        					<c:when test="${ sessionScope.account.idtype == '일반회원' || sessionScope.account.idtype == '승인요청'}">
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input id="investApply" type="button" class="mbtn1" value="투자 회원 신청"></div>
							</c:when>
						</c:choose>
						<!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mrow" align="center"><input type="button" class="mbtn1" value="투자 회원 신청" onclick="return goSellerinfo();"></div> -->
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
										<li class="act"><a class="active" href="myinfo.ao">회원 정보 설정<span class="sr-only">(current)</span></a></li>										
										
										<!-- c:if문 걸어서 일반회원이 아닐때만 조건문  -->
										<!-- <li style="display:none;"><a class="otherActive" style="cursor:pointer;">판매자 정보 변경</a></li> -->
										<c:choose>
        									<c:when test="${ sessionScope.account.idtype == '판매자'}">
        										<li><a href="sellerinfo.ao" class="otherActive">판매자 정보 수정</a></li>
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

						<div class="account-wrap">
							<h3 class="mh3">기본 정보 설정</h3>
						
							<br>
						
							<div class="minput" align="center">
								<div class="email-input-wrap">
									<form action="changeMyinfo.ao" method="post">
									
										<h6 align="left">이름</h6>
										<c:if test="${ empty sessionScope.party.pname}">
		                 					<input type="text" name="name" class="input-text" placeholder="이름" value=""/>
		                 				</c:if>
		                 			
		                 				<c:if test="${ !empty sessionScope.party.pname}">
		                 					<input type="text" name="name" class="input-text" placeholder="이름" value="${ sessionScope.party.pname }" maxlength="10"/>
		                 				</c:if>
		                 			
		                 				<h6 align="left">닉네임</h6>
		                 				<input type="text" name="nickname" class="input-text" placeholder="닉네임" value="${ sessionScope.account.nickname }" maxlength="10"/>
		                 			
		                 				<br>
		                 			
		                 				<div class="email-input-wrap small">
											<div class="btn-wrap">
												<input type="submit" id="saveNameBtn" class="pwdBtn btn-block-purple" value="설정하기">
	                        				</div>
	                     				</div>
	                     			
	                     			</form>
	                     			
	                     			<br><br>	                     			                       			
	                 
	                       				<div class="input-btn-wrap">
	                        				<h6 align="left">이메일</h6>
	                        				<div class="input">
	                            				<input type="text" id="userEmail" name="email" class="input-text" placeholder="이메일 계정" value="${ sessionScope.account.email }">
	                          				</div>
	                          				
	                          				<span id="mEmailChange">
	                          					<input type="submit" id="emailChangeBtn" class="emailChange emailAuthBtn mbtn" value="변경" style="color:#fff;">
	                          				</span>		                                               				                          				
	                          				                        				
	                          				<span id="mEmailCheck" style="display:none;">
	                          					<input type="submit" id="emailCheckBtn" class="emailCheck emailAuthBtn mbtn" value="인증하기" style="color:#fff;">
	                          				</span>
	                          				
	                          				<p class="alert alert-danger" id="mEmailCheckInput" style="display:none; margin-top:20px;"></p>
	                          					
	                          				<span id="mEmailRetry" style="display:none;">
	                          					<input type="submit" id="emailRetryBtn" class="emailRetry emailAuthBtn mbtn" value="재전송" style="color:#fff;">
	                          				</span>
	                          				
	                          				<div class="input" id="certifyNumber" style="display:none">
	                            				<input type="text" id="authenticNum" name="certifyNumber" class="input-text" placeholder="인증번호" value="">
	                          				</div>
	                          				
	                          				<input type="submit" id="certifyNumBtn" class="certifyNumBtn mbtn" value="인증완료" style="color:#fff; display:none; margin-top:7px;">	
	                          				
                          				    <p class="alert alert-danger" id="authComplete" style="margin-top:7px;"></p>
                          				    <p class="alert alert-danger" id="authIncorrect" style="margin-top:7px;"></p>                      					                      					                          			
	                        			</div>

	                        		<br>
	                        		
	                        		<em class="line"></em>             			                        	                     	
									
									<!-- <form action="changePwd.ao" method="post" onsubmit="return savePwd();">	 -->
										<div id="accountWrap">
            	            				<div id="newContainer">
                								<div class="account-wrap">
                    								<h3 class="mh32">비밀번호 설정</h3>
                    								<div class="email-input-wrap">                  								
                        								<input type="password" id="oldPwd" name="oldPwd" class="input-text" placeholder="현재 비밀번호" />
                        								                        								
                        								<p class="alert alert-danger" id="oldPwdInput"></p>
                        								
                        								<input type="password" id="newPwd" class="input-text" placeholder="새 비밀번호" />
                        								<p class="alert alert-danger" id="newPwdInput"></p>
                        								
    													<div class="checkSign form-group has-success has-feedback">     
        													<input type="password" name="newPwd" id="newPwd2" class="input-text" id="inputSuccess" placeholder="새 비밀번호 확인">
        													<span id="gicon" class="checkSign glyphicon form-control-feedback" style="margin-top:7px"></span>
    													</div>
    													<p class="alert alert-danger" id="newPwdInput2"></p>    													
    													<p class="alert alert-danger" id="newPwdInputSame"></p>                       								
                    								</div>
                								</div>
            								</div>
        								</div>
        							
        								<br>
						
										<div class="email-input-wrap small">
											<div class="btn-wrap">
												<input type="submit" id="savePwdBtn" class="pwdBtn btn-block-purple" value="설정하기">
	                        				</div>
	                     				</div>	                     			
	                     			<!-- </form>	 -->
	                     			
	                     			<script>
	                     				// 인증번호
	                     				var codeList = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
 								   
										var authNumber="";
										
										var pwd = "<c:out value='${ sessionScope.account.pwd }'/>";
	                     			
        								$(function(){ 
        									// 비밀번호 
        									
        									$("#savePwdBtn").click(function(){
        										if($("#oldPwd").val() == "") {
        											$("#oldPwdInput").addClass("alert alert-danger");
        											$("#oldPwdInput").html("현재 비밀번호를 입력해주세요.");
        											return false;
        										}
        										        										
        										else if($("#newPwd").val() == "") {
        											$("#newPwdInput").addClass("alert alert-danger");
        											$("#newPwdInput").html("새 비밀번호를 입력해주세요.");
        											return false;
        										}
        										
        										else if($("#newPwd2").val() == "") {
        											$("#newPwdInput2").addClass("alert alert-danger");
        											$("#newPwdInput2").html("새 비밀번호를 입력해주세요.");
        											return false;
        										}
        										
        										else {
        											$.ajax({
        												url: "changePwd.ao",
        												type: "post",
        												data: {"oldPwd" : $("#oldPwd").val(), 
        													   "newPwd" : $("#newPwd").val(), 
        													   "ano" : "${ sessionScope.account.ano }"},
        												success: function(data){
        													if(data > 0) {
        														alert("비밀번호 변경이 되었습니다.");
            													location.href="myinfo.ao";
        													}
        													else {
        														alert("비밀번호를 변경할 수 없습니다. 뭔가 잘못되었나봐요.");
        													}        													
        												}
        											});
        										}
        									});
        									
        									$("#oldPwdInput").removeClass("alert alert-danger");
        									$("#newPwdInput").removeClass("alert alert-danger");
        									$("#newPwdInput2").removeClass("alert alert-danger");
        									$("#newPwdInputSame").removeClass("alert alert-danger");       									
        									
        									$("#newPwd2").focusout(function(){
        										if($("#newPwd").val() != "" && $("#newPwd2").val() != "") {
        											if($("#newPwd").val() == $("#newPwd2").val()){
            											$("#gicon").removeClass("glyphicon-remove-circle");
            											$("#gicon").addClass("glyphicon-ok-circle");
            											$("#gicon").css("color", "green");            											
            										}
            										
            										else{
            											$("#gicon").removeClass("glyphicon-ok-circle");
            											$("#gicon").addClass("glyphicon-remove-circle");
            											$("#gicon").css("color", "red");
            											$("#newPwdInputSame").addClass("alert alert-danger");
            											$("#newPwdInputSame").html("새 비밀번호를 동일하게 입력해주세요");
            											return false;
            										}
        										}
        										
        										else {
        											$("#gicon").removeClass("glyphicon-remove-circle");
        											$("#gicon").removeClass("glyphicon-ok-circle");
        											return false;
        										}
        									});
        									
        									// 이메일
        									$("#authComplete").removeClass("alert alert-danger");
        									$("#authIncorrect").removeClass("alert alert-danger");
        									
        									$("#mEmailChange").click(function(){
        										$("#mEmailChange").hide();
    											$("#mEmailCheck").show();    											
    											$("#mEmailRetry").hide();
    											$("#userEmail").val("");
    											$("#authComplete").removeClass("alert alert-danger");
    											$("#authIncorrect").removeClass("alert alert-danger");
    										});
        									
        									$("#emailCheckBtn").click(function(){    											
    											if($("#userEmail").val() != "") {
    												$("#mEmailChange").hide();
            										$("#mEmailCheck").hide();    											    											    											
        											$("#mEmailRetry").show();
        											$("#certifyNumber").show();
        											$("#certifyNumBtn").show();
    												$("#userEmail").val();
    												$("#mEmailCheckInput").hide();
    												$("#authComplete").removeClass("alert alert-danger");
    												$("#authIncorrect").removeClass("alert alert-danger");
    											}
    											
    											else {
    												$("#mEmailCheckInput").show();
    												$("#mEmailCheckInput").html("이메일을 입력하세요.");    												
    											}
    										});
        									
        									$("#mEmailRetry").click(function(){
        										sendAuthMail();
    										});
        									
        									$("#emailCheckBtn").click(function() {
        										sendAuthMail();        										
        									});
        									
        									$("#investApply").click(function(){
        										var name ='<c:out value="${sessionScope.party.pname}"/>';
    											console.log(name)
        										if(name == "") {
        											alert("회원정보 설정에서 이름을 반드시 입력하세요!");
        											return false;
        										}
        										
        										else {
        											location.href = "sellerinfo.ao";
        										}
        									});
        									        									
        									$("#certifyNumBtn").click(function() {
        										if($("#authenticNum").val() == "") {        											
        											$("#authComplete").addClass("alert alert-danger");
        											$("#authComplete").html("인증번호를 입력해주세요");
        											$("#authIncorrect").removeClass("alert alert-danger");
        											return false;
        										}
        										 
        										else {
        											if($("#authenticNum").val() == authNumber) {
        												$("#authComplete").removeClass("alert alert-danger");
        												
        												$.ajax({
        													url: "authNumerCheck.ao",
        													type: "get",
        													data: {"email" : $("#userEmail").val(), "ano" : "${ sessionScope.account.ano }"},
        													success: function(data) {
        														alert("아이디와 이메일이 변경되었습니다. 다시 로그인 해주세요.");
        														location.href = "logout.ao";
        													}
        												});
            										}
            										
        											else {
            											$("#authComplete").removeClass("alert alert-danger");
            											$("#authIncorrect").addClass("alert alert-danger");
            											$("#authIncorrect").html("인증번호가 일치하지 않습니다.");
            										}
        										}        																						
        									});
       									});
        								
        								function sendAuthMail() {							        								    
        									for(var i=0; i<8; i++){
        								    	var num = Math.floor(Math.random() * 33);
        								    	authNumber += codeList[num];
        								    }
        								    console.log("authNumber : " + authNumber);
    										
    										$.ajax({
    											url: "authEmail.ao",
    											type: "get",
    											data: {"email" : $("#userEmail").val(), "authNumber" : authNumber},
    											success: function(data){
    												alert("인증메일을 발송하였습니다.");
    											}
    										});    										
        								}        								
        								
        								/* function savePwd (){
    										if($("#oldPwd").val() == "") {
    											$("#oldPwdInput").addClass("alert alert-danger");
    											$("#oldPwdInput").html("현재 비밀번호를 입력해주세요.");
    											return false;
    										}
    										
    										if($("#newPwd").val() == "") {
    											$("#newPwdInput").addClass("alert alert-danger");
    											$("#newPwdInput").html("새 비밀번호를 입력해주세요.");
    											return false;
    										}
    										
    										if($("#newPwd2").val() == "") {
    											$("#newPwdInput2").addClass("alert alert-danger");
    											$("#newPwdInput2").html("새 비밀번호를 입력해주세요.");
    											return false;
    										}
    									}; */
        							</script>																			
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