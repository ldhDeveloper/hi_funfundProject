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

#viewon {
	position: fixed;
	right: 5px;
	z-index: 100;
	top: 600px;
}

.backpink {
	background-color: #FFC4B7 !important;
	border-color: #ee7f69 !important;
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

#comment-area2 textarea {
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

#recmtbutton {
	display: inline-block;
	font-size: 12px;
	margin-top: 10px;
	color: #92;
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
	margin:5px;
	width: 40px;
	height: 40px;
}
</style>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn-like').click(function() {
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
		});

		$('.btn-fund').hover(
				function() {
					$('.btn-fund').css('background-color', '#fedb9a').css(
							'border-color', '#c96903');
				},
				function() {
					$('.btn-fund').css('background-color', '#fec250').css(
							'border-color', 'transparent');
				});

		$('.makerbox').hover(function() {
			$(this).css('background-color', '#c6ebd9');
		}, function() {
			$(this).css('background-color', 'white');
		});

		var co = '<c:out value="${item.pcontent}"/>';
		$("#content").html(co);

	});

	$(function() {
		$('.comment-area2').hide();
		$('#recmtbutton').click(function() {
			$('.comment-area2').toggle();
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
		});
		
		/* $("a[id^=uprepcontent]").click(function(){
			var repId = $(this).attr("id");
			var repnum = repId.substr(repId.length - 1, 1);
			location.href="update.ask?pro_no=${param.pro_no}&ask_no=${ask.ask_no}&acontent=" + $('#updatereply' + repnum).val();
		}) */
		
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

	<div align="center">
		<ul class="w3-border-bottom w3-border-gray">
			<li class="active"><a href="detail.it?pro_no=${param.pro_no }">스토리</a></li>
			<li><a href="reply.ask?pro_no=${param.pro_no }">댓글(${item.repcount }
					)</a></li>
			<li><a href="news.up?pro_no=${item.pro_no}">새소식(
					${item.upcount })</a></li>
		</ul>
	</div>

	<button id="viewon" class="hidden-lg hidden-md visible-sm visible-xs">이
		프로젝트 펀딩하기</button>


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
					<input type="submit" value="댓글달기"><input type="hidden"
						value="${param.pro_no}" name="pro_no"><input type="hidden"
						value="${ask.ask_no}" name="ask_no">
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
							<p id="replynum${status.index }" class="cmtco upcmt" >${ask.ask_content }</p>
							<textarea class="form-control" id="updatereply${status.index }" style="display:none;"></textarea>
							<%-- <c:set var="acontent" value="$(.form-control).val();"/> --%>
							<span id="rebutton${status.index}" class="rebtn">
							<a id="uprepcontent${status.index }" class="val" onclick="updateReply(${status.index }, ${ask.ask_no });">수정</a><a>취소</a></span>
							<span class="cmtda">${ask.ask_date }</span>
							<c:if test="${sessionScope.account.ano eq ask.id_no }">
							 <a id="uprepnum${status.index }" style="cursor:pointer;">댓글수정</a><a href="delete.ask?ask_no=${ask.ask_no}&pro_no=${param.pro_no}">댓글삭제</a>
							</c:if>
							
							<a id="recmtbutton">답글달기</a>
							<form action="reinsert.ask" id="comment-area2"
								class="comment-area2">
								<textarea id="acontent2" name="acontent2"
									style="overflow-y: hidden;" rows="3" cols="50" maxlength="140;"
									placeholder="답글을 입력하세요"></textarea>
								<div id="upload">
									<input type="submit" value="답글달기"> <input type="hidden"
										value="${param.pro_no}" name="pro_no"> <input
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
								<p class="cmtco">${ask.ask_content }</p>
								<span class="cmtda">${ask.ask_date }</span>
								<c:if test="${sessionScope.account.ano eq ask.id_no }">
							 <a style="cursor:pointer;">답글수정</a><a href="redelete.ask?ask_no=${ask.ask_no}&pro_no=${param.pro_no}">답글삭제</a>
							 <input type="hidden" value="${ask.pro_no }" name="pro_no">
							</c:if>
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
			<em class="infoBar"></em>
			<p class="info">
				<c:set var="ecost" value="${item.ecost }" />
				<c:set var="fundamount" value="${item.fundamount}" />
				<c:out value="${ fundamount * 100 / ecost}" />
				% 달성
			</p>
			<p class="info">${item.fundamount }원의펀딩</p>
			<p class="info">${item.supportcount }명의서포터</p>
			<button class="btn-fund">펀딩하기</button>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-default" id="btn-like">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
			</button>
			<button class="btn btn-default" id="btn-share">
				<i class="fa fa-share" aria-hidden="true"></i>
			</button>
		</div>

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-top: 20px; padding-bottom: 5px; margin-left: 20px;">메이커
				정보</p>
			<div class="makerbox2">
					<c:if test="${!empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/${item.pimage }">
					</c:if>
					<c:if test="${empty item.pimage }">
						<img class="img" src="/funfund/images/myinfo/dimages.png">
					</c:if>
				<div class="makerinfo">${item.cname }</div>
				<div>
					<p>문의처</p>
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
							<p>${bestList.pimage }</p>
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

		<div class="">
			<p
				style="font-size: 10pt; text-align: left; padding-bottom: 5px; margin-left: 20px;">리워드선택</p>
			<div class=""></div>
			<c:forEach var="reward" items="${mList}">
				<ul class="makerbox">
					<li style="font-size: 15pt;"><strong>${reward.mcost}원</strong></li>
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
					<li class="makerinfo">현재 <c:set var="result"
							value="${reward.mcount - item.fundcount }" /> <c:if
							test="${result > 0}">
					${reward.mcount - item.fundcount  }</c:if> <c:if test="${result <= 0 }">
					0
					</c:if>개 남음
					</li>
				</ul>
			</c:forEach>
		</div>
		<div>
			<button class="btn-fund">펀딩하기</button>
		</div>
	</div>






</body>
</html>