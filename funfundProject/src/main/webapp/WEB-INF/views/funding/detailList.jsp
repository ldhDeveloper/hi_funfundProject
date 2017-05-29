<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<title>detailList</title>
<link href="/funfund/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<style>
.background {
	background-color: black;
	padding: 20px;
	margin: 10px;
}

ul {
	list-style: none;
	float: left;
	padding: 10px;
	width: 100%;
	align: center;
}

li {
	padding: 10px;
	text-align: center;
	display: inline-block;
}

.font {
	color: white;
}

.align {
	margin: auto;
	width: auto;
}

.box {
	margin: 10px;
	padding-top: 10px;
	text-align: center;
	align: center;
}

.box2 {
	padding-top: 10px;
}

#box2 {
	padding-top: 10px;
}

.info {
	margin-bottom: 20px;
	text-align: center;
}

.infoBar {
	display: block;
	height: 3px;
	background: #fca84e;
	margin-bottom: 20px;
	width: 100%;
	padding-left: 20px;
}

.btn-fund {
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	color: #fff;
	background: #fca84e;
	border: none;
	margin-bottom: 20px;
	text-align: center;
	align: center;
}

button {
	curser: pointer;
}

#btn-like {
	display: inline-block;
	text-align: center;
}

#btn-share {
	display: inline-block;
	text-align: center;
}

.makerbox {
	padding: 20px 19px 20px;
	border: 1px solid #eaeaea;
	margin-bottom: 20px;
	width: 100%;
	align: center;
	display: block;
	text-align: center;
}

.makerbox2 {
	padding: 20px 19px 20px;
	border: 1px solid #eaeaea;
	margin-bottom: 20px;
	width: 100%;
	align: center;
	display: block;
	text-align: center;
}

.makerinfo {
	display: inline-block;
	padding: 10px;
	text-align: center;
}

.goal {
	color: #e39402;
	background: #fedb9a;
	max-width: 790px;
	padding: 10px;
}

.guide {
	color: #423c3b;
	background: #F9F7F5;
	max-width: 790px;
	padding: 10px;
}

#content {
	box-sizing: content-box;
	margin: 10px;
}

.backpink {
	background-color: #FFC4B7 !important;
	border-color: #ee7f69 !important;
}

#btn-like {
	background: white;
}

.supportinfo {
	display: inline-block;
	padding: 15px;
}

#scrollbutton {
	position: fixed;
	right: 20px;
	width: 3%;
	text-align: center;
	display: none;
}

.img {
	display: inline-block;
	width: 40px;
	height: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		/* $('#btn-like').click(function() {
			if ($(this).hasClass("backpink")) {
				$(this).removeClass("backpink");
			} else {
				$(this).addClass("backpink");
			}
		}).hover(function() {
			if ($(this).hasClass("backpink")) {
				$(this).removeClass("backpink");
			} else {
				$(this).addClass("backpink");
			}
		}); */
		var likeList = localStorage.getItem("likeList");
		console.log("likeList : " + likeList);
		var pro_no = "_$tag___________________________";
		console.log("pro_no : " + pro_no);
		if (likeList != null && likeList.includes("${param.pro_no}")) {
			$("#btn-like").hide();
			$("#btn-nonlike").show();
		} else {
			$("#btn-like").show();
			$("#btn-nonlike").hide();
		}

		$('.btn-fund').hover(
				function() {
					$('.btn-fund').css('background-color', '#fedb9a').css(
							'border-color', '#c96903');
				},
				function() {
					$('.btn-fund').css('background-color', '#fec250').css(
							'border-color', 'transparent');
				});
		
		console.log('${item.pcontent}');
		$("#content").html('${item.pcontent}');
		$("#btn-like").click(function() {
			$.ajax({
				url : "insertMyitem.mi",
				data : {
					"pro_no" : "${param.pro_no}",
					"ano" : "${sessionScope.account.ano}"
				},
				success : function(data) {
					console.log("ajax like : " + data);
					localStorage.setItem("likeList", data);
					$("#btn-like").hide();
					$("#btn-nonlike").show();
				}
			})
		})
		$("#btn-nonlike").click(function() {
			$.ajax({
				url : "deleteMyitem.mi",
				data : {
					"pro_no" : "${param.pro_no}",
					"ano" : "${sessionScope.account.ano}"
				},
				success : function(data) {
					console.log("ajax like : " + data);
					localStorage.setItem("likeList", data);
					$("#btn-like").show();
					$("#btn-nonlike").hide();
				}
			})
		})

		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$('#scrollbutton').fadeIn("slow");
			} else {
				$("#scrollbutton").fadeOut("slow");
			}
		});

		$("#scrollbutton").click(function() {
			$("body").animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		$(".pay").click(function() {
			location.href = "reward.fm?pro_no=${item.pro_no}";
		});
	})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h4 align="center" class="font">
				<em>${item.category }</em> <strong>${item.pshort }</strong> 프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font">${item.pname}</h2>
		</div>
	</div>

	<div align="center">
		<ul class="w3-border-bottom w3-border-gray">
			<li class="active"><a href="detail.it?pro_no=${item.pro_no }">스토리</a></li>
			<li><a href="reply.ask?pro_no=${item.pro_no }">댓글(${item.repcount})</a></li>
			<li><a href="news.up?pro_no=${item.pro_no}">새소식(
					${item.upcount})</a></li>
		</ul>
	</div>


	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 box2"
		style="padding: 10px;" align="center">
		<!-- video작성영역 -->
		<c:if test="${!empty item.pvideo}">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/${item.pvideo }" frameborder="0"
				allowfullscreen></iframe>
		</c:if>
		<!-- 게시글작성영역 -->
		<div id="content"></div>
	</div>

	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
		<div class="box2 info">
			<p id="box2">
				<script>
					$(function() {
						var date = "<c:out value='${item.pedate}'/>";
						console.log("date : " + date);
						var edate = new Date(date.toString());
						var todate = new Date();
						var btMs = edate.getTime() - todate.getTime();
						console.log("btMs : " + btMs);
						var btDay = Math.round(btMs / (1000 * 60 * 60 * 24));
						console.log("btDay : " + btDay);
						$("#box2").html(btDay + "일 남음");
					});
				</script>

			</p>
			<em class="infoBar"></em>
			<p class="info">
				<c:set var="ecost" value="${item.ecost }" />
				<c:set var="fundamount" value="${item.fundamount}" />
				<c:out value="${ fundamount * 100 / ecost}" />
				% 달성
			</p>
			<p class="info">${item.fundamount }원의펀딩</p>
			<p class="info">${item.supportcount }명의서포터</p>
			<button class="btn-fund pay">펀딩하기</button>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-default" id="btn-like">
				<i class="fa fa-heart-o" aria-hidden="true"></i><i>(${item.likecount})</i>
			</button>
			<button class="btn btn-default backpink" id="btn-nonlike"
				style="display: none;">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
			</button>
			<button class="btn btn-default" id="btn-share" onclick="link();">
				<i class="fa fa-share" aria-hidden="true"></i>
			</button>
		</div>


		<script>
			/* 

			function linkWithKakaoTalk(){
			Kakao.Auth.login({
			//// Additional scope is needed to send memeo chat.
			scope: "PROFILE,TALK_MESSAGE",
			success: function(res) {
			Kakao.API.request({
			url: '/v2/api/talk/memo/send',
			data: {
			template_id: '4046',
			args: '{"${USER_NAME}": "developer","${AGE}": 20}'
			},
			success: function(res) {
			alert('success!');
			console.log(res);
			},
			fail: function(error) {
			alert('error! \n' + JSON.stringify(error));
			console.log(error);
			}
			})
			},
			fail: function(error) {
			console.log(error);
			}
			});
			
			} */
		</script>
		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">메이커
				정보</p>
			<div class="makerbox2">
				<div class="makerinfo img">
					<c:if test="${!empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/${item.pimage }">
					</c:if>
					<c:if test="${empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/dimages.png">
					</c:if>
				</div>
				<div class="makerinfo">${item.cname }</div>
				<div>
					<div class="makerinfo">문의처</div>
					<div class="makerinfo">${item.cs_email}</div>
					<div class="makerinfo">${item.cs_phone}</div>
				</div>
			</div>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">베스트
				서포터</p>
			<div class="makerbox2">
				<c:if test="${!empty bestList}">
					<c:forEach var="bestList" items="${bestList }">
						<div class="supportinfo">
							<p>
								<img src="/funfund/images/myinfo/${bestList.pimage }"
									class="img">
							</p>
							<p>${bestList.nickname }</p>
							<p>${bestList.mcost }원펀딩</p>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty bestList}">
				  아직 서포터가 존재하지 않습니다.
				</c:if>
			</div>
		</div>

		<!-- 뷰온버튼 -->
		<button id="scrollbutton" style="bottom: 50px;">
			<i class="fa fa-angle-up fa-2x" aria-hidden="true"
				style="display: block;"></i>TOP
		</button>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<c:forEach var="reward" items="${mList}" varStatus="status">
				<ul class="makerbox pay">
					<li style="font-size: 15pt;"><strong><fmt:formatNumber
								var="mcost" value="${reward.mcost}" /> ${mcost}원</strong></li>
					<li class="makerinfo">작성자이름
						<dl>${item.pname}</dl>
					</li>
					<li class="makerinfo">품목
						<dl>${reward.mname}</dl>
					</li>
					<li class="makerinfo">배송비</li>
					<dl>
						<c:if test="${null eq reward.dcost }">${reward.dcost }</c:if>
						<c:if test="${reward.dcost != '' || null ne reward.dcost}">0</c:if>
						원
					</dl>
					<li class="makerinfo">리워드 예상일
						<dl>${reward.mdate}</dl>
					</li>
					<li class="makerinfo">제한 수량</li>
					<dl>${reward.mcount }개
					</dl>
					<li class="makerinfo current">현재 
					<c:set var="result" value="${reward.remain}" /> 
					<c:if test="${result > 0}">
					${result }</c:if> 
					<c:if test="${result <= 0 }">
					0
					</c:if>개 남음
					</li>
				</ul>
			</c:forEach>
		</div>
		<div>
			<button class="btn-fund pay">펀딩하기</button>
		</div>
	</div>

	<script>
   $(function(){
	   for(var i=0; i<${fn:length(mList)}; i++){
	   $('.makerbox').hover(function() {
		   var regex = /[^0-9]/g;
		   var result=$(this).find($('.current')).html().replace(regex,'');
			  if(result> 0){
				 $(this).css('background-color', '#c6ebd9');
			  }else{
				 $(this).css('background-color', '#d9d9d9');
			  }
			}, function() {
				$(this).css('background-color', 'white');
			});
	   }
   });
</script>
</body>
</html>