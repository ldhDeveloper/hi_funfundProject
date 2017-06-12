<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료프로젝트 관리</title>
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
						<li id="info1"><a href="sellerconfirm.am">회원 관리</a></li>
						<li id="info2" class="active-active"><a href="itemconfirm.am">프로젝트 관리</a></li>
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
	  <li><a href="itemconfirm.am">프로젝트 승인요청</a></li>
	  <li><a href="requestdeleteitem.am">프로젝트 삭제요청</a></li>
	  <li class="active"><a href="resultitem.am">프로젝트 종료관리</a></li>
 </ul>  
  <table class="table table-hover adminTable">
    <thead>
      <tr>
        <th>프로젝트번호</th>
        <th>프로젝트명</th>
        <th>작성자</th>
        <th>프로젝트상태</th>
        <th>프로젝트만기일</th>
        <th>총번딩금액</th>
        <th>달성률</th>
        <th>프로젝트보기</th>
        <th>프로젝트성공/실패</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${alist }" varStatus="status">
    	<script>
		$(function(){
			var ecost = "<c:out value='${item.ecost}'/>";
			var fundamount = "<c:out value='${item.fundamount}'/>"
			var persent = Math.round(fundamount * 100 / ecost);
			$("#ipersent<c:out value='${status.index }'/>").html(persent + "%");
		});
		</script>
		<tr>
        	<td><c:out value="${item.pro_no }"/></td>
        	<td><c:out value="${item.pname }"/></td>
        	<td><c:out value="${item.cname }"/></td> 	
        	<td><c:out value="${item.pstatus }"/></td>
        	<td><c:out value="${item.pedate }"/></td>
        	<td><c:out value="${item.fundamount}"/></td>
        	<td id="ipersent<c:out value='${status.index }'/>"></td>		
        	<td><input type="button" class="btn btn-primary" value="프로젝트보기" onclick="popen(${item.pro_no})"></td>
        	<td><span><input type="button" class="btn btn-success" value="프로젝트성공" onclick="psuccess(${item.pro_no})"></span>
        	<span><input id="openReject<c:out value='${status.index }'/>" style="position:inline-block;" type="button" class="btn btn-warning" value="프로젝트실패" onclick="openFail(${status.index })"></span></td>        	
      	</tr>
      	<tr id="failform<c:out value='${status.index }'/>" style="display:none;">
      		<td>실패사유</td>
      		<td colspan="7"><input type="text" class="form-control" id="failcomment<c:out value='${status.index }'/>"></td>
      		<td><input style="position:inline-block;" type="button" class="btn btn-danger" value="실패사유작성" onclick="pfail(${item.pro_no}, ${status.index })"></td>
      	</tr>
      </c:forEach>
    </tbody>
  </table>
  <script>
  	function popen(pro_no){
  		url = "detail.it?pro_no=" + pro_no;
  		window.open(url);
  	}
  	
  	function openFail(index){
  		$('#failform' + index).toggle();
  	}
  
  	function psuccess(pro_no){
  		$.post( "successstatus.am", {"pro_no" : pro_no})
  		.done(function(data){
			if(data > 0){
				alert("프로젝트를 승인을 성공하였습니다.");
				location.href ="resultitem.am";
			} else {
				alert("프로젝트를 승인을 실패하였습니다.");
				location.href ="resultitem.am";
			}
  		});
  	}
  	
  	function pfail(pro_no, index){
  		var comment = $('#failcomment' + index).val();
  		console.log(comment);
  		if(comment != ""){
  			$.post( "failstatus.am", {"pro_no" : pro_no, "comment" : comment})
  	  		.done(function(data){
  				if(data > 0){
  					alert("프로젝트 실패에 성공하였습니다.");
  					location.href ="resultitem.am";
  				} else {
  					alert("프로젝트 실패에 실패하였습니다.");
  					location.href ="resultitem.am";
  				}
  	  		});
  		}
  	}
  </script>
</div>
</body>
</html>