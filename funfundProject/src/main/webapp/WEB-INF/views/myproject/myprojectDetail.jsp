<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 프로젝트</title>
</head>
<style>
.itemImage {
    height: 300px;
    background-repeat: no-repeat;
    background-position: 50%;
    background-size: cover;
}
.itemImageBack {
	background : rgba(0,0,0,.5);
    /* background: linear-gradient(135deg,rgba(0,0,0,.7) 20%,transparent); */
    height: 300px;
}
.itemTextBox {
    padding-left: 3rem;
    padding-right: 3rem;
    padding-top: 3rem;
    line-height: .5;
}
.itemname {
	text-decoration: none;
	font-weight: 700;
    font-size: 1.7em;
    color: #fff;
    line-height: 1.4;
    text-shadow: 0 2px 2px rgba(0,0,0,.2);
}
.itemdetail{
    font-size: 1em;
    line-height: 1.5;
    color: #fff;
    padding-top: .4em;
    padding-left: 3rem;
    text-shadow: 0 2px 2px rgba(0,0,0,.2);
}
.menubox{
    position: relative;
    background: #fff;
    box-shadow: none;
    margin: 1rem 0;
    padding: 1em;
    border-radius: .28571429rem;
    border: 1px solid rgba(0,0,0,.1);
}
.funderTable{
	background-color:#fff;
	border-radius: .28571429rem;
    border: 1px solid rgba(0,0,0,.1);
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<script>
	$(function(){
		var ecost = "<c:out value='${proItem.ecost}'/>";
		var fundamount = "<c:out value='${proItem.fundamount}'/>";
		var persent = fundamount/ecost * 100;
		console.log("persent : " + persent);
		$("#itemPersent").html(persent + " %");
		
		$("#firstList").click(function(){
			$("#detailList").toggle();
		})
	});
</script>
<div style="background-color:#F6F5F5">
	<div class="row" style="position: relative">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div id=itemImage class="itemImage" style="background-image: url(images/funding/thumbnail/<c:out value="${proItem.thumbnail }"/>);">
				<div class="itemImageBack">
					<div class="itemTextBox">
						<a class="itemname"><c:out value="${proItem.pname }"/></a>
						<br><br>
					</div>
					<div class="itemdetail">
						<b>모인 금액</b>&nbsp;&nbsp;<span><c:out value="${proItem.fundamount }"/>&nbsp;원</span><br>
						<b>달성률</b>&nbsp;&nbsp;<span id="itemPersent"></span><br>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="row" style="top: -7.0rem; position: relative;">
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
			<div class="col-xs-10 col-sm-10 col-md-8 col-lg-8 menubox">
				<div class="middle-submenu">
					<ul class="nav nav-pills middle-submenu"
						style="width: 900px; align: center;">
						<li id="info1" class="active-active"><a href="#">펀딩현황</a></li>
						<li id="info2"><a href="#">새소식</a></li>
						<li id="info3"><a href="#">댓글</a></li>
						<li id="info4"><a href="#">문의</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
		<div class="row">
				<div class="container">
			<table class="table table-hover funderTable">
			    <thead>
			      <tr>
			        <th>후원번호</th>
			        <th>닉네임</th>
			        <th>후원명</th>
			        <th>후원금액</th>
			        <th>결제상태</th>
			        <th>배송상태</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr id="firstList">
			        <td>a</td>
			        <td>b</td>
			        <td>c</td>
			        <td>d</td>
			        <td>e</td>
			        <td>f</td>
			      </tr>
			      <tr id="detailList" style="display:none;">
			        <td colspan="6">
			            <div class="row">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>결재방법</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>결재근거</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>수량</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>수신자</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
						</div>
						<div class="row">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>연락처</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>이메일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control"></div>
						</div>	
						<div class="row">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>주소</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10"><input type="text" class="form-control"></div>
						</div>
					</td>
			      </tr>
			    </tbody>
			  </table>
		</div>
		</div>
		</div>
</body>
</html>