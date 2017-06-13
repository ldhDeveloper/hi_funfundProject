<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
<style>
.background {
	background-color: black;
	padding: 20px;
	margin: 10px;
}

.makerbox ul {
	list-style: none;
	float: left;
	padding: 10px;
	width: 100%;
	align: center;
}

.makerbox li {
	text-align: center;
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

#scrollbutton {
	position: fixed;
	right: 20px;
	width: 3%;
	text-align: center;
	display: none;
	border-radius: 10px;
	border: none;
}

#btn-like {
	background: white;
}

.comment {
	box-sizing: content-box;
	margin-top: 20px;
	margin: 10px;
}

#comment-area textarea {
	display: block;
	margin-bottom: 10px;
	margin-left: 20px;
	width: 80%;
	height: 40%;
	padding: 10px;
	font-size: 13px;
	line-height: 18px;
	border: 1px solid #e4e4e4;
	background: #fff;
	box-sizing: border-box !important;
}

.comment-area2 textarea {
	display: block;
	margin-bottom: 10px;
	margin-left: 20px;
	margin-top: 10px;
	width: 80%;
	height: 40%;
	padding: 10px;
	font-size: 13px;
	line-height: 18px;
	border: 1px solid #e4e4e4;
	background: #fff;
	box-sizing: border-box !important;
}

textarea {
	resize: none;
}

#upload {
	text-align: right;
	width: 80%;
	margin-bottom: 20px;
}

#comment-box {
	display: block;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
	bottom-border: 1px solid #e4e4e4;
	width: 80%;
	height: 40%;
	padding: 10px;
	font-size: 13px;
	line-height: 18px;
	border: 1px solid #e4e4e4;
	background: #fff;
	box-sizing: border-box !important;
}

#comment-box2 {
	display: block;
	margin-top: 20px;
	margin-left: 20px;
	margin-bottom: 20px;
	bottom-border: 1px solid #e4e4e4;
	width: 80%;
	height: 40%;
	padding: 10px;
	font-size: 13px;
	line-height: 18px;
	border: 1px solid #e4e4e4;
	background: #fff;
	box-sizing: border-box !important;
}

.cmtId {
	margin-top: 10px;
	font-size: 15px;
	height: 30px;
}

.cmtco {
	margin-bottom: 10px;
	margin-top: 10px;
	font-size: 13px;
	line-height: 18px;
	font-size: 13px;
}

.cmtda {
	display: inline-block;
	font-size: 12px;
	line-height: 12px;
	color: #92;
	margin-top: 10px;
}

.supportinfo {
	display: inline-block;
	padding: 15px;
	margin-bottom: 10px;
}

#box2 {
	padding-top: 10px;
}

.cmtst {
	display: inline-block;
	font-size: 15px;
	line-height: 15px;
	color: #92;
	margin-top: 10px;
	background: orange;
}

.img {
	display: inline-block;
	vertical-align: middle;
	margin: 5px;
	width: 40px;
	height: 40px;
}

.warning {
	background-color: #ff9800;
	border: none;
	color: white;
	width: 15%;
	height: 100%;
}
</style>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
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
		
		$('.btn-fund').hover(
				function() {
					$('.btn-fund').css('background-color', '#fedb9a').css(
							'border-color', '#c96903');
				},
				function() {
					$('.btn-fund').css('background-color', '#fec250').css(
							'border-color', 'transparent');
				});


		var co = '<c:out value="${item.pcontent}"/>';
		$("#content").html(co);

	});

	$(function() {
		$('.dapgle').hide();
		$('[id^=recmtbutton]').click(function() {
			var repId = $(this).attr("id");
			var repnum = repId.substr(repId.length - 1, 1);
			$('#comment-area'+repnum).toggle();
		});

        $('.rebtn').hide();
		$("a[id^=uprepnum]").click(function(){
			var repId = $(this).attr("id");
			var repnum = repId.substr(repId.length - 1, 1);
			console.log("repnum : " + repnum);
			var txt = $('#replynum' + repnum).text();
			$('#replynum' + repnum).hide();
			$('#updatereply' + repnum).text(txt);
			$('#updatereply' + repnum).show();	
			$('#rebutton'+repnum).show();
			$('.replydelete').hide();
			$('#re'+repnum).hide();
			});
		
		/* $("a[id^=uprepcontent]").click(function(){
			var repId = $(this).attr("id");
			var repnum = repId.substr(repId.length - 1, 1);
			location.href="update.ask?pro_no=${param.pro_no}&ask_no=${ask.ask_no}&acontent=" + $('#updatereply' + repnum).val();
		}) */
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
		
	});
	
	function updateReply(index, ask_no){
		location.href="update.ask?pro_no=${param.pro_no}&ask_no=" + ask_no + "&acontent=" + $('#updatereply' + index).val();
	}
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

	<div class="container">
		<ul class="nav nav-tabs">
			<li><a href="detail.it?pro_no=${item.pro_no }">스토리</a></li>
			<li class="active"><a href="reply.ask?pro_no=${item.pro_no }">댓글(${fn:length(aList) })</a></li>
			<li><a href="news.up?pro_no=${item.pro_no}">새소식(
					${item.upcount})</a></li>
		</ul>
	</div>

	<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 box2"
		style="padding: 10px;">
		<!-- 댓글작성 영역 -->
		<div class="comment">
			<p>${fn:length(aList) }개의댓글이달렸습니다.</p>
			<form id="comment-area" action="coinsert.ask">
				<textarea id="acontent" name="acontent" style="overflow-y: hidden;"
					rows="3" cols="50" maxlength="140;" placeholder="댓글을 입력하세요"></textarea>
				<div id="upload">
					<input type="submit" class="warning" value="댓글달기"><input
						type="hidden" value="${param.pro_no}" name="pro_no"><input
						type="hidden" value="${ask.ask_no}" name="ask_no">
				</div>
			</form>

			<c:if test="${!empty aList}">
				<div id="comment-box">
					<c:forEach var="ask" items="${aList}" varStatus="status">
						<c:if test="${ask.ask_type eq '댓글' }">
							<c:if test="${!empty ask.pimage }">
								<img class="img" src="/funfund/images/myinfo/${ask.pimage }">
							</c:if>
							<c:if test="${empty ask.pimage }">
								<img class="img" src="/funfund/images/myinfo/dimages.png">
							</c:if>
							<span class="cmtId">${ask.nickname }</span>
							<c:if test="${ask.idtype eq '메이커' }">
								<span class="cmtst">메이커</span>
							</c:if>

							<c:if test="${sessionScope.account.ano eq ask.id_no }">
								<span class="replydelete"> <a
									id="uprepnum${status.index }" style="cursor: pointer;">수정</a>&nbsp;<a
									href="delete.ask?ask_no=${ask.ask_no}&pro_no=${param.pro_no}"
									style="cursor: pointer;">삭제</a>
								</span>
							</c:if>


							<p id="replynum${status.index }" class="cmtco upcmt">${ask.ask_content }</p>
							<textarea class="form-control" id="updatereply${status.index }"
								style="display: none; width: 80%"></textarea>
							<span id="rebutton${status.index}" class="rebtn"> <a
								id="uprepcontent${status.index }" class="val"
								onclick="updateReply(${status.index }, ${ask.ask_no });"
								style="cursor: pointer;">수정</a></span>
							<span id="re${status.index }"> <span class="cmtda">${ask.ask_date }</span>

								<a id="recmtbutton${status.index }"
								style="display: inline-block; color: #92; cursor: pointer; color: orange;">답글달기</a>
							</span>
							<form action="reinsert.ask" id="comment-area${status.index }"
								class="dapgle">
								<textarea id="acontent2" name="acontent2"
									style="overflow-y: hidden;" rows="3" cols="50" maxlength="140;"
									placeholder="답글을 입력하세요"></textarea>
								<div id="upload">
									<input type="submit" class="warning" value="답글달기"> <input
										type="hidden" value="${param.pro_no}" name="pro_no"> <input
										type="hidden" value="${ask.ask_no}" name="upask_no">
								</div>
							</form>

							<hr>
						</c:if>

						<c:if test="${ask.ask_type eq '답글' }">
							<div id="comment-box2">
								<c:if test="${!empty ask.pimage }">
									<img class="img" src="/funfund/images/myinfo/${ask.pimage }">
								</c:if>
								<c:if test="${empty ask.pimage }">
									<img class="img" src="/funfund/images/myinfo/dimages.png">
								</c:if>
								<span class="cmtId">${ask.nickname }</span>
								<c:if test="${ask.idtype eq '메이커' }">
									<span class="cmtst">메이커</span>
								</c:if>
								<c:if test="${sessionScope.account.ano eq ask.id_no }">
									<a style="cursor: pointer;">수정</a>&nbsp;<a
										href="redelete.ask?ask_no=${ask.ask_no}&pro_no=${param.pro_no}">삭제</a>
									<input type="hidden" value="${ask.pro_no }" name="pro_no">
								</c:if>
								<p class="cmtco">${ask.ask_content }</p>
								<span class="cmtda">${ask.ask_date }</span>
								
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>

	<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
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
			<div id="progress" class="progress">
				<c:set var="ecost" value="${item.ecost }" />
				<c:set var="fundamount" value="${item.fundamount}" />
				<c:set var="present" value="${ fundamount * 100 / ecost}" />

				<div class="progress-bar progress-bar-warning"
					id="progressbar<c:out value='${status.index}'/>" role="progressbar"
					aria-valuenow="60" aria-valuemin="0"
					aria-valuemax="<c:out value="${item.ecost}"/>"
					style="width:${present}%;">
					<span class="sr-only"></span>
				</div>
			</div>
			<p class="info">
				<c:out value="${ fundamount * 100 / ecost}" />
				% 달성
			</p>
			<p class="info">
				<fmt:formatNumber var="fundamount" value="${item.fundamount }" />${fundamount }원의
				펀딩
			</p>
			<p class="info">${item.supportcount }명의서포터</p>
			<button class="btn-fund pay">펀딩하기</button>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-default" id="btn-like">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
			</button>
			<button class="btn btn-default backpink" id="btn-nonlike"
				style="display: none;">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
			</button>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">메이커
				정보</p>
			<div class="makerbox2">
				<p>
					<c:if test="${!empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/${item.pimage }">
					</c:if>
					<c:if test="${empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/dimages.png">
					</c:if>
				</p>
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
								<c:if test="${!empty bestList.pimage }">
									<img src="/funfund/images/myinfo/${bestList.pimage }"
										class="img">
								</c:if>
								<c:if test="${empty bestList.pimage }">
									<img class="img" src="/funfund/images/myinfo/dimages.png">
								</c:if>
							</p>
							<p>${bestList.nickname }</p>
							<p>
								<fmt:formatNumber var="mcost" value="${bestList.mcost }" />
								${mcost}원 펀딩
							</p>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty bestList}">
				  아직 서포터가 존재하지 않습니다.
				</c:if>
			</div>
		</div>

		<!-- 뷰온버튼 -->
		<button id="scrollbutton" style="bottom: 50px; color: gray"
			class="hidden-sm hidden-xs">
			<i class="fa fa-angle-up fa-2x" aria-hidden="true"
				style="display: block; color: gray;"></i>TOP
		</button>

		<div class="hidden-sm hidden-xs">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<c:forEach var="reward" items="${mList}">
				<ul class="makerbox">
					<input type="hidden" value="${reward.mno}">
					<li style="font-size: 15pt;" class="makerinfo"><strong><fmt:formatNumber
								var="mcost" value="${reward.mcost}" /> ${mcost}원</strong></li>
					<li class="makerinfo">작성자이름
						<dl>${item.pname}</dl>
					</li>
					<li class="makerinfo">품목
						<dl>${reward.mname}</dl>
					</li>
					<li class="makerinfo">리워드 예상일
						<dl>${reward.mdate}</dl>
					</li>
					<li class="makerinfo">제한 수량
						<dl>${reward.mcount }개
						</dl>
					</li>
					<li class="makerinfo current">현재 <c:set var="result"
							value="${reward.remain}" /> <c:if test="${result > 0}">
					${result }</c:if> <c:if test="${result <= 0 }">
					0
					</c:if>개 남음
					</li>
				</ul>
			</c:forEach>
		</div>

		<div class="hidden-sm hidden-xs">
			<button class="btn-fund pay">펀딩하기</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true" />

	<script>
   $(function(){
	   
	   for(var i=0; i<${fn:length(mList)}; i++){
	   $('.makerbox').hover(function() {
		   var regex = /[^0-9]/g;
		   var result=$(this).find($('.current')).html().replace(regex,'');
			  if(result> 0){
				 $(this).css('background-color', '#c6ebd9');
				 $(this).click(function(){
						var mno = $(this).children('input').val();
						location.href = "reward.fm?pro_no=${item.pro_no}&mno="+mno+"&remain="+result;
					});
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