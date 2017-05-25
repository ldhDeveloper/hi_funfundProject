<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewardList</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.background {
	background: #ff9966;
	padding: 20px;
	color: white;
}

ol li {
	list-style: none;
}

#guide {
	text-align: center;
	padding: 20px;
}

#rewardList {
	
}
input[type="checkbox"] {
    display:none;
}


</style>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script>
	
	
	
	$(function() {	
		$(".widjet").mouseenter(function(){
			$(this).css("background", "orange");
			$(this).css("cursor", "pointer");
			$(this).css("color", "white");
		});
		$(".widjet").mouseleave(function(){
			$(this).css("background", "white");
			$(this).css("color", "black");
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />

	<div class="row background">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<a style="text-align: left; font-size: 11pt"
				href="detail.it?pro_no=${item.pro_no }"><i
				class="fa fa-angle-left" aria-hidden="true"></i> 스토리로 돌아가기</a>
			<h4 align="center" class="font">
				<em>${item.category }</em> <strong>${item.pshort }</strong> 프로젝트
			</h4>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 align="center" class="font">${item.pname}</h2>
		</div>
	</div>
	<br><br><br>

	
	<div class="row">
			<div class="container">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
				<c:forEach var="fundMenu" items="${mList}" varStatus="status">
						<%-- <c:out value="${fundMenu.mname }"/> --%>
					<div id="choiceitem<c:out value='${status.index }'/>" style="border:1px blue solid;border-radius:5px;" class="widjet">
						<table>
							<tr>
								<td style="width:50px;padding:15px;">
									<input type="checkbox" name="choice" id="check-style">
									<label for="check-style"><span class="checked"><img src='images/funding/checkbox.png'></span></label>
								</td>
								<td>
									<h4><c:out value="${fundMenu.mcost }"/>원 펀딩합니다.</h4>
									<label><c:out value="${fundMenu.mname }"/></label>
									<p><c:out value="${fundMenu.mname }"/></p><br>
									배송비 : <c:out value="${fundMenu.dcost }"/> | 예상 배송일 : <c:out value="${fundMenu.mdate }"/><br>
								</td>
							</tr>
						</table>
					</div>
					<br>
    				
					
					
					
				</c:forEach>
				</div>
		</div>
	</div> 
	
	<div>
		추가 후원 금액 : <input type="text" > 원
	</div>
	<br>
	<div>
		<div>
			<label>최종 결제 금액 : 원</label>
		</div>
		<form id="payinfo" action="gopayment.fl">
		
		</form>
		<div>
			<button class="btn btn-default">취소하기</button>
			<button class="btn btn-warning" onclick="gotopay();">결제하기</button>
		</div>
		<script>
			function gotopay(){
				$("#payinfo").submit();
			}
		</script>



	</div>


</body>
</html>