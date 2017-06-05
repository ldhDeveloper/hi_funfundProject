<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공프로젝트 금액관리</title>
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
.tmargin{
	margin-bottom:10px;
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
	<script>
		$(function(){
			var list = "<c:out value='${alist}'/>"
			console.log("list : " + list);
		});
	</script>
		<div class="row" style="top: -7.0rem; position: relative;">
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
			<div class="col-xs-10 col-sm-10 col-md-8 col-lg-8 menubox">
				<div class="middle-submenu">
					<ul class="nav nav-pills middle-submenu"
						style="width: 900px; align: center;">
						<li id="info1"><a href="itemconfirm.am">프로젝트 관리</a></li>
						<li id="info2" class="active-active"><a href="successFundding.am">펀딩금액 관리</a></li>
						<li id="info3"><a href="#">funfund 현황</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
	</div>
	<div class="container">
  <ul class="nav nav-tabs">
	  <li class="active"><a href="successFundding.am">완료프로젝트 입금</a></li>
	  <li><a href="requestdeleteitem.am">지난입금내역</a></li>
 </ul>  
  <table class="table table-hover adminTable">
    <thead>
      <tr>
        <th>프로젝트번호</th>
        <th>프로젝트명</th>
        <th>달성률</th>
        <th>프로젝트상태</th>
        <th>입금상태</th>
        <th>프로젝트종료일</th>
        <th>총지급예정금액</th>
        <th>현재지급금액</th>
        <th>프로젝트보기</th>
        <th>정보상세보기</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${alist }" varStatus="status">
    	<script>
		$(function(){
			var ecost = "<c:out value='${item.ecost}'/>";
			var fundamount = "<c:out value='${item.fundamount}'/>";
			var persent = Math.round(fundamount * 100 / ecost) + "%";
			var billstatus = "<c:out value='${item.billstatus}'/>";
			var firstprice = 0;
			var secondprice = 0;
			if(<c:out value='${item.firstprice}'/> != ""){
				firstprice=Number(<c:out value='${item.firstprice}'/>);
			}
			if(<c:out value='${item.secondprice}'/> != ""){
				secondprice=Number(<c:out value='${item.secondprice}'/>);
			}
			var currentprice = firstprice+secondprice;
			$("#currentprice<c:out value='${status.index }'/>").html(currentprice);
			$("#ipersent<c:out value='${status.index }'/>").html(persent);
			if(billstatus == '미입금'){
				$("#secondprice<c:out value='${status.index }'/>").attr("readonly", "readonly");
			} 
		});
		</script>
		<tr>
        	<td><c:out value="${item.pro_no }"/></td>
        	<td><c:out value="${item.pname }"/></td>
        	<td id="ipersent<c:out value='${status.index }'/>"></td>
        	<td><c:out value="${item.pstatus }"/></td>
 			<td><c:out value="${item.billstatus }" /></td>
        	<td><c:out value="${item.pedate }"/></td>
        	<td><c:out value="${item.fundamount }"/></td>
        	<td id="currentprice<c:out value='${status.index }'/>"></td>
        	<td><input type="button" class="btn btn-primary" value="프로젝트보기" onclick="popen(${item.pro_no})"></td>
        	<td><input type="button" class="btn btn-success" value="정보상세보기" onclick="pDetailOpen(${status.index })"></td>        	
      	</tr>
      	<tr id="infoDetailForm<c:out value='${status.index }'/>" style="display:none;">
			        <td colspan="10">
			            <div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>상호명</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.cname }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>회사전화</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.cs_phone }" readonly></div>
						</div>
						<div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>회사메일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.cs_email }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>예금주</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.accpnm }" readonly></div>
						</div>
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>은행명</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.bankcode }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>계좌번호</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" class="form-control" value="${item.accnum }" readonly></div>
						</div>
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>1차입금일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input id="firstdeposit<c:out value='${status.index }'/>" type="date" class="form-control" value="${item.firstdeposit }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>1차금액</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="input-group">
							<span class="input-group-addon">￦</span>
							<input id="firstprice<c:out value='${status.index }'/>" type="number" class="form-control" value="${item.firstprice }"></div>
							</div>
						</div>		
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>2차입금일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input id="seconddeposit<c:out value='${status.index }'/>" type="date" class="form-control" value="${item.seconddeposit }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>2차금액</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><div class="input-group">
							<span class="input-group-addon">￦</span>
							<input id="secondprice<c:out value='${status.index }'/>" type="number" class="form-control" value="${item.secondprice }">
							</div></div>
						</div>
						<div class="row tmargin" style="text-align:center;">
							<span><input type="button" class="btn btn-success" value="변경하기" onclick="changeStatus(${item.pro_no}, ${status.index});"></span>
						</div>
					</td>
      	</tr>
      </c:forEach>
    </tbody>
  </table>
  <script>
  	function popen(pro_no){
  		url = "detail.it?pro_no=" + pro_no;
  		window.open(url);
  	}
  	
  	function pDetailOpen(index){
  		$('#infoDetailForm' + index).toggle();
  	}
  
  	
  	function changeStatus(pro_no, index){
  		var firstprice = "";
  		var secondprice = "";
  		  		
  		if($('#firstprice' + index).val() != ""){
  			firstprice = $('#firstprice' + index).val();
  		} else {
  			firstprice = null;
  		}
  		if($('#secondprice' + index).val() != ""){
  			secondprice = $('#secondprice' + index).val();
  		} else {
  			secondprice = null;
  		}
  		
  		console.log("firstprice : "  + firstprice);
  		console.log("secondprice : "  + secondprice);
  	
  		$.post( "changeBillStatus.am", {"pro_no" : pro_no, "firstprice" : firstprice, "secondprice" : secondprice})
	  		.done(function(data){
				if(data > 0){
					alert("펀딩금액상태 변경에 성공하였습니다.");
					location.href ="successFundding.am";
				} else {
					alert("펀딩금액상태 변경에 실패하였습니다.");
					location.href ="successFundding.am";
				}
	  		});	
  		
  	}
  </script>
</div>
</body>
</html>