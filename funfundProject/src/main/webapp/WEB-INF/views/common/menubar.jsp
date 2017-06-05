<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>
<%
	String path = request.getSession().getServletContext().getRealPath("/");
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 카카오  -->
<script src="https://apis.google.com/js/api:client.js"></script>
<link href="/funfund/lib/css/common/font.css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {

		Kakao.init('c04a7d5e62e926cf85109fde19aa531a');
		$("#login_form").submit(
				function() {
					var email = $("#login_form input[name=email]").val();
					var pwd = $("#login_form input[name=pwd]").val();
					var rememberEmail = $(
							"#login_form input[name=remember_email]").is(
							":checked");
					if (rememberEmail) {
						$.cookie("user_email", email);
					} else {
						$.removeCookie("user_email");
					}
					if (email == "") {
						fadeOutMessage("이메일을 입력하세요", 2000);
						$("#login_form input[name=email]").focus();
						return false;
					}
					if (pwd == "") {
						fadeOutMessage("비밀번호를 입력하세요", 2000);
						$("#login_form input[name=pwd]").focus();
						return false;
					}
				});
		/* loginFail(); //api 회원가입실패처리용 함수
		changeTempPwd(); //임시비밀번호전송용함수
		setPwd(); //임시비밀번호관련함수 */
		controllerReceiver();
	});
	function controllerReceiver(){
		//api 로그인 실패시
		var loginFail = '${loginFail}';//구글등으로 로그인시 회원가입실패한 경우 날라오는 경고문
		if (loginFail !== "") {
			alert(loginFail);
			home();
		}
		//임시비밀번호 띄우는창
		if ( "${tempEmail}" !== "") {
			$("#myModal9").modal("show");
		}
		//임시비밀번호 변경실패시
		var message = "${pwdMessage}";
		if (message != "") {
			alert(message);
			if (message == "임시비밀번호가 맞지않습니다." || message == "비밀번호 변경에 실패했습니다.") {
				$("#myModal9").modal("show");
			} else {
				home();
			}
		}
		//로그인 성공시
		if('${signupSuccess}' != ""){
		var answer =	confirm('${signupSuccess}');
			if(answer){
				$("#myModal").modal("show");
			}else{
				home();
			}
		}
		//일반 회원가입시 중복된아이디 존재시
		if('${duplicateId}' != ""){
			alert('${duplicateId}');
			home();
		}
	}
	function home() {
		location.href = "/funfund";
	}
	function checkPwd() {
		var pwdCheck = /^(?=.*[a-zA-Z]).(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
		var pwd =$("input[name=newPwd]").text()
		if(!pwdCheck.test(pwd)){
			alert('비밀번호는 영문, 숫자, 특수문자 포함 6~20자리 입니다.');
			$("input[name=newPwd]").focus();
			return false;
		}else if(pwd != $("input[name=confirmPwd]").text()) {
			alert('비밀번호와 확인란이 맞지않습니다.');
			$("input[name=confirmPwd]").focus();
			return false;
		}
	
	}
</script>
<!-- 결제 함수 -->


<script>
	//구글
	var googleUser = {};
	var profile;
	var nickname;
	var emaill
	var idtoken;
	var access_token;
	function googleLogin() {
		gapi
				.load(
						'auth2',
						function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2
									.init({
										client_id : '659736995246-ddl5nvftj5f76j3gk122g03t00n18pl7.apps.googleusercontent.com',
										cookiepolicy : 'single_host_origin',
										scope : 'profile'
									});
							auth2.attachClickHandler(document
									.getElementById('gSignupBt'), {}, function(
									googleUser) {
							}, function(error) {
								alert(JSON.stringify(error, undefined, 2));
							});
							auth2.signIn().then(
									function() {
										profile = auth2.currentUser.get()
												.getBasicProfile();

										nickname = profile.getName();
										email = profile.getEmail();
										pimage = profile.getImageUrl();
										/* alert(auth2.currentUser.getAuthResponse().id_token); */
										idtoken = auth2.currentUser.get()
												.getId();
										access_token = "없음";

										loginWithThirdParty(email, nickname,
												idtoken, access_token, pimage);
									});

						});
	};
	/* function googleSignOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });} */
</script>

<script type='text/javascript'>
	//common function for sns user
	function loginWithThirdParty(email, name, idtoken, access_token, pimage) {

		location.href = "loginWithApi.ao?email=" + email + "&nickname=" + name
				+ "&idtoken=" + idtoken + "&access_token=" + access_token
		"$pimage=" + pimage;
	}
	var nickname;
	var email;
	var idtoken;
	var access_token;

	//카카오톡 회원 로그인 
	// 카카오 로그인 버튼을 생성합니다.
	function loginWithKakao() {
		Kakao.Auth.login({
			success : function(authObj) {//로그인시도
				//alert(JSON.stringify(authObj));
				access_token = authObj.access_token;
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						nickname = res.properties.nickname;
						email = res.kaccount_email;
						pimage = res.properties.profile_image;
						alert(JSON.stringify(res));
						idtoken = res.id;
						loginWithThirdParty(email, nickname, idtoken,
								access_token, pimage);
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			},
			persistAccessToken : true
		});
	};
	//]]>
	/*   function KakaoLogout(){
	 Kakao.Auth.logout();
	 } */
	 //회원가입 체크 정규식
	 function infoCheck(flag){
		// if(flag){
			//var email = $(".signupFieldset").children('input[name=id]').val();
			//var emailCheck =/^[a-zA-Z][a-zA-Z0-9]+\@[a-zA-Z0-9]+\.[a-z]+/;
			//if(!emailCheck.test(email)){
				//alert('잘못된 형식의 이메일 입니다.');
				//$(".signupFieldset").children($('#id')).focus();
				//return false;
			//}else{
				// var pwd = $(".signupFieldset").children('input[name=pwd]').val(); 
				// alert(pwd);
				//	var confirmPwd = $(".signupFieldset").children('input[name=confirmPwd]').val();
				//	/* pwd.length < 6 || pwd.length > 20 || */
				//	if(pwd != confirmPwd){
			    //	alert('비밀번호와 확인문자가 일치하지않습니다.');
				//		$(".signupFieldset").children('input[name=confirmPwd]').focus();
				//		return false;
				//	}else{
				//		var pwdCheck = /^(?=.*[a-zA-Z]).(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
				//		if(!pwdCheck.test(pwd)){
				//			alert('비밀번호 길이는 6 ~ 20자 사이의 영문, 숫자 , 특수문자의 혼합이어야 합니다.')
				//			return false;
				//			}
				//		} 
				//	var nickname =	$(".signupFieldset").children('input[name=nickname]').val();
				//	var nicknameCheck= /(?=.*[a-zA-z0-9가-힣]).{2,10}$/;
				//	if(!nicknameCheck.test(nickname)){
				//		alert('닉네임 생성 규칙에 어긋납니다.');
				//		$(".signupFieldset").children('#nickname').focus();
				//		return false;
				//	} 
			//	}
		//	return true;
//	 }else{
//		 return false;
//	 } 
		return true;
	 }
</script>

<style>
.middle-menubar {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	position: relative;
	z-index: 100;
}

a {
	text-decoration: none;
}

a:active, a:hover {
	text-decoration: none;
	outline: 0;
}

.fun-menu {
	color: orange;
	font-weight: bold;
	position: relative;
	top: 20px;
}

.fun-menu2 {
	color: orange;
	font-weight: bold;
	top: 20px;
	display:inline-block;
	font-size:10pt;
	vertical-align:middle;
}

.login-title-txt {
	font-size: 0;
}

span.login-title_txt {
	font-size: 12px;
	font-weight: 700;
	border: 0px;
}

span.lineor {
	font-size: 12px;
	padding: 0 5px;
	color: #707070;
	font-weight: 500;
	text-align: center;
	background-color: #fff;
}

p.lineor_bg {
	width: 100%;
	margin-top: 20px;
	margin-bottom: 25px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/bg_lineor.gif);
	background-repeat: repeat-x;
	height: 15px;
	text-align: center;
}

.p-login_btn {
	display: block;
	width: 100%;
	padding: 15px 0;
	margin: 0 0 5px 0;
	font-size: 14px;
	font-weight: 500;
	text-indent: 45px;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-ms-border-radius: 3px;
	-moz-border-radius: 3px;
}

.login-social-facebook {
	color: #fff;
	background-color: #4e8cbb;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_fb.gif);
	background-repeat: no-repeat;
	background-position: 15px center;
	background-size: 23px;
}

.login-social-kakao {
	color: #3c1e1e;
	background-color: #ffeb00;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_ka.gif);
	background-repeat: no-repeat;
	background-position: 15px center;
	background-size: 23px;
}

.login-social-google {
	color: #3c1e1e;
	background-color: #e6e6e6;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_g.gif);
	background-repeat: no-repeat;
	background-position: 15px center;
	background-size: 23px;
}

.login-social-naver {
	color: #fff;
	background-color: #2db400;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_login_na.gif);
	background-repeat: no-repeat;
	background-position: 15px center;
	background-size: 23px;
}

.signup-email {
	color: #ffffff;
	background-color: #cccccc;
	margin-bottom: 5px;
	font-weight: 500;
	text-align: center;
	text-indent: 0;
}

.login-email>input {
	height: 40px;
	margin-bottom: 6px;
	font-size: 14px;
	text-indent: 10px;
	line-height: 14px;
	color: #d5d5d5;
	border: 1px solid #d5d5d5;
	width: 100%;
}

.login-email>input:focus {
	border: 1px solid #e96931;
	color: #3b3b3b;
}

.btn-login_pop {
	font-size: 15px;
	font-weight: 700;
	color: #fff;
	background-color: #e96931;
	text-align: center;
	vertical-align: baseline;
	border-radius: 20px;
	border: 1px;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	-ms-border-radius: 20px;
	margin-bottom: 10px;
}

a.forget_pw {
	float: right;
	padding-top: 8px;
	font-size: 11px;
	line-height: 11px;
	color: #3b3b3b;
}

a.forget_pw:hover {
	text-decoration: underline;
}
/* popup modal */
.modal {
	box-sizing: border-box;
}

.modal-close {
	display: inline-block;
	color: white;
	float: right;
	width: 24px;
	height: 24px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/icon_modal_close.png);
	background-repeat: no-repeat;
	font-size: 28px;
	font-weight: bold;
	padding: 5px;
	z-index: 1000;
}

.modal-close:hover, .modal-close:focus {
	cursor: pointer;
}

.modal-header {
	height: 85px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-ms-border-radius: 5px;
	-moz-border-radius: 5px;
}

.modal-header>h2.p-t-login {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_login.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-signup {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_signup.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-fdpw {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_fdpw.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-inquire {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_toopen.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-tozr {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_toorz.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-report {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_report.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-address {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_address.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-numcfm {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_numcfm.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-numcfmw {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_numcfmw.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-comment {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_comment.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-userprofile {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_userprofile.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-signupwr {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image:
		url(https://dauuuwinla3.cloudfront.net/resources/v2/img/title_signupwr.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-header>h2.p-t-replymsg {
	font-size: 0;
	width: 100%;
	margin: auto;
	height: 71px;
	background-image: url(/resources/v2/img/title_replymsg.png);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 284px 71px;
}

.modal-body {
	clear: both;
}

.modal-body>p {
	display: inline-block;
	margin-bottom: 10px;
	font-size: 12px;
	line-height: 18px;
	color: #666666;
}

.modal-body>p.question {
	margin: 16px 0 8px 0;
	font-weight: 700;
	font-size: 16px;
	color: #3b3b3b;
}

.modal-input-radio {
	display: block;
	font-weight: 500;
	font-size: 14px;
	text-align: left;
	letter-spacing: -0.5px;
	color: #707070;
}

.modal-input-radio>input {
	vertical-align: middle;
	margin: 0 8px 0 0;
}

.modal-footer {
	padding: 10px 0 0 0;
	color: #000;
	text-align: center;
}

.btn-go_login {
	display: inline-block;
	padding: 5px;
	font-size: 12px;
	font-weight: 700px;
	text-decoration: underline;
	color: #e96931;
	border: 0px solid #e96931;
	background: #fff;
}

.modal-body signup {
	padding: 0px;
}

#singup-tel-field {
	margin-top: 10px;
	padding: 15px 0;
	border-top: 1px dashed #d5d5d5;
	border-bottom: 1px solid #d5d5d5;
}

.tel-dsc {
	font-size: 11px;
	color: #707070;
}

.tel-dsc:before {
	margin-right: 5px;
	font-family: 'fontawesome';
	content: '\f061';
	font-size: 10px;
	font-weight: 200;
	color: #ccc;
}

.news-txt {
	display: block;
	text-align: right;
	font-size: 11px;
	color: #707070;
	margin-top: 5px;
}

p.go_signup {
	margin-top: 15px;
	text-align: center;
	font-size: 12px;
	color: #3b3b3b;
}

p.go_signup>a {
	color: #e96931;
	font-weight: 700;
	text-decoration: underline;
}

.signup-title-txt {
	font-size: 0;
}

.modal-body-signup fieldset {
	display: block;
}

label.sign-form_title {
	padding-right: 10px;
	font-size: 12px;
	font-weight: 700;
	line-height: 20px;
	color: #707070;
}

input.sign-form_input {
	height: 40px;
	margin-bottom: 6px;
	font-size: 14px;
	text-indent: 10px;
	line-height: 14px;
	color: #707070;
	border: 1px solid #d5d5d5;
	width: 100%;
}

input.sign-form_input:focus {
	border: 1px solid #e96931;
	color: #3b3b3b;
}

input.sign-form_input:active {
	border: 1px solid #e96931;
	color: #3b3b3b;
}

input.input_tel {
	width: 25%;
	display: inline-block;
	margin-right: 3px;
}

@media only screen and (max-width:679px) {
	input.sign-form_input {
		height: 35px;
		line-height: 23px;
		font-size: 13px;
	}
	input.input_tel {
		width: 23%;
		display: inline-block;
		margin-right: 1px;
		height: 35px;
		line-height: 23px;
		font-size: 13px;
	}
}

.text-center {
	text-align: center!ortant;
}

.text-left {
	text-align: left!ortant;
}

.text-right {
	text-align: right!ortant;
}

label.sign-form_title {
	padding-right: 10px;
	font-size: 12px;
	font-weight: 700;
	line-height: 20px;
	color: #707070;
}

/* left right show */
.modal.left .modal-dialog, .modal.right .modal-dialog {
	position: fixed;
	margin: auto;
	width: 320px;
	height: 100%;
	-webkit-transform: translate3d(0%, 0, 0);
	-ms-transform: translate3d(0%, 0, 0);
	-o-transform: translate3d(0%, 0, 0);
	transform: translate3d(0%, 0, 0);
}

.modal.left .modal-content, .modal.right .modal-content {
	height: 100%;
	overflow-y: auto;
}

.modal.left .modal-body, .modal.right .modal-body {
	padding: 15px 15px 80px;
}

/*Left*/
.modal.left.fade .modal-dialog {
	left: -320px;
	-webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, left 0.3s ease-out;
	-o-transition: opacity 0.3s linear, left 0.3s ease-out;
	transition: opacity 0.3s linear, left 0.3s ease-out;
}

.modal.left.fade.in .modal-dialog {
	left: 0;
}

/*Right*/
.modal.right.fade .modal-dialog {
	right: -320px;
	-webkit-transition: opacity 0.3s linear, right 0.3s ease-out;
	-moz-transition: opacity 0.3s linear, right 0.3s ease-out;
	-o-transition: opacity 0.3s linear, right 0.3s ease-out;
	transition: opacity 0.3s linear, right 0.3s ease-out;
}

.modal.right.fade.in .modal-dialog {
	right: 0;
}

/* ----- MODAL STYLE ----- */
.modal-content {
	border-radius: 0;
	border: none;
}

.modal-header {
	border-bottom-color: #EEEEEE;
	background-color: #FAFAFA;
}

.profile-image {
	width: 34px;
	height: 34px;
}

.navbar-brand {
	float: left;
	height: 50px;
	padding: 0px;
	font-size: 18px;
	line-height: 20px;
}

.navbar-toggle {
    position: relative;
    float: right;
    padding: 9px 10px;
    margin-top: 8px;
    margin-right: 15px;
    margin-bottom: 8px;
    background-color: transparent;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    margin-left:20px;
}
/* .navbar-default .navbar-toggle .icon-bar {
	background-color: orange;
} */
</style>

<title>Insert title here</title>

</head>
<body>
	<!-- pc 메뉴바 -->
	<div class="row middle-menubar hidden-xs">

		<div class="col-lg-2 col-md-2 col-sm-2">
			<img src="/funfund/images/common/logo.png"
				style="widht: 400px; height: 70px; cursor: pointer"
				onclick="home();">
		</div>
		<div class="col-lg-5 col-md-3 col-sm-2">&nbsp;</div>
		<div class="col-lg-5 col-md-7 col-sm-8">
			<table style="width: 610px">
				<tr>
					<c:if test="${empty sessionScope.account.id }">
						<td style="width: 150px;"><a class="fun-menu" href="make.do">프로젝트
								등록하기</a></td>
						<td style="width: 150px;"><a class="fun-menu"
							href="funding.it">프로젝트 둘러보기</a></td>
						<td style="width: 80px;"><a class="fun-menu"
							href="nList.no?bname=공지사항&page=1">고객센터</a></td>
						<td style="width: 80px;"><a class="fun-menu" href="#"
							data-toggle="modal" data-target="#myModal">로그인</a></td>
					</c:if>
					<c:if test="${not empty sessionScope.account.id }">

                        <td style="width: 150px;"><a class="fun-menu" href="make.do">프로젝트
								등록하기</a></td>
						<td style="width: 150px;"><a class="fun-menu"
							href="funding.it">프로젝트 둘러보기</a></td>
						<td style="width: 80px;"><a class="fun-menu"
							href="nList.no?bname=공지사항&page=1">고객센터</a></td>
						
						<td style="width : 40px;"><a class="fun-menu"
							data-toggle="modal" data-target="#myModal4"
							style="cursor: pointer"> <c:if
									test="${!empty sessionScope.account.pimage }">
									<img style="width: 34px;" class="img-circle img-responsive"
										src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" />
								</c:if> <c:if test="${empty sessionScope.account.pimage }">
									<img style="width: 34px;" class="img-circle img-responsive"
										src="images/myinfo/basic.png" />
								</c:if></a></td>
								
						<td style="width: 80px;"><a class="fun-menu" data-toggle="modal" data-target="#myModal4"
							style="cursor: pointer"><c:out
									value="${sessionScope.account.nickname}" /></a></td>
						
						<td style="width : 50px;"><a class="fun-menu"><i class="fa fa-envelope-open-o fa-2x" aria-hidden="true" id="message"></i></a></td>

						<!-- <td style="width:80px;"><a class="fun-menu" href="logout.ao">로그아웃</a></td>
            		<td style="width:150px;"><a class="fun-menu" href="myinfo.ao">회원정보보기</a></td> -->
					</c:if>
				</tr>
			</table>
		</div>
	</div>
		
		<script>
			$(function(){
				$("#message").click(function(){
					var url = "messagelist.mg?pro_no=${pro_no}";
					window.open(url, "", "width=400, height=300, left=600, top=200, status=0, location=0");
				});
					
				
			});
		</script>


	<!-- 모바일 메뉴바 -->
	<div class="row middle-menubar hidden-lg hidden-md hidden-sm">
		<c:if test="${empty sessionScope.account.id}">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand"><img
							src="/funfund/images/common/logo.png"
							style="width: 130px; height: 50px; cursor: pointer"
							onclick="home();"></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li style="display: inline-block"><a href="funding.it">프로젝트
									둘러보기</a></li>
							<li style="display: inline-block"><a data-toggle="modal"
								data-target="#myModal" style="cursor: pointer">로그인</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</c:if>
		<c:if test="${!empty sessionScope.account.id}">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="row navbar-header">
						<div style="float: right; padding-right: 30px; padding-top: 12px; vertical-align:middle;">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="modal"
							data-target="#myModal4" aria-expanded="false">
							<span class="sr-only"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
							<a class="fun-menu2" data-toggle="modal" data-target="#myModal4"
								style="cursor: pointer"><c:if
									test="${!empty sessionScope.account.pimage }">
									<img style="width: 34px;vertical-align:middle; "  class="img-circle img-responsive"
										src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>" />
								</c:if> <c:if test="${empty sessionScope.account.pimage }">
									<img style="width: 34px;vertical-align:middle; " class="img-circle img-responsive"
										src="images/myinfo/basic.png" />
								</c:if>
							</a> <a class="fun-menu2" data-toggle="modal" data-target="#myModal4"
								style="cursor: pointer;"><c:out
									value="${sessionScope.account.nickname}" /></a>
						</div>

						<a class="navbar-brand"><img
							src="/funfund/images/common/logo.png"
							style="width: 130px; height: 50px; cursor: pointer"
							onclick="home();"></a>
					</div>
				</div>
				<!-- /.container-fluid -->
			</nav>
		</c:if>

	</div>

	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span class="modal-close" data-dismiss="modal">&nbsp;</span>
					<h2 class="p-t-login">로그인</h2>
				</div>
				<div class="modal-body" style="padding: 30px;">
					<form id="login_form" action="login.ao" method="post">
						<!-- <input type="hidden" name="secuToken" value="AMGTeZ912mzkHTrXtwiEPA"/> -->
						<div class="modal-body modal-body-login">
							<fieldset style="border: 0; margin: 0; padding: 0;">
								<legend class="login-title-txt">소셜 로그인</legend>
								<a href="#"
									class="signin-social p-login_btn login-social-facebook"
									data-sns="facebook" alt="페이스북으로 로그인">페이스북으로 로그인</a> <a href="#"
									onclick="loginWithKakao()" id="cSignInBt"
									class="signin-social p-login_btn login-social-kakao"
									data-sns="kakao" alt="카카오로 로그인">카카오로 로그인</a> <a
									href="javascript:googleLogin()" id="gSignupBt"
									class="signin-social p-login_btn login-social-google"
									data-sns="google" alt="구글로 로그인">구글로 로그인</a>
								<div class="g-signin2" data-onsuccess="onSignIn"></div>
								<a href="#" id="nSignInBt"
									class="signin-social p-login_btn login-social-naver"
									data-sns="naver" alt="네이버로 로그인">네이버 로그인</a>
							</fieldset>

							<p class="lineor_bg">
								<span class="lineor">또는</span>
							</p>
							<div class="login-email">
								<input type="email" name="id" placeholder="이메일주소"
									autofocus="autofocus" required />
								<!-- 20160727 autofocus 추가 -->
								<input type="password" name="pwd" placeholder="영문+숫자포함 6~20자"
									required /> <a href="javascript:void(0);" class="find_pwd"
									onclick="findPwd();">비밀번호를 잊으셨나요?</a>
							</div>
							<label for="rememberemail" class="remeber_email"> <input
								type="checkbox" id="rememberemail" name="remember_email"
								class="remeber_check" />이메일기억하기
							</label>
						</div>
						<div class="modal-footer">
							<button class="btn-login_pop">로그인하기</button>
							<p class="go_signup">
								펀펀회원이 아니신가요? <a id="linkSignup" href="javascript:void(0);">회원가입</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#linkSignup").click(function() {
				$("#myModal").modal("hide");
				$("#myModal3").modal("show");
			});
			/* 	$("#emailSignup").click(function(){
					$("#myModal2").modal("hide");
					$("#myModal3").modal("show");
				}); */
		});
		function findPwd() {
			$("#myModal").modal("hide");
			$("#myModal5").modal("show");
		}
		
		function trytopay() {

			/* 		IMP.init("imp79484327");
			 //권한 불승인 !!!
			 $.ajax({
			 url :"https://api.iamport.kr/users/getToken",
			
			 crossDomain : true,
			 data : {"imp_key" : "0181304251894926", "imp_secret" : "tCrG13c6c1hA3LPBWFBnAOZhKq8cNlUhYlYZoa6Bbnbf91R5Gstghsy2THeG29Y0uW0T76vjuGyEIpKp"},
			 contentType: 'application/json; charset=utf-8',
			 dataType : "JSON",
			 success : function(data){
			 console.log(data);
			 },
			 error: function(jqXHR, textStatus, errorThrown) {
			 var err;
			 if (textStatus !== "abort" && errorThrown !== "abort") {
			 try {
			 err = $.parseJSON(jqXHR.responseText);
			 alert(err.Message);
			 } catch(e) {
			 alert("ERROR:\n" + jqXHR.responseText);
			 }
			 }
			 }
			 });	   */
			/*    var xhttp = new XMLHttpRequest();
			 xhttp.open("POST", "https://api.iamport.kr/users/getToken?_token=1a2662c58b3a491bf3bb1bd0a87c0f82b31c8be3", false);
			 xhttp.setRequestHeader("Content-type", "application/json");
			 xhttp.send();
			 console.log(xhttp.status);
			 */
		}
	</script>
	<!-- 
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">
    Modal content
    <div class="modal-content">
      <div class="modal-header">
            <span class="modal-close" data-dismiss="modal" onclick="closeSignupBox();">&nbsp;</span>
            <h2 class="p-t-signup">회원가입</h2>
       </div>
      <div class="modal-body" style="padding:30px;">
     
       삭제	<form>
              <fieldset>
                <legend class="login-title-txt">소셜 회원가입</legend>
               
                <a href="#" class="signup-social p-login_btn login-social-facebook" data-sns="facebook" alt="페이스북으로 회원가입" >페이스북으로 회원가입</a>
            	<a href="javascript:loginWithKakao();" id="custom-login-btn" class="signup-social p-login_btn login-social-kakao" alt="카카오로 회원가입" >카카오로 회원가입</a>
            	<a href="#" onclick="google();" id="gSigninBt" class="signup-social p-login_btn login-social-google" alt="구글로 회원가입" >구글로 회원가입</a>
           		<a href="#" id="nSignUpBt" class="signin-social p-login_btn login-social-naver"  data-sns="naver"  alt="네이버로 로그인" >네이버 회원가입</a>
              </fieldset>
            </form>
            <p class="lineor_bg"><span class="lineor">또는</span></p>
            <form>
              <fieldset>
                <legend class="login-title-txt">이메일 회원가입</legend>
                <a id="emailSignup" href="javascript:void(0);" class="signup-email p-login_btn" >이메일로 회원가입</a>
              </fieldset>
            </form>
            <p class="go_signup">이미 펀펀의 회원이신가요?</p>
            <button class="btn-go_login" onclick="switchToLoginBox();">로그인하러가기</button>
      </div>
    </div> 
  </div>
</div> -->
	<div id="myModal3" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span class="modal-close" data-dismiss="modal"
						onclick="closeEmailSignupBox();">&nbsp;</span>
					<h2 class="p-t-signup">회원가입</h2>
				</div>
				<div class="modal-body" style="padding: 30px;">
					<form id="join_form" action="signup.ao" method="post" onsubmit="return infoCheck(true);">
						<input type="hidden" name="secuToken"
							value="7QD6StfHBmmEFvusyATSQA" /> <input type="hidden"
							name="nmLast" value="" /> <input type="hidden" name="mobile"
							value="" />
						<fieldset class="signupFieldset" style="border: 0; margin: 0; padding: 0;">
							<legend class="signup-title-txt">기본정보</legend>
							<input type="email" id="signup-form_id" name="id"
							 placeholder="아이디(이메일)" class="sign-form_input" maxlength="35"> 
							<input type="password" id="signup-form_pw" name="pwd"
							 placeholder="영문+숫자+특수문자포함 6~20자" class="sign-form_input"  maxlength="14">
							<input type="password" id="signup-form_pw" placeholder="비밀번호확인"
							 class="sign-form_input" name=confirmPwd maxlength="14">
							<input type="text" id="signup-form_pw" name="nickname" placeholder="닉네임은 2에서 10자안에 작성해주세요"
							 class="sign-form_input" maxlength ="10">
						</fieldset>
						<div class="modal-footer">
							<button class="btn-login_pop">회원가입하기</button>
							<p class="go_signup">위의 버튼을 눌러 약관에 동의하고 회원가입합니다.</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal5" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span class="modal-close" data-dismiss="modal"
						onclick="closeEmailSignupBox();">&nbsp;</span>
					<h2 class="p-t-signup">비밀번호 찾기</h2>
				</div>
				<div class="modal-body" style="padding: 30px;">
					<form id="join_form" action="changePw.ao" method="post">
						<fieldset style="border: 0; margin: 0; padding: 0;">
							<legend class="signup-title-txt">이메일</legend>
							<input type="email" id="signup-form_id" name="email"
								placeholder="아이디(이메일)" class="sign-form_input">
						</fieldset>
						<div class="modal-footer">
							<button class="btn-login_pop">임시비밀번호 전송</button>
							<p class="go_signup">입력된 이메일로 임시비밀번호를 보내드립니다.</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="myModal9" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<span class="modal-close" data-dismiss="modal"
						onclick="closeEmailSignupBox();">&nbsp;</span>
					<h2 class="p-t-signup">비밀번호 찾기</h2>
				</div>
				<div class="modal-body" style="padding: 30px;">
					<form id="join_form" action="setPwd.ao" method="post"
						onsubmit="return checkPwd();">
						<input type="hidden" name="secuToken"
							value="7QD6StfHBmmEFvusyATSQA" /> <input type="hidden"
							name="nmLast" value="" /> <input type="hidden" name="mobile"
							value="" />
						<fieldset style="border: 0; margin: 0; padding: 0;">
							<legend class="signup-title-txt">이메일</legend>
							<input type="hidden" name="ano" value="${ano}"> <input
								type="hidden" name="email" value="${tempEmail}"> <input
								type="hidden" name="id" value="${tempEmail}"> <input
								type="text" id="signup-form_id" name="pwd" placeholder="임시비밀번호"
								class="sign-form_input"> <input type="text"
								id="signup-form_id" name="newPwd" placeholder="변경할 비밀번호"
								class="sign-form_input"> <input type="text"
								id="signup-form_id" name="confirmPwd" placeholder="비밀번호 재입력"
								class="sign-form_input">
						</fieldset>
						<div class="modal-footer">
							<button class="btn-login_pop">비밀번호 변경</button>
							<p class="go_signup">신규비밀번호를 설정합니다.</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<style>
#navlist .navheader {
	border-radius: 0px !important;
	-webkit-border-radius: 0px !important;
	-ms-border-radius: 0px !important;
	-moz-border-radius: 0px !important;
	height: 120px !important;
	position: relative;
	padding: 16px;
	background: #40C9A1;
}

#navlist .navproimage {
	width: 66px;
	height: 66px;
	margin-right: 12px;
	display: inline-block;
}

#navlist .navproimage img {
	float: left;
	border-radius: 50%;
	width: 64px;
	height: 64px;
}

#navlist .profileinfo {
	display: inline-block;
	width: 144px;
}

#navlist .profileinfo .nickname {
	font-size: 17px;
	font-weight: 500;
	line-height: 23px;
	color: #fff;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#navlist .profileinfo .username {
	font-size: 13px;
	font-weight: 400;
	line-height: 18px;
	color: #fff;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#navlist .profileinfo .accnttype {
	font-size: 12px;
	font-weight: 400;
	line-height: 16px;
	color: #fff;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#navlist .navmenu-list ul {
	padding: 7px 0 8px;
	border-bottom: 1px solid #e6eaed;
}

#navlist .navmenu-list li {
	list-style: none;
}

#navlist .navmenu-list li a {
	font-size: 15px;
	font-weight: 400;
	display: block;
	padding: 0 16px;
	height: 48px;
}

@font-face {
    font-family: myFirstFont;
    src: url('fonts/NanumBarunGothic.ttf');
    font-weight: bold;
}

body{
	font-family:myFirstFont;
}
</style>
	<div class="modal right fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div id="navlist" class="modal-content">

				<div class="modal-header navheader">
					<div class="navproimage">
						<c:if test="${empty sessionScope.account.pimage }">
							<img src="images/myinfo/basic.png">
						</c:if>
						<c:if test="${!empty sessionScope.account.pimage }">
							<img
								src="images/myinfo/<c:out value='${sessionScope.account.pimage }'/>">
						</c:if>
					</div>
					<div class="profileinfo">
						<p class="nickname">
							<c:out value="${sessionScope.account.nickname}" />님 환영합니다.
						</p>
						<p class="username">
							<c:out value="${sessionScope.account.id}" />
						</p>
						<p class="accnttype">개인투자자</p>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="navmenu-list">
						<ul>
							<li class="hidden-xs"><a href="make.do">프로젝트 등록하기</a></li>
							<li><a href="funding.it">프로젝트 둘러보기</a></li>
						</ul>
						<ul>
							<li><a href="nList.no?bname=공지사항&page=1">고객센터</a></li>
							<li><a href="myinfo.ao">회원정보보기</a>
							<c:if test="${sessionScope.account.idtype eq '관리자' }">
							<li class="hidden-xs"><a href="itemconfirm.am">관리자</a>
							</li>
							</c:if>
						</ul>
						<ul>
							<li><a href="logout.ao"
								onclick="googleSignOut();KakaoLogout();">로그아웃</a>
						</ul>
					</div>
					<div></div>
				</div>

			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->


</body>
</html>