<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</style>
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
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<table style="width:100%;">
					<tr style="background:rgba(255,0,255,0.2);">
						<th colspan="4" style="color:rgba(255,0,255,1);text-align:center;height:50px;">
							리워드
						</th>
					</tr>
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
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<h4>펀펀드 리워드는 결제 예약 시스템을 이용합니다.</h4>
				<ul>
					<li>쇼핑하기처럼 바로 결제되지 않습니다. 프로젝트의 성공 여부에 따라 결제가 실행됩니다.</li>
					<li>결제정보 입력 후 결제 예약을 완료하시면, 결제대기중으로 예약상태로 등록됩니다.</li>
					<li>프로젝트종료일(날짜가져와야함)의 다음 영업일에 펀딩 성공여부에 따라 결제실행/결제취소가 진행됩니다.</li>
				</ul>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div style="background:purple;color:white;padding:5px;width:110px;border-radius:5px;">결제 정보 입력</div>
				<table style="width:100%">
					<tr>
						<td colspan="2">신용(체크)카드번호</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>유효기간</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><input type="text" size="4"></td>
						<td><input type="text" size="4"></td>
						<td><input type="password" size="4"></td>
						<td><input type="password" size="4"></td>
						<td></td>
						<td><input type="text" size="4">월 /</td>
						<td><input type="text" size="4">년</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호 앞 2자리</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2">생년월일(주민등록번호 앞 6자리)</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><input type="password" size="4"></td>
						<td>**</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2"><input type="text" size="6"></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<br>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<h4>결제 예약시 주의사항</h4>
				
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				동의내용 작성
				
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	<div class="row">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10" align="center">
				<button class="btn" style="background:purple;border-radius:2px;padding:10px;color:white;" id="payment">결제 예약 하기</button>
				
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#payment").click(function(){
			$.ajax({
				url:"payment.fl",
				success:function(){
					alert("성공!!")
				}
			});
		});
	});
	
		
			
	</script>
	
</body>
</html>