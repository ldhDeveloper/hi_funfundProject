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
		
		$(".checked").hide();
		
		
		$(".widjet").mouseenter(function(){
			$(this).css("background", "orange");
			$(this).css("cursor", "pointer");
			$(this).css("color", "white");
			$(this).find(".ordercount").css("color", "black");
			$(this).find("i").css("color", "violet");
		});
		$(".widjet").mouseleave(function(){
			$(this).css("background", "white");
			$(this).css("color", "black");
		});
		
		$(".amount").find(".plus-btn").click(function(){
			event.stopPropagation();
			var i = $(this).find(".ordercount").val();
			console.log(i);
			$(this).find(".ordercount").val(i+1);
		});
		
		$(".amount").find(".minus-btn").click(function(){
			event.stopPropagation();
			$(this).find(".ordercount").val(Number($(this).find(".ordercount").val()) - 1);
		});
		
		$(".amount").find(".ordercount").click(function(){
			event.stopPropagation();
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
			var i = 0;
			$("#show-area").html("<tr><td>&nbsp</td></tr>");
			
			 $('input:checkbox[name="choice"]:checked').each(function(index) {
				arr[i] = $(this).val();
				
				//$("#show-area").html($("#show-area").html() + "<tr><td>"+ mname +"</td><td></td></tr>");
				
				i++;
				
			 });
			 
			 
			 showlist(arr);
		});
		
		function showlist(arr){
			console.log("array : " + arr);
			
			$.ajax({
				url:"selectlist.fl",
				data:{"arr": arr},
				dataType: 'json',
				success:function(data){
					console.log("length : " + data.length);
					
					
					for(var i = 0; i < data.length; i++){
						var mname = data[i].mname;
						var mcontent = data[i].mcontent;
						
						$("#show-area").html($("#show-area").html() + "<tr><td style='border-radius:5px;border:1px violet solid;padding-left:50px;background:rgba(255,0,255,0.2);'><br>리워드명 : "+ mname + "<br>"
								+ "상세설명 : " + mcontent + "<br><br>"
								+ "</td></tr>");
						
					}
				}
					
			});
			
		}
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
									제한 수량 : <c:out value="${fundMenu.mcount}"/> | 남은 수량 : <br><br>
								</td>
								<td style="width:200px;min-width:150px;text-align:center;align:center;">
									<div id="plusminus" style="display:none" class="amount">
										주문수량<br>
										<i class="fa fa-minus-square fa-2x minus-btn" aria-hidden="true" style="color:violet" id="minus"></i>
										<input type="text" value="1" size="2" style="text-align:center;" class="ordercount">
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
	
	<div>
		추가 후원 금액 : <input type="text" > 원
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
							리워드
						</th>
					</tr>
				</table>
				<table  style="width:100%;" id="show-area">
				
				</table>
				<table style="width:100%;">
					<tr style="center;height:50px;">
						<td style="width:30%">&nbsp;</td>
						<td style="width:40%">&nbsp;</td>
						<td style="width:15%">수량: 1개</td>
						<td style="width:15%;text-align:right;">59,000원</td>
					</tr>
					<tr style="center;height:50px;">
						<td>추가 후원금</td>
						<td></td>
						<td></td>
						<td style="text-align:right;">0원</td>
					</tr>
					<tr style="center;height:50px;">
						<td>배송비</td>
						<td></td>
						<td></td>
						<td style="text-align:right;">2500원</td>
					</tr>
					<tr style="center;height:30px;background:rgba(255,0,255,0.2);">
						<td>펀딩금액</td>
						<td></td>
						<td></td>
						<td style="text-align:right;">59000원</td>
					</tr>
					<tr style="center;height:30px;background:rgba(255,0,255,0.2);">
						<td>추가 후원금</td>
						<td></td>
						<td></td>
						<td style="text-align:right;">0원</td>
					</tr>
					<tr style="center;height:30px;background:rgba(255,0,255,0.2);">
						<td>배송비</td>
						<td></td>
						<td></td>
						<td style="text-align:right;">2500원</td>
					</tr>
					<tr style="center;height:50px;background:rgba(255,0,255,0.2);">
						<td style="color:rgba(255,0,255,1);">최종결제금액</td>
						<td></td>
						<td></td>
						<td style="text-align:right;color:rgba(255,0,255,1);">61500원</td>
					</tr>
				</table>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	
	
	
	<!-- 결제정보 전송용 -->
	<div>
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