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
							<c:if test="${ empty sessionScope.party.pname}">
								<input type="hidden" name="photoflag" value="insert">
							</c:if>
							<c:if test="${ !empty sessionScope.party.pname}">
								<input type="hidden" name="photoflag" value="update">
							</c:if>
							<input id="profileimagefile" type="file" name="uploadFile" style="display:none;" onchange="LoadImg(this);">
							<c:if test="${empty sessionScope.account.pimage }">
								<img id="profileimage" class="img-circle img-responsive" src="images/myinfo/basic.png" style="max-width:170px;max-height:170px; width:170px; heigh:150px; cursor:pointer" onclick="document.all.uploadFile.click();">
							</c:if>
							<c:if test="${!empty sessionScope.account.pimage }">
								<img id="profileimage" class="img-circle img-responsive" src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" style="max-width:170px;max-height:170px; width:170px; heigh:150px; cursor:pointer" onclick="document.all.uploadFile.click();">
							</c:if>
							<!-- <img class="img-circle img-responsive" src="images/myinfo/basic.png" style="max-width:170px;max-height:170px; width:170px; heigh:150px; cursor:pointer" onclick="uploadFile();"> -->
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
										<li class="act"><a class="active" href="myinfo.ao">회원 정보 설정<span class="sr-only">(current)</span></a></li>
										<li><a href="sellerinfo.ao" class="otherActive">판매자 정보 변경</a></li>
										<li><a href="joinproject.ao" class="otherActive">참여한 프로젝트</a></li>
										<li><a href="puttoproject.ao" class="otherActive">찜한 프로젝트</a></li>
										<li><a href="newproject.ao" class="otherActive">개설한 프로젝트</a></li>
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
		                 					<input type="text" name="name" class="input-text" placeholder="이름" value="${ sessionScope.party.pname }"/>
		                 				</c:if>
		                 			
		                 				<h6 align="left">닉네임</h6>
		                 				<input type="text" name="nickname" class="input-text" placeholder="닉네임" value="${ sessionScope.account.nickname }"/>
		                 			
		                 				<br>
		                 			
		                 				<div class="email-input-wrap small">
											<div class="btn-wrap">
												<input type="submit" id="saveBtn" class="pwdBtn btn-block-purple" value="설정하기">
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
	                          				
	                          				<!-- <form action="certifyEmail.ao" method="post">  -->                        				                          				
	                          				                        				
	                          				<span id="mEmailCheck" style="display:none;">
	                          					<input type="submit" id="emailCheckBtn" class="emailCheck emailAuthBtn mbtn" value="인증하기" style="color:#fff;">
	                          				</span>
	                          				
	                          				<p class="alert alert-danger" id="mEmailCheckInput" style="display:none; margin-top:20px;"></p>
	                          					
	                          				<span id="mEmailRetry" style="display:none;">
	                          					<input type="submit" id="emailRetryBtn" class="emailRetry emailAuthBtn mbtn" value="재전송" style="color:#fff;">
	                          				</span>
	                          				
	                          				<div class="input" id="certifyNumber" style="display:none">
	                            				<input type="text" name="certifyNumber" class="input-text" placeholder="인증번호" value="">
	                          				</div>
	                          				
	                          				<input type="submit" id="certifyNumBtn" class="certifyNumBtn mbtn" value="인증완료" style="color:#fff; display:none; margin-top:7px;">	                          				                          					
	                          				<!-- </form>   -->                       					                          			
	                        			</div>
	                        			
		
	                        				<!-- <div id="emailConfirmArea" class="input-btn-wrap" style="display:none">	                          			
	                            				<div class="input">
	                                				<input type="text" id="emailAuthCode" class="input-text" placeholder="인증번호">
	                                				<input type="hidden" id="emailConfirmId" value="">
	                                				<time class="limit_time" style="position:relative;top:-39px;left:85%;text-align:right;">
	                                					<span id="emailMs_timer" style="color:#50e3c2;font-size:13px;"></span>
	                                				</time>
	                            				</div>
	                            				                            			
	                            				<input type="submit" id="emailConfirmBtn" class="emailAuthBtn mbtn" value="인증완료" style="color:#fff;">		                            			                            			 	                            
	                        				</div> -->
	                        			
	                        			
	                        			
	                        			<!-- <p id="emailCheckNumberError" class="error-text emailMsg">인증번호를 잘못 입력하셨습니다. 다시 입력해주세요.</p>
	                        			<p id="emailTimeOutTokenError" class="error-text emailMsg">기간이 만료된 인증번호입니다. 다시 입력해주세요.</p>
	                        			<p id="emailTimeOutError" class="error-text emailMsg">시간이 종료되었습니다. 다시 인증해주세요.</p>
	                        			<p id="emailSuccessNumberCheckMsg" class="error-text emailMsg" style="color:#50e3c2;">인증이 완료되었습니다.</p>
	                        			<p id="emailError" class="error-text emailMsg">이메일 형식이 올바르지 않습니다.</p>
										<p id="emailJoinedError" class="error-text emailMsg">이미 회원가입된 계정입니다. 다른 이메일을 입력해주세요.</p>
										<p id="checkEmailInfo" class="info-text emailMsg">이메일 인증이 필요합니다.</p>
										<p id="changeEmailInfo" class="info-text emailMsg">로그인 아이디와 안내 메일 발송 주소가 변경됩니다.</p>
										<p id="sendEmailInfo" class="info-text emailMsg">인증메일이 발송되었습니다.</p> 	 -->                        		

	                        		<br>
	                        		
	                        		<em class="line"></em>             			                        	                     	
									
									<form action="" method="post" onsubmit="return savePwd();">	
										<div id="accountWrap">
            	            				<div id="newContainer">
                								<div class="account-wrap">
                    								<h3 class="mh32">비밀번호 설정</h3>
                    								<div class="email-input-wrap">                  								
                        								<input type="password" id="oldPwd" name="oldPwd" class="input-text" placeholder="현재 비밀번호" />
                        								                        								
                        								<p class="alert alert-danger" id="oldPwdInput"></p>
                        								<!-- <p id="oldPasswordError" class="error-text">현재 비밀번호가 일치 하지 않습니다.</p> -->
                        								
                        								<input type="password" id="newPwd" class="input-text" placeholder="새 비밀번호" />
                        								<p class="alert alert-danger" id="newPwdInput"></p>
                        								<!-- <p id="passwordError" class="pwd-text">영문, 숫자, 특수문자 (!@#$%^&*+=-)를 모두 조합한 8자 이상</p> -->
                        								
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
												<input type="submit" id="saveBtn" class="pwdBtn btn-block-purple" value="설정하기">
	                        				</div>
	                     				</div>	                     			
	                     			</form>	
	                     			
	                     			<script>
        								$(function(){
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
            											return false;
            										}
        										}
        										
        										else {
        											$("#gicon").removeClass("glyphicon-remove-circle");
        											$("#gicon").removeClass("glyphicon-ok-circle");
        											return false;
        										}
        									});
        									
        									$("#mEmailChange").click(function(){
        										$("#mEmailChange").hide();
    											$("#mEmailCheck").show();    											
    											$("#mEmailRetry").hide();
    											$("#userEmail").val("");
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
    												
    											}
    											
    											else {
    												$("#mEmailCheckInput").show();
    												$("#mEmailCheckInput").html("이메일을 입력하세요.");    												
    											}
    										});
        									
        									$("#mEmailRetry").click(function(){
        										
    										});
       									});
        								
        								function savePwd (){
    										if($("#oldPwd").val() == "") {
    											$("#oldPwdInput").addClass("alert alert-danger");
    											$("#oldPwdInput").html("현재 비밀번호를 입력해주세요.");
    											/* alert("현재 비밀번호를 입력해주세요."); */
    											return false;
    										}
    										
    										else if($("#newPwd").val() == "") {
    											$("#newPwdInput").addClass("alert alert-danger");
    											$("#newPwdInput").html("새 비밀번호를 입력해주세요.");
    											/* alert("새 비밀번호를 입력해주세요."); */
    											return false;
    										}
    										
    										else if($("#newPwd2").val() == "") {
    											$("#newPwdInput2").addClass("alert alert-danger");
    											$("#newPwdInput2").html("새 비밀번호를 입력해주세요.");
    											/* alert("새 비밀번호를 입력해주세요."); */
    											return false;
    										}
    										
    										else if($("#newPwd").val() != $("#newPwd2").val()) {
    											$("#newPwdInputSame").addClass("alert alert-danger");
    											$("#newPwdInputSame").html("새 비밀번호를 동일하게 입력해주세요");
    											return false;
    										}
    									};
    									
    									function certifyEmail() {
    										/* $("#emailChangeBtn").click(function(){
    											$("#emailChangeBtn").removeClass("emailChange emailAuthBtn mbtn");
    											$("#emailCheckBtn").addClass("emailCheck emailAuthBtn mbtn");
    										}); */
    									};
    									
    									var ch = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
    									
    									
    									
    									var aNum = "";
    									
    									/* char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
    						            StringBuffer sb = new StringBuffer();
    						            Random rn = new Random();
    						            for( int i = 0 ; i < 10 ; i++ ){
    						                sb.append( charaters[ rn.nextInt( charaters.length ) ] );
    						            }
    						            String pw =  sb.toString(); */
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