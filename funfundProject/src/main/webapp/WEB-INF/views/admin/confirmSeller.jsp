<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 승인요청</title>
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
						<li id="info4"><a href="#">funfund 현황</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
	</div>
 <div class="container">
  <ul class="nav nav-tabs">
  	  <li class="active"><a href="sellerconfirm.am">판매자 승인요청</a></li>
	  <li><a href="itemconfirm.am">결제 취소요청</a></li>
 </ul>
  <table class="table table-hover adminTable">
    <thead>
      <tr>
        <th>계정번호</th>
        <th>ID</th>
        <th>계정상태</th>
        <th>휴대폰</th>
        <th>실명확인증표</th>
        <th>판매자 승인</th>
        <th>판매자 승인거부</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="item" items="${acList }" varStatus="status">
      	<tr>
        	<td><c:out value="${item.ano }"/></td>
        	<td><c:out value="${item.id }"/></td>
        	<td><c:out value="${item.idtype }"/></td>
        	<td><c:out value="${item.phone }"/></td>
        	<td><button id="showImage" value="${item.idimage }" type="button" class="btn btn-primary">실명확인증표보기</button></td>
        	<td><input type="button" class="btn btn-success" value="판매자 승인" onclick=""></td>        	
      		<td><input type="button" class="btn btn-danger" value="판매자 승인거부" onclick=""></td>
      	</tr>   	
      </c:forEach>
    </tbody>
  </table>
</div>
<script>
    		$(function(){
    			$("#showImage").click(function(){
    				var image = $(this).val();
    				$("#idimage").attr("src", "/funfund/images/myinfo/sellerinfo/" + image);
    	 			$("#pictureModal").modal();
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