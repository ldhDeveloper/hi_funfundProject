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
			$("#ipersent<c:out value='${status.index }'/>").html(persent);
		});
		</script>
		<tr>
        	<td><c:out value="${item.pro_no }"/></td>
        	<td><c:out value="${item.pname }"/></td>
        	<td><c:out value="${item.cname }"/></td> 	
        	<td><c:out value="${item.pstatus }"/></td>
        	<td><c:out value="${item.pedate }"/></td>
        	<td><c:out value="${item.fundamount}"/></td>
        	<td id="ipersent<c:out value='${status.index }'/>"><c:out value="${item.pedate }"/></td>
        	
        	<td><input type="button" class="btn btn-primary" value="프로젝트보기" onclick="popen(${item.pro_no})"></td>
        	<td><span><input type="button" class="btn btn-warnning" value="정보상세보기" onclick="opendetail(${status.index })"></span></td>        	
      	</tr>
      	<tr id="detailform<c:out value='${status.index }'/>" style="display:none;">
      		<td colspan="9">
			            <div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>상호명</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="cname" class="form-control" value="${item.cname }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>회사메일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="cs_email" class="form-control" value="${item.cs_email }" readonly></div>
						</div>
						<div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>회사전화</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="cs_phone" class="form-control" value="${item.cs_phone }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>수신자</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="recname" class="form-control" value="${item.recname }" readonly></div>
						</div>
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>연락처</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="rephone" class="form-control" value="${item.rephone }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>이메일</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="email" class="form-control" value="${item.email }" readonly></div>
						</div>
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>추가금액</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="addcost<c:out value='${status.index }'/>" class="form-control" value="${item.addcost }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>운송장번호</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="del_no<c:out value='${status.index }'/>" class="form-control" value="${item.del_no }"></div>
						</div>		
						<div class="row tmargin">	
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>주소</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10"><input type="text" name="deladdress" class="form-control" value="${item.deladdress }" readonly></div>
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
  	
  	function opendetail(index){
  		$('#detailform' + index).toggle();
  	}
  
  	function pdelete(pro_no, index){
  		console.log("pcancel실행");
  		var comment = $('#deletecomment' + index).val();
  		console.log(comment);
  		if(comment != ""){
  			$.post( "deletestatus.am", {"pro_no" : pro_no, "comment" : comment})
  	  		.done(function(data){
  				if(data > 0){
  					alert("프로젝트 삭제에 성공하였습니다.");
  					location.href ="requestdeleteitem.am";
  				} else {
  					alert("프로젝트 삭제에 실패하였습니다.");
  					location.href ="requestdeleteitem.am";
  				}
  	  		});
  		}
  	}
  </script>
</div>
</body>
</html>