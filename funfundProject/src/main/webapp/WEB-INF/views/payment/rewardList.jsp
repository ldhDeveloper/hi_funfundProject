<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rewardList</title>
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
<script src="/funfund/lib/js/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		var pro_no = '${item.pro_no}';
		$.ajax({
					url : "selectList.fm",
					type : "get",
					async : true,
					data : {
						"pro_no" : pro_no
					},
					success : function(data) {
						console.log(data);
						/* var html = "";
						for (var i=0; i<data.length; i++) {
							var pro_no = data[i].pro_no;
							var mno = data[i].mno;
							var mname = data[i].mname;
							var cost = data[i].mcost;
							var mcontent = data[i].mcontent;
							var mdate = data[i].mdate;
							var mnum = data[i].mnum;
							var mcount = data[i].mcount;
							var delyn = data[i].delyn;
							var dcost = data[i].dcost;
							var mdate2 = new date(mdate);
							 html += '<input type="checkbox" id="'+mno+'" value="'+mname+'">';
							html += '<label for="'+data.mList[i].mno+'">';
							html += '<span>' + data.mList[i].mcost
									+ '원 펀딩합니다.<br></span></label>';
						}
						$('#rewardList').html(html); */
					}, error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				});
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

	<div>
		<div id="guide">리워드 선택 결제 예약</div>

		<form method="post" id="" name="">
			<div id="rewardList">
				<input type="checkbox" name="menu" value=""> <label
					for="checkbox">원 펀딩합니다.</label>
			</div>
		</form>



	</div>


</body>
</html>