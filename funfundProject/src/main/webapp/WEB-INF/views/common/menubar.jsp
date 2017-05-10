<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#login_form").submit(function(){
			var email=$("#login_form input[name=email]").val();
			var pwd=$("#login_form input[name=pwd]").val();
			var rememberEmail=$("#login_form input[name=remember_email]").is(":checked");
			if(rememberEmail){
				$.cookie("user_email", email);
			}else{
				$.removeCookie("user_email");
			}
			if(email==""){
				fadeOutMessage("이메일을 입력하세요", 2000);
				$("#login_form input[name=email]").focus();
				return false;
			}
			if(pwd==""){
				fadeOutMessage("비밀번호를 입력하세요", 2000);
				$("#login_form input[name=pwd]").focus();
				return false;
			}
		});

	})
</script>
<style>
.middle-menubar{
	width:100%;
   margin-left:auto;
   margin-right:auto;
   position:relative;
   z-index:100;
}
a{
   text-decoration:none;
}
a:active, a:hover{
	text-decoration:none;
	outline:0;
}

.fun-menu{
	color:orange;
	font-weight:bold;
	position:relative;
	top:20px;
}
.login-title-txt {
    font-size:0;
}
span.login-title_txt {
    font-size:12px;
    font-weight:700;
    border: 0px;
}

span.lineor {
    font-size:12px;
    padding:0 5px;
    color:#707070;
    font-weight:500;
    text-align:center;
    background-color: #fff;
}
p.lineor_bg {
    width:100%;
    margin-top:20px;
    margin-bottom:25px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/bg_lineor.gif);
    background-repeat: repeat-x;
    height:15px;
    text-align: center;
}
.p-login_btn {
    display: block;
    width:100%;
    padding:15px 0;
    margin: 0 0 5px 0;
    font-size:14px;
    font-weight:500;
    text-indent:45px;
    border-radius:3px;
    -webkit-border-radius:3px;
    -ms-border-radius:3px;
    -moz-border-radius:3px;
}
.login-social-facebook {
    color:#fff;
    background-color:#4e8cbb;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_fb.gif);
    background-repeat:no-repeat;
    background-position: 15px center;
    background-size:23px;
} 
.login-social-kakao {
    color:#3c1e1e;
    background-color:#ffeb00;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_ka.gif);
    background-repeat:no-repeat;
    background-position: 15px center;
    background-size:23px;
}

.login-social-google {
    color:#3c1e1e;
    background-color:#e6e6e6;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_g.gif);
    background-repeat:no-repeat;
    background-position: 15px center;
    background-size:23px;
}
.login-social-naver {
    color:#fff;
    background-color:#2db400;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_na.gif);
    background-repeat:no-repeat;
    background-position: 15px center;
    background-size:23px;
}
.signup-email {
    color:#ffffff;
    background-color:#cccccc;
    margin-bottom:5px;
    font-weight:500;
    text-align: center;
    text-indent:0;
}
.login-email > input {
    height:40px;
    margin-bottom: 6px;
    font-size:14px;
    text-indent: 10px;
    line-height: 14px;
    color:#d5d5d5;
    border:1px solid #d5d5d5;
    width:100%;
}
.login-email > input:focus {
    border:1px solid #e96931;
    color:#3b3b3b;
}
.btn-login_pop {
    font-size:15px;
    font-weight: 700;
    color:#fff;
    background-color: #e96931;
    text-align: center;
    vertical-align : baseline;
    border-radius: 20px;
    border:1px;
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    -ms-border-radius: 20px;
    margin-bottom:10px;
}
a.forget_pw {
    float:right;
    padding-top:8px;
    font-size:11px;
    line-height:11px;
    color:#3b3b3b;
}
a.forget_pw:hover {
    text-decoration: underline;
}
/* popup modal */
.modal {
	 box-sizing: border-box;
}
.modal-close {
    display:inline-block;
    color: white;
    float: right;
    width:24px;
    height:24px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_modal_close.png);
    background-repeat: no-repeat;
    font-size: 28px;
    font-weight: bold;
    padding:5px;
    z-index: 1000;
}
.modal-close:hover,
.modal-close:focus {
    cursor: pointer;
}
.modal-header {
    height:85px;
    border-radius:5px;
    -webkit-border-radius:5px;
    -ms-border-radius:5px;
    -moz-border-radius:5px;
}
.modal-header > h2.p-t-login {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_login.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-signup {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_signup.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-fdpw {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_fdpw.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-inquire {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_toopen.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-tozr {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_toorz.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-report {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_report.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-address {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_address.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-numcfm {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_numcfm.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-numcfmw {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_numcfmw.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-comment {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_comment.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-userprofile {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_userprofile.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-signupwr {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_signupwr.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-header > h2.p-t-replymsg {
    font-size:0;
    width:100%;
    margin:auto;
    height:71px;
    background-image: url(/resources/v2/img/title_replymsg.png);
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 284px 71px;
}
.modal-body {clear:both;}
.modal-body > p {
    display: inline-block;
    margin-bottom:10px;
    font-size:12px;
    line-height: 18px;
    color:#666666;
}
.modal-body > p.question {
    margin:16px 0 8px 0;
    font-weight:700;
    font-size:16px;
    color:#3b3b3b;
}
.modal-input-radio {
    display:block;
    font-weight:500;
    font-size:14px;
    text-align: left;
    letter-spacing:-0.5px;
    color:#707070;
}
.modal-input-radio > input {
    vertical-align: middle;
    margin:0 8px 0 0;
}
.modal-footer {
    padding: 10px 0 0 0;
    color: #000;
    text-align: center;
}
.btn-go_login {
    display: inline-block;
    padding:5px;
    font-size:12px;
    font-weight: 700px;
    text-decoration: underline;
    color:#e96931;
    border:0px solid #e96931;
    background: #fff;
}
p.go_signup {
    margin-top: 15px;
    text-align: center;
    font-size: 12px;
    color: #3b3b3b;
}
p.go_signup > a {
    color: #e96931;
    font-weight: 700;
    text-decoration: underline;
}
</style>

<title>Insert title here</title>

</head>
<body>
   <div class="row middle-menubar hidden-xs">
   
   <div class="col-lg-2 col-md-2 col-sm-2">
   	<img src="/funfund/images/common/logo.png" style="widht:400px;height:70px;">
   </div>
   <div class="col-lg-5 col-md-3 col-sm-2">
   	&nbsp;
   </div>
   <div class="col-lg-5 col-md-7 col-sm-8">
   		<table style="width:610px">
        	<tr>
            	<td style="width:150px;"><a class="fun-menu" href="make.do">프로젝트 등록하기</a></td>
           	 	<td style="width:150px;"><a class="fun-menu" href="funding.do">프로젝트 둘러보기</a></td>
            	<td style="width:80px;"><a class="fun-menu" href="notice/nList.do">고객센터</a></td>
            	<td style="width:80px;"><a class="fun-menu" href="#"  data-toggle="modal" data-target="#myModal">로그인</a></td>
            	<td style="width:150px;"><a class="fun-menu" href="myinfo.do">회원정보보기</a></td>
         	</tr>
      </table>
   </div>   
   </div>
  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
            <span class="modal-close" data-dismiss="modal" onclick="closeLoginBox();">&nbsp;</span>
            <h2 class="p-t-login">로그인</h2>
       </div>
      <div class="modal-body" style="padding:30px;">
      	<form id="login_form" action="/auth/login.do" method="post">
		<!-- <input type="hidden" name="secuToken" value="AMGTeZ912mzkHTrXtwiEPA"/> -->
        <div class="modal-body modal-body-login">
              <fieldset>
                <legend class="login-title-txt">소셜 로그인</legend>
                <a href="javascript:void(0);" class="signin-social p-login_btn login-social-facebook" data-sns="facebook" alt="페이스북으로 로그인" >페이스북으로 로그인</a>
           		<a href="javascript:void(0);" class="signin-social p-login_btn login-social-kakao"  data-sns="kakao"  alt="카카오로 로그인" >카카오로 로그인</a>
           		<a href="javascript:void(0);" id="gSignInBt" class="signin-social p-login_btn login-social-google"  data-sns="google"  alt="구글로 로그인" >구글로 로그인</a>
           		<a href="javascript:void(0);" id="nSignInBt" class="signin-social p-login_btn login-social-naver"  data-sns="naver"  alt="네이버로 로그인" >네이버 로그인</a>
              </fieldset>

            <p class="lineor_bg"><span class="lineor">또는</span></p>
            <div class="login-email">
	            <input type="email" name="email" placeholder="이메일주소" autofocus="autofocus" /> <!-- 20160727 autofocus 추가 -->
	            <input type="password" name="pwd" placeholder="영문+숫자포함 6~20자" />
	            <a href="javascript:void(0);" class="forget_pw" onclick="switchToForgotBox();">비밀번호를 잊으셨나요?</a>
            </div>
            <label for="rememberemail" class="remeber_email">
            <input type="checkbox" id="rememberemail" name="remember_email" class="remeber_check"/>이메일기억하기</label>
        </div>
        <div class="modal-footer">
            <button class="btn-login_pop">로그인하기</button>
            <p class="go_signup">펀펀회원이 아니신가요? <a id="linkSignup" href="javascript:void(0);" onclick="SwitchSignupBox();">회원가입</a></p>
        </div>
        </form>  	
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$("#linkSignup").click(function(){
			$("#myModal").modal("hide");
			$("#myModal2").modal("show");
		})
	})
</script>
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
            <span class="modal-close" data-dismiss="modal" onclick="closeSignupBox();">&nbsp;</span>
            <h2 class="p-t-signup">회원가입</h2>
       </div>
      <div class="modal-body" style="padding:30px;">
      	<form>
              <fieldset>
                <legend class="login-title-txt">소셜 회원가입</legend>
                <a href="javascript:void(0);" class="signup-social p-login_btn login-social-facebook" data-sns="facebook" alt="페이스북으로 회원가입" >페이스북으로 회원가입</a>
            	<a href="javascript:void(0);" class="signup-social p-login_btn login-social-kakao" data-sns="kakao" alt="카카오로 회원가입" >카카오로 회원가입</a>
            	<a href="javascript:void(0);" id="gSignUpBt" class="signup-social p-login_btn login-social-google" data-sns="google" alt="구글로 회원가입" >구글로 회원가입</a>
           		<a href="javascript:void(0);" id="nSignUpBt" class="signin-social p-login_btn login-social-naver"  data-sns="naver"  alt="네이버로 로그인" >네이버 회원가입</a>
              </fieldset>
            </form>
            <p class="lineor_bg"><span class="lineor">또는</span></p>
            <form>
              <fieldset>
                <legend class="login-title-txt">이메일 회원가입</legend>
                <a href="javascript:void(0);" class="signup-email p-login_btn" alt="" onclick="signupWithEmail();">이메일로 회원가입</a>
              </fieldset>
            </form>
            <p class="go_signup">이미 펀펀의 회원이신가요?</p>
            <button class="btn-go_login" onclick="switchToLoginBox();">로그인하러가기</button>
      </div>
    </div> 
  </div>
</div>
</body>
</html>