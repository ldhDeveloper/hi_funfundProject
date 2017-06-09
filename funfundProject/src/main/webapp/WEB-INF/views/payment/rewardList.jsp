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
<link rel="stylesheet" type="text/css" href="/funfund/lib/css/sellerinfo.css">

<style>
.background {
	background: #ff9966;
	padding: 20px;
	color: white;
}

.fun-menu {
    color: orange !important;
}

ol li {
	list-style: none;
}

#guide {
	text-align: center;
	padding: 20px;
}

.row {
    margin-right: -15px;
    margin-left: 0px !important;
}

#rewardList {
	
}
input[type="checkbox"] {
    display:none;
}
.btn-darkgray5 {
    display: inline-block;
    width: 48%;
    height: 44px;
    font-size: 13px;
    line-height: 46px;
    text-align: center;
    color: #fff;
    background: #ff9966;
    border: none;
    box-sizing: border-box;
}
.input-text1 {
    box-sizing: border-box;
    display: inline-block;
    width: 48%;
    margin-bottom: 7px;
    height: 45px;
    line-height: 48px;
    font-size: 13px;
    color: #4a4a4a;
    background: #fff;
    border: 1px solid #e4e4e4;
    outline: none;
    padding-top: 1%;
    padding-left: 4.5%;
}

.btn-warning {
    color: #fff;
    background-color: #ff9966 !important;
    border-color: #f4e7fe !important;
}

.btn-warning hover{
    color: #fff;
    background-color: #f4e7fe !important;
    border-color: #ff9966 !important;
}
</style>
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		var plustotal = 0;
		var orderlist = new Array();
		var ordercount = new Array();
		$(".checked").hide();
		
		
		$(".widjet").mouseenter(function(){
			$(this).css("background", "#ffddcc");
			$(this).css("cursor", "pointer");
			$(this).css("color", "white");
			$(this).find("[class^=ordercount]").css("color", "black");
			$(this).find("i").css("color", "#ff9966");
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
			ordercount = new Array(length);
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
			ordercount = new Array(length);
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
			ordercount = new Array(length);
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
			ordercount = new Array(length);
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
						
						
						$("#show-area").html($("#show-area").html() + "<tr style='border-radius:5px;border:1px #ddb6fb solid;padding-left:50px;'>"
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
			var tcost = $("#final-total").html();
			gotopay(orderlist, ordercount, tcost);
		});
		
	});
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
	
	//오늘은 체크되게 해보자!
	function checkbox(){
		
	}
	
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
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " align="center">
				<c:forEach var="fundMenu" items="${mList}" varStatus="status">
						<%-- <c:out value="${fundMenu.mname }"/> --%>
					<div id="choiceitem<c:out value='${status.index}'/>" style="border:1px #e2e2e2 solid; border-radius:5px; max-width:800px; max-height:230px;" class="widjet">
						
						<table>
							<tr>
								<td style="width:90px;" class="click-area">
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
									<i class="fa fa-3x fa-square-o unchecked" aria-hidden="true" style="color:#ff9966"></i>
									<i class="fa fa-3x fa-check-square-o checked" aria-hidden="true" style="color:#ff9966;display:none"></i>
								</td>
								<td style="width:50%">
									<h4><c:out value="${fundMenu.mcost}"/>원 펀딩합니다.</h4>
									<label><c:out value="${fundMenu.mname}"/></label>
									<p><c:out value="${fundMenu.mcontent}"/></p><br>
									배송비 : <c:out value="${fundMenu.dcost}"/> | 예상 배송일 : <c:out value="${fundMenu.mdate}"/><br>
									제한 수량 : <c:out value="${fundMenu.mcount}"/> | 남은 수량 : <c:out value="${fundMenu.remain}"/><br><br>
								</td>
								<td style="width:200px;min-width:150px;text-align:center;align:center;">
									<div id="plusminus" style="display:none" class="amount">
										주문수량<br>
										<i class="fa fa-minus-square fa-2x minus-btn" aria-hidden="true" style="color:#ddb6fb" id="minus"></i>
										<input type="text" value="1" size="2" style="text-align:center;" class="ordercount<c:out value='${status.index}'/>" name="fundcount">
										<i class="fa fa-plus-square fa-2x plus-btn" aria-hidden="true" style="color:#ddb6fb" id="plus"></i>
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
				<table style="width:100%;" align="center">
					<tr style="background:#ddb6fb;">
						<th colspan="4" style="color:white;text-align:center;height:50px;">
							<label >주문내역</label>
						</th>
					</tr>
				</table>
				<table  style="width:100%;" id="show-area">
				
				</table>
				<table style="width:100%;"align="center">
					<tr style="center;height:50px;">
						<td style="width:30%">&nbsp;</td>
						<td style="width:40%">&nbsp;</td>
						<td style="width:15%"><label>소계 : </label></td>
						<td style="width:15%;text-align:right;"><label id="sub-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					
					<tr style="center;height:30px;background:#f4e7fe;">
						<td>펀딩금액</td>
						<td></td>
						<td></td>
						<td style="text-align:right;"><label id="funding-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					<tr style="center;height:30px;background:#f4e7fe;">
						<td>추가 후원금</td>
						<td></td>
						<td></td>
						<td style="text-align:right;"><label id="plus-total">0</label><label>&nbsp; 원</label></td>
					</tr>
					
					<tr style="center;height:50px;background:#f4e7fe;">
						<th>최종결제금액</th>
						<td></td>
						<td></td>
						<td style="text-align:right;"><label id="final-total">0</label><label>&nbsp; 원</label></td>
					</tr>
				</table>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	<hr>
	<div id="waccountWrap">	    	
	        			<div class="waccount-wrap">
	     					<div id="waccountContainer">
					<form id="sellerChange" action="changSeller.ao" method="post" enctype="multipart/form-data" onsubmit="return saveSeller();">
		                    	<h5>수신자 성명</h5>
		       					
		       					<div class="input-area">
		       						<input type="text" class="input-text" id="rename" value=""  placeholder="이름" />
		       					</div>
		       							       					
		       					<h5>수신자 휴대폰 번호</h5>	
		       						<input type="text" class="input-text" id="rephone" name="phone" value=""  placeholder="휴대폰" />                                                            
	                           	
	                           	
								<h5>수신자 주소</h5>
		       					<div class="input-area">
		       						<input type="text" class="input-text1" id="sample6_postcode" name="address1" placeholder="우편번호" readonly/>	&nbsp;&nbsp;
		       						<input type="button" class="btn-darkgray5" onclick="sample6_execDaumPostcode();" value="우편번호 검색">
			              			<input type="text" id="sample6_address" name="address2" class="input-text" placeholder="도로명주소" readonly/> 
			              			<input type="text" id="sample6_address2" name="address3" class="input-text" placeholder="상세주소" />
                                	<p id="addrError" class="error-text">주소를 검색하세요.</p>
                                	<br>
		       					</div>
		       			</form>
		       			</div>
		     	</div>
		 </div>

	
	
	<br>
	<!-- 결제정보 전송용 -->
	<div>
		<form id="payinfo" action="gopayment.fl">
		
		
		
		
		</form>
		<div align="center">
			<button class="btn btn-default" style="margin-bottom:10px;">취소하기</button>
			<button class="btn btn-warning" id="gotopay" style="margin-bottom:10px;">결제하기</button>
		</div>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
		<script>
			
				function gotopay(orderlist, ordercount, tcost){
					var rename = $("#rename").val();
					var rephone = $("#rephone").val();
					var readdress = $("input[name=address2]").val() + " " + $("input[name=address3]").val();
					var inputaddress = $("input[name=address1]").val() + "@" + $("input[name=address2]").val() + "@" + $("input[name=address3]").val();
					var postnum = $("input[name=address1]").val();
					var cost = Number(tcost);
					console.log("orderlista : " + orderlist);
					console.log("ordercounta : " + ordercount);
					
					IMP.init('imp47847979'); 
					
					IMP.request_pay({
					    pg : 'uplus', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명: <c:out value="${item.pname}"/>',
					    amount : cost,
					    buyer_email : '<c:out value="${sessionScope.account.email}"/>',
					    buyer_name : rename,
					    buyer_tel : rephone,
					    buyer_addr : readdress,
					    buyer_postcode : readdress,
					    m_redirect_url : 'http://127.0.0.1:9998/funfund/reward.fm?pro_no='
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        $.ajax({
					        	url : "gopayment.fl",
					        	type : "post",
					        	data : {"orderlist" : orderlist, "ordercount" : ordercount, "rename" : rename, "rephone" : rephone, "address" : inputaddress, "cardnum" : rsp.imp_uid},
					        	success : function(data){
					        		alert("결제완료!");
					        		location.href="myfunding.ao";
					        	},
					        	error : function(error){
					        		alert("결제실패!!!");
					        	}
					        })
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