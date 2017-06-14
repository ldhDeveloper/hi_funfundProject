<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체이익</title>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
	$(function(){
		var ctx = document.getElementById('profitline').getContext("2d");
		var profitline = new Chart(ctx, {
		    type: 'line', 
		    data: {
		    	labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		        datasets: [{
		            label: "My First dataset",
		            backgroundColor: 'rgb(255, 99, 132)',
		            borderColor: 'rgb(255, 99, 132)',
		            data: [<c:out value="${pi.jan}"/>, <c:out value="${pi.feb}"/>, <c:out value="${pi.mar}"/>, <c:out value="${pi.apr}"/>, <c:out value="${pi.may}"/>, <c:out value="${pi.jun}"/>,
		            	<c:out value="${pi.jul}"/>, <c:out value="${pi.aug}"/>, <c:out value="${pi.sep}"/>, <c:out value="${pi.jan}"/>, <c:out value="${pi.oct}"/>, <c:out value="${pi.nov}"/>, <c:out value="${pi.dec}"/>],
		        }]
		    },

		    // Configuration options go here
		    options: {}
		});
	
		var ctx2 = document.getElementById('profitcircle').getContext("2d");
		var data2 = {
				labels : [ "테크", "패션/뷰티", "푸드", "디자인", "예술",
						"게임", "여행", "스포츠", "후원"],
				datasets : [ {
					data : [ <c:out value="${cp.tech}"/>, <c:out value="${cp.beauty}"/>,
						<c:out value="${cp.food}"/>, <c:out value="${cp.design}"/>, <c:out value="${cp.art}"/>,
							<c:out value="${cp.game}"/>, <c:out value="${cp.trip}"/>, <c:out value="${cp.sport}"/>, <c:out value="${cp.pinterest}"/> ],
					backgroundColor : [ "#F44336",
							"#D9D0D3", "#FF9800",
							"#FFEB3B", "#4CAF50", "#9C27B0", "#00BCD4", "#FFEB3B", "#009688" ]
					/* hoverBackgroundColor : [ "#FF6384",
							"#36A2EB", "#FFCE56",
							"#4BC0C0", "#E7E9ED" ] */
				} ]
			};
			doughnutChart = new Chart(ctx2, {
				type : 'doughnut',
				data : data2,
				options : {
					animation : {
						animateScale : true
					}
				}
			});
	})
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
	  <li class="active"><a href="totalProfit.am">펀딩 통계</a></li>
 </ul>
  <div class="col-xs-12 col-sm-6 col-lg-6">
  		<div class="panel panel-primary">
	  		<div class="panel-heading">월별 펀딩금액</div>
	  		<div class="panel-body">
	    		<canvas id="profitline" width="520px" height="520px">
	    		
	    		</canvas>
	  		</div>
		</div>
  </div>
  <div class="col-xs-12 col-sm-6 col-lg-6">
  		<div class="panel panel-primary">
	  		<div class="panel-heading">카테고리별 수익</div>
	  		<div class="panel-body">
	    		<canvas id="profitcircle" width="520px" height="520px">
	    		
	    		</canvas>
	  		</div>
		</div>
  </div>
</div>
</body>
</html>