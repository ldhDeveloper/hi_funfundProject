<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트승인요청</title>
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
						<li id="info1" class="active-active"><a href="itemconfirm.am">프로젝트 관리</a></li>
						<li id="info2"><a href="#">펀딩금액 관리</a></li>
						<li id="info3"><a href="#">funfund 현황</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
	</div>
	<div class="container">
  <ul class="nav nav-tabs">
	  <li class="active"><a href="itemconfirm.am">프로젝트 승인요청</a></li>
	  <li><a href="requestdeleteitem.am">프로젝트 삭제요청</a></li>
	  <li><a href="resultitem.am">프로젝트 종료관리</a></li>
 </ul>  
  <table class="table table-hover adminTable">
    <thead>
      <tr>
        <th>프로젝트번호</th>
        <th>프로젝트명</th>
        <th>신청자</th>
        <th>프로젝트상태</th>
        <th>프로젝트보기</th>
        <th>프로젝트승인</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${alist }" varStatus="status">
      	<tr>
        	<td><c:out value="${item.pro_no }"/></td>
        	<td><c:out value="${item.pname }"/></td>
        	<td><c:out value="${item.cname }"/></td>
        	<td><c:out value="${item.pstatus }"/></td>
        	<td><input type="button" class="btn btn-primary" value="프로젝트보기" onclick="popen(${item.pro_no})"></td>
        	<td><span><input type="button" class="btn btn-success" value="프로젝트승인" onclick="pconfirm(${item.pro_no})"></span>
        	<span><input id="openReject<c:out value='${status.index }'/>" style="position:inline-block;" type="button" class="btn btn-warning" value="프로젝트거절" onclick="openReject(${status.index })"></span></td>        	
      	</tr>
      	<tr id="rejectform<c:out value='${status.index }'/>" style="display:none;">
      		<td>거절사유</td>
      		<td colspan="4"><input type="text" class="form-control" id="rejectcomment<c:out value='${status.index }'/>"></td>
      		<td><input style="position:inline-block;" type="button" class="btn btn-danger" value="거절사유작성" onclick="pcancel(${item.pro_no}, ${status.index })"></td>
      	</tr>
      </c:forEach>
    </tbody>
  </table>
  <script>
  	function popen(pro_no){
  		url = "detail.it?pro_no=" + pro_no;
  		window.open(url);
  	}
  	
  	function openReject(index){
  		$('#rejectform' + index).toggle();
  	}
  	
  	function pconfirm(pro_no){
  		$.post( "confirmstatus.am", {"pro_no" : pro_no})
  		.done(function(data){
			if(data > 0){
				alert("프로젝트를 승인을 성공하였습니다.");
				location.href ="itemconfirm.am";
			} else {
				alert("프로젝트를 승인을 실패하였습니다.");
				location.href ="itemconfirm.am";
			}
  		});
  	}
  	
  	function pcancel(pro_no, index){
  		console.log("pcancel실행");
  		var comment = $('#rejectcomment' + index).val();
  		console.log(comment);
  		if(comment != ""){
  			$.post( "rejectstatus.am", {"pro_no" : pro_no, "comment" : comment})
  	  		.done(function(data){
  				if(data > 0){
  					alert("프로젝트 승인을 거부하였습니다.");
  					location.href ="itemconfirm.am";
  				} else {
  					alert("프로젝트 승인거부를 실패 하였습니다.");
  					location.href ="itemconfirm.am";
  				}
  	  		});
  		}
  	}
  </script>
</div>
</body>
</html>