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
		var plustotal = 0;
		var orderlist = new Array();
		
		$(".checked").hide();
		
		
		$(".widjet").mouseenter(function(){
			$(this).css("background", "orange");
			$(this).css("cursor", "pointer");
			$(this).css("color", "white");
			$(this).find("[class^=ordercount]").css("color", "black");
			$(this).find("i").css("color", "violet");
		});
		$(".widjet").mouseleave(function(){
			$(this).css("background", "white");
			$(this).css("color", "black");
			$(this).find("[class^=ordercount]").css("color", "black");
		});
		
		$(".amount").find(".plus-btn").click(function(){
			event.stopPropagation();
			var i = Number($(this).parent().find('input').val());
			console.log(i);
			$(this).parent().find('input').val(i+1);
		});
		
		$(".amount").find(".minus-btn").click(function(){
			event.stopPropagation();
			var i = Number($(this).parent().find('input').val());
			console.log(i);
			$(this).parent().find('input').val(i-1);
		});
		
		$(".amount").find("[class^=ordercount]").click(function(){
			event.stopPropagation();
			$(this).select();
		});
		
		$("#plusreward").keyup(function(){
			$("#plus-total").html($("#plusreward").val());
			plustotal = $("#plusreward").val();
		});
		$("#plusreward").click(function(){
			$(this).select();
		});
		
		$(".widjet").click(function(){
			$(this).find('.unchecked').toggle();
			$(this).find('.checked').toggle();
			$(this).find('#plusminus').toggle();
			if($(this).find('.flag').is(":checked")){
				$(this).find('.flag').attr("checked", false);
			}else{
				$(this).find('.flag').attr("checked", true);
			}
			
			var length = $('input:checkbox[name="choice"]:checked').length;
			console.log("length : " + length);
			var arr = new Array(length);
			var ordercount = new Array(length);
			var i = 0;
			$("#show-area").html("<tr><td>&nbsp</td></tr>");
			
			 $('input:checkbox[name="choice"]').each(function(index) {
				if($(this).is(":checked") == true){
					arr[i] = $(this).val();
					ordercount[i] = $(".ordercount"+index).val();
					
					i++;
				}else{
				}
				
			 });
			 orderlist = arr;
			 showlist(arr, ordercount, plustotal);
			 
		});
		
		$("#plusreward").change(function(){
			var length = $('input:checkbox[name="choice"]:checked').length;
			console.log("length : " + length);
			var arr = new Array(length);
			var ordercount = new Array(length);
			var i = 0;
			$("#show-area").html("<tr><td>&nbsp</td></tr>");
			
			 $('input:checkbox[name="choice"]').each(function(index) {
				if($(this).is(":checked") == true){
					arr[i] = $(this).val();
					ordercount[i] = $(".ordercount"+index).val();
					
					i++;
				}else{
				}
				
			 });
			 orderlist = arr;
			 showlist(arr, ordercount, plustotal);
		});
		
		$("[class^=ordercount]").change(function(){
			var length = $('input:checkbox[name="choice"]:checked').length;
			console.log("length : " + length);
			var arr = new Array(length);
			var ordercount = new Array(length);
			var i = 0;
			$("#show-area").html("<tr><td>&nbsp</td></tr>");
			
			 $('input:checkbox[name="choice"]').each(function(index) {
				if($(this).is(":checked") == true){
					arr[i] = $(this).val();
					ordercount[i] = $(".ordercount"+index).val();
					
					i++;
				}else{
				}
				
			 });
			 orderlist = arr;
			 showlist(arr, ordercount, plustotal);
		});
		
		$(".plus-btn, .minus-btn").click(function(){
			var length = $('input:checkbox[name="choice"]:checked').length;
			console.log("length : " + length);
			var arr = new Array(length);
			var ordercount = new Array(length);
			var i = 0;
			$("#show-area").html("<tr><td>&nbsp</td></tr>");
			
			 $('input:checkbox[name="choice"]').each(function(index) {
				if($(this).is(":checked") == true){
					arr[i] = $(this).val();
					ordercount[i] = $(".ordercount"+index).val();
					
					i++;
				}else{
				}
				
			 });
			 orderlist = arr;
			 showlist(arr, ordercount, plustotal);
		});
		
		function showlist(arr, ordercount, plustotal){
			console.log("array : " + arr);
			console.log("ordercount : " + ordercount);
			$.ajax({
				url:"selectlist.fl",
				data:{"arr": arr},
				dataType: 'json',
				success:function(data){
					console.log("length : " + data.length);
					var subtotal = 0;
					
					for(var i = 0; i < data.length; i++){
						var mname = data[i].mname;
						var mcontent = data[i].mcontent;
						var fundcount = data[i].fundcount;
						var mcost = data[i].mcost;
						
						
						$("#show-area").html($("#show-area").html() + "<tr style='border-radius:5px;border:1px violet solid;padding-left:50px;background:rgba(255,0,255,0.2);'>"
								+ "<td><br>리워드명 : "+ mname + "<br>"
								+ "상세설명 : " + mcontent + "<br><br>"
								+ "</td>"
								+ "<td><label>주문 수량 : &nbsp;</label><label>" + ordercount[i] + "</label><label>&nbsp; 개</label></td>"
								+ "<td><label>금액 : &nbsp;</label><label>" + (ordercount[i] * mcost) + "</label><label>&nbsp; 원</label></td>"
								+ "</tr>");
					
						subtotal += (ordercount[i] * mcost);
					}
					$("#sub-total").html(0);
					$("#sub-total").html(Number($("#sub-total").html()) + subtotal);
					
					$("#funding-total").html(0);
					$("#funding-total").html(subtotal);
					
					finaltotal = Number(subtotal) + Number(plustotal);
					
					$("#final-total").html(0);
					$("#final-total").html(finaltotal);
					
				}
					
			});
			
		}
		
		$("#gotopay").click(function(){
			gotopay(orderlist);
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
					<div id="choiceitem<c:out value='${status.index}'/>" style="border:1px gray solid;border-radius:5px;" class="widjet">
						
						<table>
							<tr>
								<td style="width:150px;padding:30px;" class="click-area">
									<input class="flag" type="checkbox" name="choice" value="<c:out value="${fundMenu.mno}"/>">
									<input type="hidden" class="mnum<c:out value='${status.index}'/>" value="<c:out value='${fundMenu.mnum}'/>">
									<input type="hidden" class="mno<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mno}"/>">
									<input type="hidden" class="mname<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mname}"/>">
									<input type="hidden" class="mcost<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mcost}"/>">
									<input type="hidden" class="mcontent<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mcontent}"/>">
									<input type="hidden" class="mdate<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mdate}"/>">
									<input type="hidden" class="mcount<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.mcount}"/>">
									<input type="hidden" class="delyn<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.delyn}"/>">
									<input type="hidden" class="dcost<c:out value='${status.index}'/>" value="<c:out value="${fundMenu.dcost}"/>">
									<i class="fa fa-3x fa-square-o unchecked" aria-hidden="true" style="color:violet"></i>
									<i class="fa fa-3x fa-check-square-o checked" aria-hidden="true" style="color:violet;display:none"></i>
								</td>
								<td style="width:80%">
									<h4><c:out value="${fundMenu.mcost}"/>원 펀딩합니다.</h4>
									<label><c:out value="${fundMenu.mname}"/></label>
									<p><c:out value="${fundMenu.mcontent}"/></p><br>
									배송비 : <c:out value="${fundMenu.dcost}"/> | 예상 배송일 : <c:out value="${fundMenu.mdate}"/><br>
									제한 수량 : <c:out value="${fundMenu.mcount}"/> | 남은 수량 : <c:out value="${fundMenu.remain}"/><br><br>
								</td>
								<td style="width:200px;min-width:150px;text-align:center;align:center;">
									<div id="plusminus" style="display:none" class="amount">
										주문수량<br>
										<i class="fa fa-minus-square fa-2x minus-btn" aria-hidden="true" style="color:violet" id="minus"></i>
										<input type="text" value="1" size="2" style="text-align:center;" class="ordercount<c:out value='${status.index}'/>" name="fundcount">
										<i class="fa fa-plus-square fa-2x plus-btn" aria-hidden="true" style="color:violet" id="plus"></i>
									</div>
								
									
									
								</td>
							</tr>
						</table>
					</div>
					<br>
				</c:forEach>
				</div>
		</div>
	</div> 
	
	<div align="center">
		추가 후원 금액 : <input type="text" value="0" id="plusreward" style="text-align:right"> 원
	</div>
	<br>
	<hr>
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<table style="width:100%;">
					<tr style="background:rgba(255,0,255,0.2);">
						<th colspan="4" style="color:rgba(255,0,255,1);text-align:center;height:50px;">
							<label>주문내역</label>
						</th>
					</tr>
				</table>
				<table  style="width:100%;" id="show-area">
				
				</table>
				<table style="width:100%;">
					<tr style="center;height:50px;">
						<td style="width:30%">&nbsp;</td>
						<td style="width:40%">&nbsp;</td>
						<td style="width:15%"><label>소계 : </label></td>
						<td style="width:15%;text-align:right;"><label id="sub-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					
					<tr style="center;height:30px;background:rgba(255,0,255,0.2);">
						<td>펀딩금액</td>
						<td></td>
						<td></td>
						<td style="text-align:right;"><label id="funding-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					<tr style="center;height:30px;background:rgba(255,0,255,0.2);">
						<td>추가 후원금</td>
						<td></td>
						<td></td>
						<td style="text-align:right;"><label id="plus-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					
					<tr style="center;height:50px;background:rgba(255,0,255,0.2);">
						<td style="color:rgba(255,0,255,1);">최종결제금액</td>
						<td></td>
						<td></td>
						<td style="text-align:right;color:rgba(255,0,255,1);"><label id="final-total">0</label><label>&nbsp; 원</label></td>
					</tr>
				</table>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	
	
	<br>
	<!-- 결제정보 전송용 -->
	<div>
		<form id="payinfo" action="gopayment.fl">
		
		
		
		
		</form>
		<div align="center">
			<button class="btn btn-default">취소하기</button>
			<button class="btn btn-warning" id="gotopay">결제하기</button>
		</div>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
		<script>
			
				function gotopay(orderlist){
					
					console.log("orderlist : " + orderlist);
					
					IMP.init('imp47847979'); 
					
					IMP.request_pay({
					    pg : 'uplus', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : 100,
					    buyer_email : 'iamport@siot.do',
					    buyer_name : '구매자이름',
					    buyer_tel : '010-1234-5678',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456',
					    m_redirect_url : 'http://127.0.0.1:9998/funfund/reward.fm?pro_no='
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    alert(msg);
					});
				}
			
			
		</script>
	</div>


</body>
</html>