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
	text-align : center;
	background-color:#fff;
	border-radius: .28571429rem;
    border: 1px solid rgba(0,0,0,.1);
}
.thcenter{
	text-align:center;
}
.tmargin{
	margin-bottom:10px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<script>
	$(function(){
		var pro_no = "<c:out value='${proItem.pro_no}'/>";
		var ecost = "<c:out value='${proItem.ecost}'/>";
		var fundamount = "<c:out value='${proItem.fundamount}'/>";
		var persent = fundamount/ecost * 100;
		console.log("persent : " + persent);
		$("#itemPersent").html(persent + " %");
		
		/* $("tr[id ^= firstList]").click(function(){
			var name = $(this).attr("id");
			var num = name.substr(name.length - 1, 1);
			console.log("num : " + num);
			$("#detailList" + num).toggle("fast");
		}) */
		
		$("#exexport").click(function(){
			$.ajax({	
				url: "exportExcel.fl",
				type: "post",
				data : {"pro_no" : pro_no},
				success: function(data){
					console.log("성공!!?");
					$(location).attr('href', "fileDown.fl?downloadFile=" + data);
				},
				error: function(xhr, status, error){
	                alert(xhr, status, error);
	                alert("실패!!!")
	            }
			});
		});
		
		$("#eximport").click(function(){
			$("#excelFile").click();
		});
	});
	
	function tclick(a){
		var name = $(a).attr("id");
		var num = name.substr(name.length - 1, 1);
		console.log("num : " + num);
		$("#detailList" + num).toggle("fast");
	}
	
	function fileChange(){
		var form = $("inputExcelForm")[0];
		var formData = new FormData(form);
		formData.append("fileObj", $("#excelFile")[0].files[0]);
		$.ajax({
			url: "importExcel.fl",
			type: "post",
			data : formData,
			dataType : "json",
			processData : false,
			contentType : false,
			error: function(xhr, status, error){
                alert(error);
            },
            success : function(data){
              var bodyHtml = "";
              for(var i = 0; i < data.length; i++){
            		bodyHtml += "<tr id='firstList" + i + "' onclick='tclick(this);'>";
            		bodyHtml += "<td><input type='hidden' name='fund_no' value='" + data[i].fund_no + "'>" + data[i].fund_no + "</a></td>";
            		bodyHtml += "<td><input type='hidden' name='nickname' value='" + data[i].nickname + "'>" + data[i].nickname + "</a></td>";
            		bodyHtml += "<td><input type='hidden' name='mname' value='" + data[i].mname + "'>" + data[i].mname + "</a></td>";
            		bodyHtml += "<td><input type='hidden' name='tcost' value='" + data[i].tcost + "'>" + data[i].tcost + "</a></td>";
            		bodyHtml += "<td><input type='hidden' name='funstatus' value='" + data[i].funstatus + "'>" + data[i].funstatus + "</a></td>";
            		bodyHtml += "<td><input type='hidden' name='delstatus' value='" + data[i].delstatus + "'>" + data[i].delstatus + "</a></td></tr>";
            		bodyHtml += "<tr id='detailList" + i + "' style='display:none;'><td colspan='6'> <div class='row tmargin'>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>결재방법</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='payment' class='form-control' value='" + data[i].payment + "' readonly></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>결재근거</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='evidence' class='form-control' value='" + data[i].evidence + "' readonly></div></div>";
            		bodyHtml += "<div class='row tmargin'>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>수량</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='fundcount' class='form-control' value=" + data[i].fundcount + " readonly></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>수신자</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='recname' class='form-control' value='" + data[i].recname + "' readonly></div></div>";
            		bodyHtml += "<div class='row tmargin'>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>연락처</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='rephone' class='form-control' value=" + data[i].rephone + " readonly></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>이메일</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='email' class='form-control' value='" + data[i].email + "' readonly></div></div>";
            		bodyHtml += "<div class='row tmargin'>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>추가금액</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='addcost' class='form-control' value=" + data[i].addcost + " readonly></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>운송장번호</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'><input type='text' name='del_no' class='form-control' value='" + data[i].del_no + "'></div></div>";
            		bodyHtml += "<div class='row tmargin'>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-2 col-lg-2'><h6>주소</h6></div>";
            		bodyHtml += "<div class='col-xs-12 col-sm-12 col-md-10 col-lg-10'><input type='text' name='deladdress' class='form-control' value='" + data[i].deladdress + "' readonly></div></div></td></tr>";
              }
              $("#itemTableBody").html(bodyHtml);
              console.log("호출됨!!");
              $("#tchange").show();
            }
		});
	};
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
						<li id="info1" class="active-active"><a href="myproject.fl?pro_no=${proItem.pro_no }">펀딩현황</a></li>
						<li id="info2"><a href="mynewsup.up?pro_no=${proItem.pro_no }">새소식</a></li>
						<li id="info3"><a href="myprojectnews.fl?pro_no=${proItem.pro_no }">새소식쓰기</a></li>
						<li id="info4"><a href="#">댓글</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-1 col-sm-1 col-md-2 col-lg-2"></div>
		</div>
		<div class="row">
			<form action="changeSupporterList.fl" method="post">
			<input type="hidden" name="pro_no" value="${proItem.pro_no }"/>
				<div class="container">
			<table class="table table-hover funderTable">
			    <thead>
			      <tr>
			        <th class="thcenter">후원번호</th>
			        <th class="thcenter">닉네임</th>
			        <th class="thcenter">후원명</th>
			        <th class="thcenter">후원금액</th>
			        <th class="thcenter">결제상태</th>
			        <th class="thcenter">배송상태</th>
			      </tr>
			    </thead>
			    <tbody id="itemTableBody">
			      <c:forEach var="item" items="${mlist}" varStatus="status">
			      <tr id="firstList<c:out value='${status.index }'/>" onclick="tclick(this);">
			        <td><input type="hidden" name="fund_no" value="${item.fund_no }"><c:out value="${item.fund_no }"/></td>    
			        <td><input type="hidden" name="nickname" value="${item.nickname }"><c:out value="${item.nickname }"/></td>
			        <td><input type="hidden" name="mname" value="${item.mname }"><c:out value="${item.mname }"/></td>
			        <td><input type="hidden" name="tcost" value="${item.tcost }"><c:out value="${item.tcost }"/></td>
			        <td><input type="hidden" name="funstatus" value="${item.funstatus }"><c:out value="${item.funstatus }"/></td>
			        <td><input type="hidden" name="delstatus" value="${item.delstatus }"><c:out value="${item.delstatus }"/></td>
			      </tr>
			      <tr id="detailList<c:out value='${status.index }'/>" style="display:none;">
			        <td colspan="6">
			            <div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>결재방법</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="payment" class="form-control" value="${item.payment }" readonly></div>
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>결재근거</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="evidence" class="form-control" value="${item.evidence }" readonly></div>
						</div>
						<div class="row tmargin">
							<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2"><h6>수량</h6></div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><input type="text" name="fundcount" class="form-control" value="${item.fundcount }" readonly></div>
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
			  <div class="row" style="margin:0px; float:right;">
			  		<button class="btn btn-default" id="exexport" type="button">Excel Export</button>
			  		<button class="btn btn-default" id="eximport" type="button">Excel Import</button>
			  		<button class="btn btn-primary" id="tchange" style="display:none;" type="submit">변경하기</button>
			  		</form>
			  		<form name="inputExcelForm" style="display:none;">
			  		<input type="file" name="excelFile" id="excelFile" onchange="fileChange();" >
			  		</form>
			  </div>
		</div>
		</div>
		</div>
</body>
</html>