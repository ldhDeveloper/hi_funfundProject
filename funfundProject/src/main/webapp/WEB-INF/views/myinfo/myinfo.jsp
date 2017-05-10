<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	height: 100px;
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

/* .mgrade {
	width: 70%;
	position: relation;
	z-index: 20px;
	border: 1px solid #8CD4BE;
	background-color: #fff;
	text-align: center;
	padding-top: 2%;
	color: #4D525B;
	font-size: 1vw;
} */

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

.mh3 {
	/* font-size: 1.5vw; */
	padding-left : 30%;
}

.fun-menu{
	color:teal !important;
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
.input-btn-wrap .btn{width:28%;margin-left:4px;display:block;background:#8c8881;height:46px;line-heigh:46px;border:none;text-align:center;}
.input-btn-wrap .mbtn{width:28%;margin-left:4px;display:block;background:#8c8881;height:46px;line-heigh:46px;border:none;text-align:center;}
.input-btn-wrap .btn.post{margin-left:0;margin-bottom:7px;}
.input-btn-wrap .btn button{border:0;background:none;cursor:pointer;width:100%;}
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
}

.mbtn span{line-height:46px;font-size:13px;color:#ffffff;}

a.btn-block-purple, button.btn-block-purple{display:block;width:100%;height:42px;line-height:42px;text-align:center;font-size:15px;color:#fff;border:none;background:#50e3c2;cursor:pointer;}
a.btn-block-purple.disable, button.btn-block-mint.disable{background:rgba(80, 226, 193, 0.5);cursor:default;}

.mh32 {
	padding-left: 2%;
}

/* .bar {
	color: #777;
	padding-top: 12%;
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
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- <label class="bar">기본 정보 설정</label>&nbsp;&nbsp; -->
      <a class="navbar-brand">회원 메뉴</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li class="active"><a href="#">회원 정보 설정 <span class="sr-only">(current)</span></a></li>
        <li><a href="sellerinfo.do" class="w3-hover-teal">판매자 정보 변경 </a></li>
        <li><a href="joinproject.do" class="w3-hover-teal">참여한 프로젝트</a></li>
        <li><a href="#" class="w3-hover-teal">찜한 프로젝트</a></li>
        <li><a href="#" class="w3-hover-teal">개설한 프로젝트</a></li>
        <li><a href="#" class="w3-hover-teal">나의 펀딩 현황</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
					
					<div class="account-wrap">
						<h3 class="mh3">기본 정보 설정</h3>
						
						<br>
						
						<div class="mimg" align="center">
							<img class="img-circle img-responsive" src="images/수현찡.jpg" style="max-width:100px;max-height:100px;"><!-- 사진 값이 들어갈 곳  -->
						</div>
						
						<br>
						
						<div class="minput" align="center">
							<div class="email-input-wrap">
		                 	<input type="text" name="nickName" class="input-text" placeholder="닉네임" value="김진항"/>
	                        <div class="input-btn-wrap">
	                        	<div class="input">
	                            	<input type="text" id="userName" name="userName" class="disable input-text" placeholder="이메일 계정" value="jinhang89@gmail.com" disabled/>
	                          	</div>
	                          	<div id="emailChangeBtn" class="emailAuthBtn mbtn" data-status="change">
	                            	<a href="#" class="mbtnButton" onclick="return false;">
	                                	<span>변경</span>
	                              	</a>
	                          	</div>
	                          	<div id="emailCheckBtn" class="emailAuthBtn mbtn" style="display:none;" data-status="check">
	                            	<a href="#" onclick="return false;">
	                                	<span>인증하기</span>
	                              	</a>
	                          	</div>	                          	
	                          	<div id="emailRetryBtn" class="emailAuthBtn mbtn" style="display:none;" data-status="retry">
	                              	<a href="#" onclick="return false;">
	                                  	<span>재전송</span>
	                              	</a>
	                          	</div>
	                        </div>
	                        <div id="emailConfirmArea" class="input-btn-wrap" style="display:none;">
	                            <div class="input">
	                                <input type="text" id="emailAuthCode" class="input-text" placeholder="인증번호" />
	                                <input type="hidden" id="emailConfirmId" value="">
	                                <time class="limit_time" style="position:relative;top:-39px;left:85%;text-align:right;">
	                                	<span id="emailMs_timer" style="color:#50e3c2;font-size:13px;"></span>
	                                </time>
	                            </div>
	                            <div id="emailConfirmBtn" class="emailAuthBtn mbtn" data-status="confirm">
	                                <a href="#" onclick="return false;">
	                                    <span>인증완료</span>
	                                </a>
	                            </div>
	                        </div>
	                        
	                        <div class="input-btn-wrap">
	                          <div class="input">
	                              <input id="mobileNumber" name="mobileNumber" type="tel" class=" input-text" placeholder="휴대폰 번호" maxlength="11" value="" />
	                          </div>
	                          <div id="mobileCheckBtn" class="mobileAuthBtn mbtn"  data-status="check">
	                              <a href="#" onclick="return false;">
	                                  <span>인증하기</span>
	                              </a>
	                          </div>
	                          <div id="mobileChangeBtn" class="mobileAuthBtn mbtn" style="display:none;" data-status="change">
	                              <a href="#" onclick="return false;">
	                                  <span>변경</span>
	                              </a>
	                          </div>                          
	                          <div id="mobileRetryBtn" class="mobileAuthBtn mbtn" style="display:none;" data-status="retry">
	                              <a href="#" onclick="return false;">
	                                  <span>재전송</span>
	                              </a>
	                          </div>
	                        </div>
	                        <div id="mobileConfirmArea" class="input-btn-wrap" style="display:none;">
	                            <div class="input">
	                                <input type="text" id="authCode" class="input-text" placeholder="인증번호" />
	                                <input type="hidden" id="confirmId" value="">
	                                <time class="limit_time" style="position:relative;top:-39px;left:85%;text-align:right;">
	                                	<span id="smsMs_timer" style="color:#50e3c2;font-size:13px;"></span>
	                                </time>
	                            </div>
	                            <div id="confirmMobileBtn" class="mobileAuthBtn mbtn" data-status="confirm">
	                                <a href="#" onclick="return false;">
	                                    <span>인증완료</span>
	                                </a>
	                            </div>
	                        </div>	                     	              
						</div>
						
						<br>
						<br>
												
						<div id="accountWrap">
            				<!-- S : #newContainer -->
            			<div id="newContainer">
                		<!-- account-wrap -->
               				 <div class="account-wrap">
                    <h3 class="mh32">비밀번호 설정</h3>
                    <div class="email-input-wrap">
                    <form id="saveForm">
                        <input type="password" id="oldPassword" name="oldPassword" class="input-text" placeholder="현재 비밀번호" />
                        <!-- <p id="oldPasswordError" class="error-text">현재 비밀번호가 일치 하지 않습니다.</p> -->
                        <input type="password" id="newPassword" name="newPassword" class="input-text" placeholder="새 비밀번호" />
                        <!-- <p id="passwordError" class="pwd-text">영문, 숫자, 특수문자 (!@#$%^&*+=-)를 모두 조합한 8자 이상</p> -->
                        <input type="password" id="newPasswordConfirm" name="newPasswordConfirm" class="input-text" placeholder="새 비밀번호 확인" />
                        <!-- <p class="error-text">비밀번호가 같지 않습니다.</p> -->
                    
                       </form>
                    </div>
                </div>
            </div>
            <!-- E : #newContainer -->
        </div>
        
        <br>
						
						<div class="email-input-wrap small">
							<div class="btn-wrap">
								<button id="saveBtn" class="btn-block-purple">확인</button>
	                        </div>
	                     </div>												
					</div>
					
					
					<!-- <div class="myinfoUpdate">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">기본 정보 설정</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>				
					</div> -->
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>

<br><br>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원정보</title>

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>

</head>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src="/w3images/avatar2.png" class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card-2 w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="/w3images/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Designer, UI</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> London, UK</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
        </div>
      </div>
      <br>      
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card-2 w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Social Media template by w3.css</h6>
              <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
              <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
          </div>
        </div>
      </div>      
    <!-- End Middle Column -->
    </div>    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>
 
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

</body>
</html> --%>