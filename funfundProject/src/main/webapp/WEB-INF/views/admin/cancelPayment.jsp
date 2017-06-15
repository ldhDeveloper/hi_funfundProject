<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 결제취소</title>
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
.adminTable{
	border-left : 1px solid #dddddd;
	border-right : 1px solid #dddddd;
	border-bottom : 1px solid #dddddd;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div style="background-color:#F6F5F5">
	<div class="row" style="position: relative">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div id=itemImage class="itemImage" style="background-image: url(images/logo.png">
				<div class="itemImageBack">
					<div class="itemTextBox">
						<a class="itemname">FunFund 관리자</a>
						<br><br>
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
						<li id="info1" class="active-active"><a href="sellerconfirm.am">회원 관리</a></li>
						<li id="info2"><a href="itemconfirm.am">프로젝트 관리</a></li>
						<li id="info3"><a href="successFundding.am">펀딩금액 관리</a></li>
						<li id="info4"><a href="totalProfit.am">funfund 현황</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
	</div>
 <div class="container">
  <ul class="nav nav-tabs">
  	  <li><a href="sellerconfirm.am">판매자 승인요청</a></li>
	  <li class="active"><a href="cancelpayment.am">결제 취소요청</a></li>
 </ul>
  <table class="table table-hover adminTable">
    <thead>
      <tr>
        <th>주문번호</th>
        <th>프로젝트명</th>
        <th>품목명</th>
        <th>신청일자</th>
        <th>취소금액</th>
        <th>결제방법</th>
        <th>결제자 ID</th>
        <th>결제취소</th>
        <th>취소거부</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${cList }" varStatus="status">
      	<tr>
      		<input id="ano${status.index }" type="hidden" value="${item.ano }" />
        	<td id="fund_no${status.index }"><c:out value="${item.fund_no }"/></td>
        	<td id="pname${status.index }"><c:out value="${item.pname }"/></td>
        	<td id="mname${status.index }"><c:out value="${item.mname }"/></td>
        	<td><c:out value="${item.funddate }"/></td>
        	<td id="fcost${status.index }"><c:out value="${item.fcost }"/></td>
        	<td><c:out value="${item.payment }"/></td>
        	<td><c:out value="${item.id }"/></td>
        	<input id="evi${status.index }" type="hidden" value ="${item.evidence }"/>
        	<td><button id="appCancel${status.index }" type="button" class="btn btn-success appCancel">결제취소</button></td>
      		<td><input id="rejCancel${status.index }" type="button" class="btn btn-danger" value="결제취소거부" onclick="rejectCancel(${item.fund_no });"></td>
      	</tr>   	
      </c:forEach>
    </tbody>
  </table>
</div>
<script>
    		$(function(){
    			$("button[id ^= appCancel]").click(function(){
    				var id = $(this).attr("id");
    				var num = id.substr(id.length -1, 1);
 					var fund_no = $('#fund_no' + num).html();
 					var pname = $('#pname' + num).html();
 					var mname = $('#mname' + num).html();
 					var fcost = $('#fcost' + num).html();
 					var ano = $('#ano' + num).val();
 					$.ajax({
 	    				url : "approveCancel.am",
 	    				type : "post",
 	    				data : {"fund_no" : fund_no, "pname" : pname, "mname" : mname, "fcost" : fcost, "ano" : ano},
 	    				success : function(data){
 	    					if(data > 0){
 	    						alert("결제취소 승인에 성공하였습니다.");
 	    					location.href = "cancelpayment.am";
 	    					} else {
 	    						alert("결제취소 승인에 실패하였습니다.");
 	    					}
 	    				},
 	    				error : function(error, status){
 	    					alert("error : " + error);
 	    				}
 	    			});
    			});
    			$("input[id ^= rejCancel]").click(function(){
    				var id = $(this).attr("id");
    				var num = id.substr(id.length -1, 1);
 					var fund_no = $('#fund_no' + num).html();
 					var pname = $('#pname' + num).html();
 					var mname = $('#mname' + num).html();
 					var ano = $('#ano' + num).val();
 					$.ajax({
 	    				url : "rejectCancel.am",
 	    				type : "post",
 	    				data : {"fund_no" : fund_no, "pname" : pname, "mname" : mname, "ano" : ano},
 	    				success : function(data){
 	    					if(data > 0){
 	    						alert("결제취소 거부에 성공하였습니다.");
 	    						location.href = "cancelpayment.am";
 	    					} else {
 	    						alert("결제취소 거부에 실패하였습니다.");
 	    					}
 	    					
 	    				},
 	    				error : function(error, status){
 	    					alert("error : " + error);
 	    				}
 	    			});
    			});
    		})
</script>
<div id="pictureModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">실명확인증표</h4>
      </div>
      <div class="modal-body">
        <img id="idimage" src="#" style="width:100%">
      </div>
    </div>

  </div>
</div>
</body>
</html>